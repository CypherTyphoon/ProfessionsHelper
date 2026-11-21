local ADDON_NAME, _ = ...

local ProfessionsHelper = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)

local ItemMatrix = {}
ItemMatrix.name = "ItemMatrix"

------------------------------------------------------------
-- KONFIGURATION
------------------------------------------------------------

local MATRIX_CATEGORIES = {
    [1] = "Balken",
    [2] = "Material-Icons",
    [3] = "Berufs-Icons",
}

local CATEGORY_ORDER = { 1, 2, 3 }

local NAV_ITEMS = {
    { key = "matrix", label = "PHMatrix", icon = 4549173, iconName = "inv-10-inscription2-repcontracts-scroll-02-uprez-color5" },
    { key = "cat2", label = "Material-Icons", icon = 236994, iconName = "inv-crate-07" },
    { key = "cat3", label = "Berufs-Icons", icon = 136247, iconName = "trade-leatherworking" },
    { key = "settings", label = "Einstellungen", icon = 7349175, iconName = "ui-hud-actionbar-keyring" },
}

local DISPLAY_MODES = {
    STANDARD = { label = "isInCity", description = "Nur in Städten" },
    EVERYWHERE = { label = "isCurrentExp", description = "Innerhalb der aktuellen Expansion" },
}

local ROW_HEIGHT = 42
local ICON_SIZE = 28

------------------------------------------------------------
-- INTERNE DATEN
------------------------------------------------------------

ItemMatrix.frame = nil
ItemMatrix.scrollFrame = nil
ItemMatrix.content = nil
ItemMatrix.rows = {}
ItemMatrix.items = {}
ItemMatrix.itemByID = {}

------------------------------------------------------------
-- HILFSFUNKTIONEN
------------------------------------------------------------

local function GetProfile()
    if not ProfessionsHelper.db then
        return nil
    end

    local profile = ProfessionsHelper.db.profile
    profile.itemCategoryOverrides =
        profile.itemCategoryOverrides or {}
    profile.itemDisplayModeOverrides =
        profile.itemDisplayModeOverrides or {}

    return profile
end


local function GetItemName(itemID)
    if not itemID then
        return nil
    end

    if C_Item and C_Item.GetItemNameByID then
        return C_Item.GetItemNameByID(itemID)
    end

    return GetItemInfo(itemID)
end


local function GetItemIcon(itemID)
    if not itemID then
        return nil
    end

    if C_Item and C_Item.GetItemIconByID then
        return C_Item.GetItemIconByID(itemID)
    end

    local _, _, _, _, _, _, _, _, _, icon = GetItemInfo(itemID)
    return icon
end


local function HasAnyCategory(categories)
    return categories
        and (
            categories[1] == true
            or categories[2] == true
            or categories[3] == true
        )
end


local function CopyCategories(categories)
    local copy = {}

    if categories then
        for _, category in ipairs(CATEGORY_ORDER) do
            if categories[category] == true then
                copy[category] = true
            end
        end
    end

    return copy
end


-- Quellen bleiben als Metadaten erhalten; die Matrix-Zeile wird über Item-ID gebildet.
local function GetPrimarySource(itemData)
    local sources = itemData and itemData.sources
    if type(sources) == "table" then sources = sources[1] end
    return type(sources) == "string" and sources:match("^%s*(.-)%s*$"):lower() or ""
end

local function IsCategoryTable(value)
    return type(value) == "table"
        and (value[1] ~= nil or value[2] ~= nil or value[3] ~= nil)
end


------------------------------------------------------------
-- AKTIVE DATENBANK ÜBER SPIELERPOSITION ERMITTELN
------------------------------------------------------------

local function GetActiveDatabase()
    local mapID = C_Map.GetBestMapForUnit("player")

    if not mapID or not ProfessionsHelperData then
        return nil
    end

    for expName, expData in pairs(ProfessionsHelperData) do
        if type(expData) == "table"
            and type(expData.Config) == "table"
        then
            local config = expData.Config

            -- Städte
            if config.CityMapIDs
                and config.CityMapIDs[mapID]
            then
                return expName
            end

            -- Gebiete und Parent-Maps
            if config.ParentMapIDs then
                local tempMap = mapID

                while tempMap do
                    if config.ParentMapIDs[tempMap] then
                        return expName
                    end

                    local info = C_Map.GetMapInfo(tempMap)
                    tempMap = info and info.parentMapID

                    if not tempMap or tempMap == 0 then
                        break
                    end
                end
            end
        end
    end

    return nil
end


------------------------------------------------------------
-- STANDARDKATEGORIEN
------------------------------------------------------------

function ItemMatrix:GetDefaultCategories(itemData)
    local result = {}

    if not itemData then
        return result
    end

    local category = tonumber(itemData.displayCategory)

    if category == 1
        or category == 2
        or category == 3
    then
        result[category] = true
    end

    return result
end


------------------------------------------------------------
-- GESPEICHERTE KATEGORIEN
------------------------------------------------------------

function ItemMatrix:GetCategories(item, itemData)
    local profile = GetProfile()
    local defaults = item and item.availableCategories or self:GetDefaultCategories(itemData)
    if not profile then return CopyCategories(defaults) end
    local ids = type(item) == "table" and item.ids or { item }
    for _, itemID in ipairs(ids or {}) do
        local saved = profile.itemCategoryOverrides[tostring(itemID)]
        if IsCategoryTable(saved) then return CopyCategories(saved) end
        -- Vorheriges eintragsbezogenes Format: Kategorien über Einträge zusammenführen.
        if type(saved) == "table" then
            local merged = {}
            for _, value in pairs(saved) do
                if IsCategoryTable(value) then
                    for _, cat in ipairs(CATEGORY_ORDER) do
                        if value[cat] == true then merged[cat] = true end
                    end
                end
            end
            if next(merged) then return merged end
        end
    end
    return CopyCategories(defaults)
end

function ItemMatrix:SetCategories(item, categories)
    local profile = GetProfile()
    if not profile or not item then return end
    for _, itemID in ipairs(item.ids or { item.id or item }) do
        profile.itemCategoryOverrides[tostring(itemID)] = CopyCategories(categories)
    end
end

function ItemMatrix:ResetCategories(item)
    local profile = GetProfile()
    if not profile or not item then return end
    for _, itemID in ipairs(item.ids or { item.id or item }) do
        profile.itemCategoryOverrides[tostring(itemID)] = nil
    end
end


------------------------------------------------------------
-- ANZEIGEREGELN FÜR CAT 2 UND CAT 3
------------------------------------------------------------

function ItemMatrix:GetDisplayMode(item)
    local profile = GetProfile()
    local ids = type(item) == "table" and item.ids or { item }
    if profile then
        for _, itemID in ipairs(ids or {}) do
            local mode = profile.itemDisplayModeOverrides[tostring(itemID)]
            if mode == "EVERYWHERE" or mode == "STANDARD" then
                return mode
            end
        end
    end
    return "STANDARD"
end

function ItemMatrix:SetDisplayMode(item, mode)
    local profile = GetProfile()
    if not profile or not item then return end
    if mode ~= "STANDARD" and mode ~= "EVERYWHERE" then return end

    for _, itemID in ipairs(item.ids or { item.id or item }) do
        profile.itemDisplayModeOverrides[tostring(itemID)] = mode
    end

    self:RefreshRows()
    self:RefreshVisuals()
end


------------------------------------------------------------
-- EIGENER BERUFS-SCAN (analog zu Visuals.lua)
------------------------------------------------------------

local PROFESSION_BY_SKILL_LINE = {
    [171] = "Alchemy",
    [164] = "Blacksmithing",
    [185] = "Cooking",
    [333] = "Enchanting",
    [202] = "Engineering",
    [356] = "Fishing",
    [182] = "Herbalism",
    [773] = "Inscription",
    [755] = "Jewelcrafting",
    [165] = "Leatherworking",
    [186] = "Mining",
    [393] = "Skinning",
    [197] = "Tailoring",
    [129] = "FirstAid",
}

function ItemMatrix:PerformCharacterScan()
    local profile = GetProfile()
    if not profile then return end

    profile.learnedProfessions = { ["AllProf"] = true }
    local learned = profile.learnedProfessions

    if GetProfessions and GetProfessionInfo then
        for _, professionIndex in ipairs({ GetProfessions() }) do
            if professionIndex then
                local _, _, _, _, _, _, skillLine = GetProfessionInfo(professionIndex)
                local professionName = PROFESSION_BY_SKILL_LINE[skillLine]
                if professionName then learned[professionName] = true end
            end
        end
    end

    if C_SpellBook and C_SpellBook.IsSpellKnownOrInSpellBook
        and C_SpellBook.IsSpellKnownOrInSpellBook(1256697) then
        learned["Woodcutting"] = true
    end
end

local function CanPlayerSeeItem(category, itemData)
    if not itemData or (not itemData.IDs and not itemData.spellID) then
        return false
    end

    local learned = ProfessionsHelper.db and ProfessionsHelper.db.profile
        and ProfessionsHelper.db.profile.learnedProfessions

    local function HasMatch(profEntry)
        if not profEntry then return false end
        if type(profEntry) == "table" then
            for _, profession in ipairs(profEntry) do
                if learned and learned[profession] then return true end
            end
        elseif type(profEntry) == "string" then
            if learned and learned[profEntry] then return true end
        end
        return false
    end

    if category == "Fishing" or category == "Wood" then
        return HasMatch(itemData.gatheringProf)
    end

    local displayCategory = tonumber(itemData.displayCategory) or 0
    if displayCategory == 1 or displayCategory == 5 then
        return HasMatch(itemData.gatheringProf)
    elseif displayCategory == 2 then
        return HasMatch(itemData.processingProfs)
    elseif displayCategory == 3 then
        local isMaker = HasMatch(itemData.gatheringProf)
        if isMaker then return true end
        local matchProc = HasMatch(itemData.processingProfs)
        return isMaker and matchProc
    end
    return false
end


------------------------------------------------------------
-- ITEMS AUS AKTIVER DATENBANK SAMMELN
------------------------------------------------------------

function ItemMatrix:CollectItems()
    self.items = {}
    self.itemByID = {}
    self:PerformCharacterScan()
    local activeExpansion = GetActiveDatabase()
    if not activeExpansion then
        print("|cffff9900ProfessionsHelper:|r Keine aktive Datenbank für diese Position gefunden.")
        return
    end
    local activeData = ProfessionsHelperData[activeExpansion]
    if type(activeData) ~= "table" then
        print("|cffff9900ProfessionsHelper:|r Aktive Datenbank ist ungültig: " .. tostring(activeExpansion))
        return
    end

    local byID = {}
    for categoryName, categoryData in pairs(activeData) do
        if categoryName ~= "Config" and categoryName ~= "Woodcutting" and categoryName ~= "Wood"
            and type(categoryData) == "table" then
            for itemName, itemData in pairs(categoryData) do
                if type(itemData) == "table" and type(itemData.IDs) == "table"
                    and CanPlayerSeeItem(categoryName, itemData) then
                    local dc = tonumber(itemData.displayCategory)
                    if dc and dc >= 1 and dc <= 3 then
                        for _, itemID in ipairs(itemData.IDs) do
                            if itemID then
                                local key = tostring(itemID)
                                local entry = byID[key]
                                if not entry then
                                    entry = { id = itemID, ids = { itemID }, name = itemName,
                                        data = itemData, expansion = activeExpansion,
                                        sourceCategory = categoryName, availableCategories = {},
                                        databaseEntries = {} }
                                    byID[key] = entry
                                    table.insert(self.items, entry)
                                    self.itemByID[key] = entry
                                end
                                entry.availableCategories[dc] = true
                                entry.databaseEntries[#entry.databaseEntries + 1] = {
                                    name = itemName, data = itemData, sourceCategory = categoryName,
                                    source = GetPrimarySource(itemData), displayCategory = dc }
                            end
                        end
                    end
                end
            end
        end
    end
    -- Einheitliche Primärquelle bestimmen, da pairs() keine feste Reihenfolge liefert.
    for _, item in ipairs(self.items) do
        table.sort(item.databaseEntries, function(a, b)
            local categoryA = tostring(a.sourceCategory or ""):lower()
            local categoryB = tostring(b.sourceCategory or ""):lower()
            if categoryA ~= categoryB then return categoryA < categoryB end
            return tostring(a.name or ""):lower() < tostring(b.name or ""):lower()
        end)
        if item.databaseEntries[1] then
            item.sourceCategory = item.databaseEntries[1].sourceCategory
        end
    end

    -- Datenbank-Kategorie zuerst, Itemname innerhalb der Gruppe.
    table.sort(self.items, function(a, b)
        local categoryA = tostring(a.sourceCategory or "Unbekannt"):lower()
        local categoryB = tostring(b.sourceCategory or "Unbekannt"):lower()
        if categoryA ~= categoryB then return categoryA < categoryB end
        local nameA = GetItemName(a.id) or a.name or ""
        local nameB = GetItemName(b.id) or b.name or ""
        return nameA:lower() < nameB:lower()
    end)
    print("|cff00ff00ProfessionsHelper:|r Item Matrix: " .. #self.items .. " Einträge aus " .. tostring(activeExpansion) .. " geladen.")
end


------------------------------------------------------------
-- ZEILEN ENTFERNEN
------------------------------------------------------------

function ItemMatrix:ClearRows()
    for _, row in ipairs(self.rows) do
        row:Hide()
        row:SetParent(nil)
    end

    self.rows = {}
end


------------------------------------------------------------
-- KATEGORIE ÄNDERN
------------------------------------------------------------

function ItemMatrix:SetItemCategory(item, category, enabled)
    local categories = CopyCategories(
        self:GetCategories(item, item.data)
    )

    if enabled then
        categories[category] = true
    else
        categories[category] = nil
    end

    -- Letzte Kategorie abgewählt?
    if not HasAnyCategory(categories) then
        StaticPopupDialogs[
            "PROFESSIONSHELPER_MATRIX_REMOVE_ITEM"
        ] = {
            text =
                "Dieses Item ist danach keiner Kategorie mehr zugeordnet.\n\n"
                .. "Möchtest du es wirklich aus allen drei Kategorien entfernen?",

            button1 = "Ja",
            button2 = "Abbrechen",

            OnAccept = function()
                self:SetCategories(item, {})
                self:RefreshRows()
                self:RefreshVisuals()
            end,

            OnCancel = function()
                self:RefreshRows()
            end,

            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            preferredIndex = 3,
        }

        StaticPopup_Show(
            "PROFESSIONSHELPER_MATRIX_REMOVE_ITEM"
        )

        return
    end

    self:SetCategories(item, categories)
    self:RefreshRows()
    self:RefreshVisuals()
end


------------------------------------------------------------
-- ZEILEN- UND ANSICHTSRENDERING
------------------------------------------------------------

function ItemMatrix:GetActiveDisplayRuleText(item, categories)
    categories = categories or self:GetCategories(item, item.data)

    -- Die Spalte zeigt die aktuell ausgewählten Kategorien in fester Reihenfolge.
    -- Alle Kombinationen der drei Kategorie-Buttons sind damit abgedeckt.
    local labels = {}

    if categories[1] then table.insert(labels, "Balken") end
    if categories[2] then table.insert(labels, "Material-Icon") end
    if categories[3] then table.insert(labels, "Berufs-Icon") end

    if #labels == 0 then
        return "—"
    end

    return table.concat(labels, " / ")
end

function ItemMatrix:CreateMatrixRow(item, index, yOffset)
    local row = CreateFrame("Frame", nil, self.content)
    row:SetHeight(ROW_HEIGHT)
    local y = yOffset or (32 + ((index - 1) * ROW_HEIGHT))
    row:SetPoint("TOPLEFT", 0, -y)
    row:SetPoint("TOPRIGHT", 0, -y)

    local background = row:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints()
    background:SetColorTexture(1, 1, 1, index % 2 == 0 and 0.035 or 0.015)

    local icon = row:CreateTexture(nil, "ARTWORK")
    icon:SetSize(ICON_SIZE, ICON_SIZE)
    icon:SetPoint("LEFT", 8, 0)
    icon:SetTexture(GetItemIcon(item.id) or "Interface\\Icons\\INV_Misc_QuestionMark")

    local nameText = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    nameText:SetPoint("LEFT", icon, "RIGHT", 10, 0)
    nameText:SetWidth(235)
    nameText:SetJustifyH("LEFT")
    nameText:SetWordWrap(false)
    local displayName = GetItemName(item.id) or item.name or ("Item " .. tostring(item.id))
    nameText:SetText(displayName)

    local categories = self:GetCategories(item, item.data)
    local categoryButtons = {
        { category = 1, label = "Balken", x = 265, width = 88 },
        { category = 2, label = "Material-Icon", x = 357, width = 112 },
        { category = 3, label = "Berufs-Icon", x = 473, width = 108 },
    }

    for _, buttonInfo in ipairs(categoryButtons) do
        local category = buttonInfo.category
        local label = buttonInfo.label
        local button = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
        button:SetSize(buttonInfo.width, 25)
        button:SetPoint("LEFT", row, "LEFT", buttonInfo.x, 0)
        -- Buttons bleiben immer aktiv, damit sich die Auswahl direkt
        -- wieder umschalten lässt. Der Text benennt den Zustand eindeutig.
        local isSelected = categories[category] == true
        button:SetText(label .. (isSelected and " an" or " aus"))
        button:Enable()
        button:SetAlpha(isSelected and 0.65 or 1)
        button:SetScript("OnClick", function()
            self:SetItemCategory(item, category, not isSelected)
        end)
        row["categoryButton" .. category] = button
    end

    local ruleText = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    ruleText:SetPoint("LEFT", row, "LEFT", 592, 0)
    ruleText:SetWidth(185)
    ruleText:SetJustifyH("LEFT")
    ruleText:SetWordWrap(false)
    ruleText:SetText(self:GetActiveDisplayRuleText(item, categories))
    row.activeRuleText = ruleText

    row:EnableMouse(true)
    row:SetScript("OnEnter", function(frame)
        GameTooltip:SetOwner(frame, "ANCHOR_RIGHT")
        GameTooltip:SetItemByID(item.id)
        GameTooltip:AddLine("Kategorien per Button zuordnen oder entfernen.", 1, 1, 1)
        GameTooltip:AddLine("Aktive Anzeigeregel: " .. self:GetActiveDisplayRuleText(item, categories), 0.7, 0.85, 1)
        GameTooltip:Show()
    end)
    row:SetScript("OnLeave", function() GameTooltip:Hide() end)
    table.insert(self.rows, row)
    return row
end

function ItemMatrix:CreateDisplayModeRow(item, category, index, yOffset)
    local row = CreateFrame("Frame", nil, self.content)
    row:SetHeight(ROW_HEIGHT)
    local y = yOffset or (32 + ((index - 1) * ROW_HEIGHT))
    row:SetPoint("TOPLEFT", 0, -y)
    row:SetPoint("TOPRIGHT", 0, -y)

    local background = row:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints()
    background:SetColorTexture(1, 1, 1, index % 2 == 0 and 0.035 or 0.015)

    local icon = row:CreateTexture(nil, "ARTWORK")
    icon:SetSize(ICON_SIZE, ICON_SIZE)
    icon:SetPoint("LEFT", 8, 0)
    icon:SetTexture(GetItemIcon(item.id) or "Interface\\Icons\\INV_Misc_QuestionMark")

    local nameText = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    nameText:SetPoint("LEFT", icon, "RIGHT", 10, 0)
    nameText:SetWidth(300)
    nameText:SetJustifyH("LEFT")
    nameText:SetWordWrap(false)
    nameText:SetText(GetItemName(item.id) or item.name or ("Item " .. tostring(item.id)))

    local mode = self:GetDisplayMode(item)
    local status = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    status:SetPoint("LEFT", row, "LEFT", 345, 0)
    status:SetWidth(130)
    status:SetJustifyH("LEFT")
    status:SetText(DISPLAY_MODES[mode].label)

    local cityButton = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
    cityButton:SetSize(105, 25)
    cityButton:SetPoint("RIGHT", row, "RIGHT", -118, 0)
    cityButton:SetText("isInCity")
    cityButton:SetScript("OnClick", function() self:SetDisplayMode(item, "STANDARD") end)

    local expButton = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
    expButton:SetSize(105, 25)
    expButton:SetPoint("RIGHT", row, "RIGHT", -8, 0)
    expButton:SetText("isCurrentExp")
    expButton:SetScript("OnClick", function() self:SetDisplayMode(item, "EVERYWHERE") end)

    if mode == "STANDARD" then
        cityButton:Disable()
        expButton:Enable()
    else
        cityButton:Enable()
        expButton:Disable()
    end

    row:EnableMouse(true)
    row:SetScript("OnEnter", function(frame)
        GameTooltip:SetOwner(frame, "ANCHOR_RIGHT")
        GameTooltip:SetItemByID(item.id)
        GameTooltip:AddLine(DISPLAY_MODES[mode].description, 1, 1, 1)
        GameTooltip:Show()
    end)
    row:SetScript("OnLeave", function() GameTooltip:Hide() end)
    table.insert(self.rows, row)
    return row
end

function ItemMatrix:CreateDatabaseGroupHeader(categoryName, yOffset)
    local header = CreateFrame("Frame", nil, self.content)
    header:SetHeight(26)
    header:SetPoint("TOPLEFT", 0, -yOffset)
    header:SetPoint("TOPRIGHT", 0, -yOffset)

    local background = header:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints()
    background:SetColorTexture(0.65, 0.48, 0.12, 0.16)

    local label = header:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("LEFT", header, "LEFT", 10, 0)
    label:SetText(tostring(categoryName or "Unbekannt"))

    table.insert(self.rows, header)
    return header
end

local function GetDatabaseCategoryName(item)
    return tostring(item.sourceCategory or "Unbekannt")
end

function ItemMatrix:CreateHeader(title, modeHeader)
    local header = CreateFrame("Frame", nil, self.content)
    header:SetHeight(32)
    header:SetPoint("TOPLEFT", 0, 0)
    header:SetPoint("TOPRIGHT", 0, 0)

    local itemTitle = header:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    itemTitle:SetPoint("LEFT", 12, 0)
    itemTitle:SetText(title or "Item")

    if modeHeader then
        local ruleTitle = header:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        ruleTitle:SetPoint("LEFT", header, "LEFT", 345, 0)
        ruleTitle:SetText("Aktive Anzeigeregel")
    else
        local categoryTitle = header:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        categoryTitle:SetPoint("LEFT", header, "LEFT", 265, 0)
        categoryTitle:SetText("Kategorie-Zuordnung")

        local ruleTitle = header:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        ruleTitle:SetPoint("LEFT", header, "LEFT", 592, 0)
        ruleTitle:SetText("Aktive Anzeigeregel")
    end
    return header
end

function ItemMatrix:GetItemsForCategory(category)
    local result = {}
    for _, item in ipairs(self.items) do
        local categories = self:GetCategories(item, item.data)
        if categories[category] == true then
            table.insert(result, item)
        end
    end
    return result
end

function ItemMatrix:CreateSettingsView()
    local title = self.content:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 12, -12)
    title:SetText("PHMatrix – Einstellungen")

    local info = self.content:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    info:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -18)
    info:SetPoint("RIGHT", self.content, "RIGHT", -12, 0)
    info:SetJustifyH("LEFT")
    info:SetSpacing(5)
    info:SetText(
        "Die Anzeigeregeln für Material-Icons und Berufs-Icons werden direkt in den jeweiligen Kategorien festgelegt.\n\n"
        .. "isInCity: Anzeige nur in Städten der jeweiligen Expansion.\n"
        .. "isCurrentExp: Anzeige überall innerhalb der jeweiligen aktuellen Expansion.\n\n"
        .. "Ohne individuelle Auswahl gilt isInCity. Die Regeln verändern keine Quelldaten und gelten nur für Cat 2 und Cat 3."
    )
    self.rows = { title, info }
end

function ItemMatrix:RefreshRows()
    if not self.content then return end
    self:ClearRows()
    if self.header then
        self.header:Hide()
        self.header:SetParent(nil)
        self.header = nil
    end

    if self.currentView == "settings" then
        self:CreateSettingsView()
        self.content:SetHeight(150)
        return
    end

    local yOffset = 32
    local rowIndex = 0
    local category = nil
    local items = self.items
    local modeHeader = false

    if self.currentView == "cat2" or self.currentView == "cat3" then
        category = self.currentView == "cat2" and 2 or 3
        items = self:GetItemsForCategory(category)
        modeHeader = true
        self.header = self:CreateHeader(MATRIX_CATEGORIES[category], true)
    else
        self.header = self:CreateHeader("Item", false)
    end

    local currentGroup = nil
    for _, item in ipairs(items) do
        local groupName = GetDatabaseCategoryName(item)
        if groupName ~= currentGroup then
            self:CreateDatabaseGroupHeader(groupName, yOffset)
            yOffset = yOffset + 26
            currentGroup = groupName
        end

        rowIndex = rowIndex + 1
        if modeHeader then
            self:CreateDisplayModeRow(item, category, rowIndex, yOffset)
        else
            self:CreateMatrixRow(item, rowIndex, yOffset)
        end
        yOffset = yOffset + ROW_HEIGHT
    end

    self.content:SetHeight(math.max(yOffset, 32))
end

function ItemMatrix:SetView(view)
    self.currentView = view or "matrix"
    for _, nav in ipairs(self.navButtons or {}) do
        if nav.key == self.currentView then
            nav:SetAlpha(1)
        else
            nav:SetAlpha(0.65)
        end
    end
    self:RefreshRows()
end

------------------------------------------------------------
-- VISUALS AKTUALISIEREN
------------------------------------------------------------

function ItemMatrix:RefreshVisuals()
    local visuals = ProfessionsHelper:GetModule("Visuals", true)

    if visuals and type(visuals.Init) == "function" then
        visuals:Init()
    end
end


------------------------------------------------------------
-- FENSTER ERSTELLEN
------------------------------------------------------------

function ItemMatrix:CreateWindow()
    if self.frame then return end

    local frame = CreateFrame("Frame", "ProfessionsHelperItemMatrix", UIParent, "BasicFrameTemplateWithInset")
    frame:SetSize(900, 650)
    frame:SetPoint("CENTER")
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", function() frame:StartMoving() end)
    frame:SetScript("OnDragStop", function() frame:StopMovingOrSizing() end)
    frame.TitleText:SetText("ProfessionsHelper - PHMatrix")

    local sidebar = CreateFrame("Frame", nil, frame, "BackdropTemplate")
    sidebar:SetPoint("TOPLEFT", frame, "TOPLEFT", 8, -32)
    sidebar:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 8, 45)
    sidebar:SetWidth(58)
    sidebar:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8X8" })
    sidebar:SetBackdropColor(0.025, 0.025, 0.025, 0.65)

    local description = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    description:SetPoint("TOPLEFT", sidebar, "TOPRIGHT", 14, -8)
    description:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -18, -40)
    description:SetJustifyH("LEFT")
    description:SetText("Verwalte die Kategorie-Zuordnung und Anzeigeregeln deiner Items.")

    local scrollFrame = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", sidebar, "TOPRIGHT", 10, -42)
    scrollFrame:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -32, 48)

    local content = CreateFrame("Frame", nil, scrollFrame)
    content:SetWidth(790)
    content:SetHeight(32)
    scrollFrame:SetScrollChild(content)

    self.frame = frame
    self.sidebar = sidebar
    self.scrollFrame = scrollFrame
    self.content = content
    self.navButtons = {}
    self.currentView = self.currentView or "matrix"

    for index, navItem in ipairs(NAV_ITEMS) do
        local button = CreateFrame("Button", nil, sidebar)
        button:SetSize(46, 46)
        button:SetPoint("TOP", sidebar, "TOP", 0, -12 - ((index - 1) * 58))

        local texture = button:CreateTexture(nil, "ARTWORK")
        texture:SetSize(30, 30)
        texture:SetPoint("CENTER")
        texture:SetTexture(navItem.icon)
        button.icon = texture
        button.key = navItem.key

        button:SetScript("OnEnter", function(selfButton)
            GameTooltip:SetOwner(selfButton, "ANCHOR_RIGHT")
            GameTooltip:SetText(navItem.label, 1, 1, 1)
            GameTooltip:Show()
        end)
        button:SetScript("OnLeave", function() GameTooltip:Hide() end)
        button:SetScript("OnClick", function() self:SetView(navItem.key) end)
        table.insert(self.navButtons, button)
    end

    local refreshButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    refreshButton:SetSize(100, 26)
    refreshButton:SetPoint("BOTTOMLEFT", 78, 15)
    refreshButton:SetText("Aktualisieren")
    refreshButton:SetScript("OnClick", function() self:Reload() end)

    local resetButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    resetButton:SetSize(150, 26)
    resetButton:SetPoint("LEFT", refreshButton, "RIGHT", 8, 0)
    resetButton:SetText("Overrides löschen")
    resetButton:SetScript("OnClick", function()
        StaticPopupDialogs["PROFESSIONSHELPER_MATRIX_RESET"] = {
            text = "Alle gespeicherten PHMatrix-Overrides löschen?\n\nKategorie-Zuordnungen und individuelle Anzeigeregeln werden zurückgesetzt.",
            button1 = "Zurücksetzen",
            button2 = "Abbrechen",
            OnAccept = function()
                local profile = GetProfile()
                if profile then
                    profile.itemCategoryOverrides = {}
                    profile.itemDisplayModeOverrides = {}
                end
                self:RefreshRows()
                self:RefreshVisuals()
            end,
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            preferredIndex = 3,
        }
        StaticPopup_Show("PROFESSIONSHELPER_MATRIX_RESET")
    end)

    local closeButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    closeButton:SetSize(80, 26)
    closeButton:SetPoint("BOTTOMRIGHT", -15, 15)
    closeButton:SetText("Schließen")
    closeButton:SetScript("OnClick", function() frame:Hide() end)

    frame:Hide()
    self:SetView(self.currentView)
end


------------------------------------------------------------
-- NEU LADEN
------------------------------------------------------------

function ItemMatrix:Reload()
    self:CollectItems()
    self:RefreshRows()
end


------------------------------------------------------------
-- FENSTER EIN-/AUSBLENDEN
------------------------------------------------------------

function ItemMatrix:Toggle()
    self:CreateWindow()

    if self.frame:IsShown() then
        self.frame:Hide()
    else
        self:Reload()
        self.frame:Show()
    end
end


------------------------------------------------------------
-- INITIALISIERUNG
------------------------------------------------------------

function ItemMatrix:Init()
    self:CreateWindow()

    ProfessionsHelper:RegisterChatCommand(
        "phmatrix",
        function()
            ItemMatrix:Toggle()
        end
    )
end


------------------------------------------------------------
-- MODUL REGISTRIEREN
------------------------------------------------------------

ProfessionsHelper:RegisterModule("ItemMatrix", ItemMatrix)