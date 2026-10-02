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
    if not profile then return self:GetDefaultCategories(itemData) end
    local overrides = profile.itemCategoryOverrides
    local ids = type(item) == "table" and item.ids or { item }
    for _, itemID in ipairs(ids or {}) do
        local saved = overrides[tostring(itemID)]
        if saved ~= nil then return CopyCategories(saved) end
    end
    return self:GetDefaultCategories(itemData)
end


------------------------------------------------------------
-- OVERRIDE SPEICHERN
------------------------------------------------------------

function ItemMatrix:SetCategories(item, categories)
    local profile = GetProfile()
    if not profile or not item then return end
    local ids = type(item) == "table" and item.ids or { item }
    for _, itemID in ipairs(ids or {}) do
        profile.itemCategoryOverrides[tostring(itemID)] = CopyCategories(categories)
    end
end


------------------------------------------------------------
-- OVERRIDE ZURÜCKSETZEN
------------------------------------------------------------

function ItemMatrix:ResetCategories(item)
    local profile = GetProfile()
    if not profile or not item then return end
    local ids = type(item) == "table" and item.ids or { item }
    for _, itemID in ipairs(ids or {}) do profile.itemCategoryOverrides[tostring(itemID)] = nil end
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

    local seenEntries = {}
    for categoryName, categoryData in pairs(activeData) do
        -- Holzarten aus der Matrix auslassen; die Datenbank bleibt unverändert.
        if categoryName ~= "Config" and categoryName ~= "Woodcutting" and categoryName ~= "Wood"
            and type(categoryData) == "table" then
            for itemName, itemData in pairs(categoryData) do
                if type(itemData) == "table" and type(itemData.IDs) == "table"
                    and not seenEntries[itemData] then
                    local defaultCategory = tonumber(itemData.displayCategory)
                    if (defaultCategory == 1 or defaultCategory == 2 or defaultCategory == 3)
                        and CanPlayerSeeItem(categoryName, itemData) then
                        local ids, seenIDs = {}, {}
                        for _, itemID in ipairs(itemData.IDs) do
                            if itemID and not seenIDs[tostring(itemID)] then
                                seenIDs[tostring(itemID)] = true
                                table.insert(ids, itemID)
                            end
                        end
                        if #ids > 0 then
                            local entry = { id = ids[1], ids = ids, name = itemName, data = itemData,
                                expansion = activeExpansion, sourceCategory = categoryName }
                            table.insert(self.items, entry)
                            for _, itemID in ipairs(ids) do self.itemByID[tostring(itemID)] = entry end
                            seenEntries[itemData] = true
                        end
                    end
                end
            end
        end
    end
    table.sort(self.items, function(a, b)
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
    self:RefreshVisuals()
end


------------------------------------------------------------
-- MATRIX-ZEILE ERSTELLEN
------------------------------------------------------------

function ItemMatrix:CreateRow(item, index)
    local row = CreateFrame("Frame", nil, self.content)

    row:SetHeight(ROW_HEIGHT)
    row:SetPoint(
        "TOPLEFT",
        0,
        -32 - ((index - 1) * ROW_HEIGHT)
    )
    row:SetPoint(
        "TOPRIGHT",
        0,
        -32 - ((index - 1) * ROW_HEIGHT)
    )

    -- Hintergrund
    local background = row:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints()

    if index % 2 == 0 then
        background:SetColorTexture(1, 1, 1, 0.035)
    else
        background:SetColorTexture(1, 1, 1, 0.015)
    end

    -- Icon
    local icon = row:CreateTexture(nil, "ARTWORK")
    icon:SetSize(ICON_SIZE, ICON_SIZE)
    icon:SetPoint("LEFT", 8, 0)

    icon:SetTexture(
        GetItemIcon(item.id)
        or "Interface\\Icons\\INV_Misc_QuestionMark"
    )

    -- Name
    local nameText = row:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormal"
    )

    nameText:SetPoint("LEFT", icon, "RIGHT", 10, 0)
    nameText:SetWidth(330)
    nameText:SetJustifyH("LEFT")
    nameText:SetWordWrap(false)

    local displayName = GetItemName(item.id) or item.name or ("Item " .. tostring(item.id))
    if #item.ids > 1 then
        local idList = {}
        for _, id in ipairs(item.ids) do table.insert(idList, tostring(id)) end
        displayName = displayName .. " (IDs: " .. table.concat(idList, ", ") .. ")"
    end
    nameText:SetText(displayName)

    row.nameText = nameText
    row.icon = icon

    -- Checkboxen
    local categories = self:GetCategories(item, item.data)

    for position, category in ipairs(CATEGORY_ORDER) do
        local check = CreateFrame(
            "CheckButton",
            nil,
            row,
            "UICheckButtonTemplate"
        )

        check:SetSize(26, 26)
        check:SetPoint(
            "LEFT",
            row,
            "LEFT",
            470 + ((position - 1) * 75),
            0
        )

        check:SetChecked(categories[category] == true)

        check:SetScript("OnClick", function(button)
            self:SetItemCategory(
                item,
                category,
                button:GetChecked() == true
            )
        end)

        row["check" .. category] = check
    end

    -- Tooltip
    row:EnableMouse(true)

    row:SetScript("OnEnter", function(frame)
        GameTooltip:SetOwner(frame, "ANCHOR_RIGHT")
        GameTooltip:SetItemByID(item.id)
        GameTooltip:Show()
    end)

    row:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    table.insert(self.rows, row)

    return row
end


------------------------------------------------------------
-- HEADER ERSTELLEN
------------------------------------------------------------

function ItemMatrix:CreateHeader()
    local header = CreateFrame("Frame", nil, self.content)

    header:SetHeight(32)
    header:SetPoint("TOPLEFT", 0, 0)
    header:SetPoint("TOPRIGHT", 0, 0)

    local title = header:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontHighlight"
    )

    title:SetPoint("LEFT", 12, 0)
    title:SetText("Item")

    for position, category in ipairs(CATEGORY_ORDER) do
        local text = header:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlight"
        )

        text:SetWidth(80)
        text:SetPoint(
            "LEFT",
            header,
            "LEFT",
            470 + ((position - 1) * 75),
            0
        )

        text:SetText(MATRIX_CATEGORIES[category])
    end

    return header
end


------------------------------------------------------------
-- MATRIX-ZEILEN AKTUALISIEREN
------------------------------------------------------------

function ItemMatrix:RefreshRows()
    if not self.content then
        return
    end

    self:ClearRows()

    if self.header then
        self.header:Hide()
        self.header:SetParent(nil)
        self.header = nil
    end

    self.header = self:CreateHeader()

    for index, item in ipairs(self.items) do
        self:CreateRow(item, index)
    end

    local height = 32 + (#self.items * ROW_HEIGHT)
    self.content:SetHeight(math.max(height, 32))
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
    if self.frame then
        return
    end

    local frame = CreateFrame(
        "Frame",
        "ProfessionsHelperItemMatrix",
        UIParent,
        "BasicFrameTemplateWithInset"
    )

    frame:SetSize(760, 650)
    frame:SetPoint("CENTER")
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")

    frame:SetScript("OnDragStart", function()
        frame:StartMoving()
    end)

    frame:SetScript("OnDragStop", function()
        frame:StopMovingOrSizing()
    end)

    frame.TitleText:SetText("ProfessionsHelper - Item Matrix")

    -- Beschreibung
    local description = frame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormal"
    )

    description:SetPoint("TOPLEFT", 18, -38)
    description:SetPoint("TOPRIGHT", -18, -38)
    description:SetJustifyH("LEFT")

    description:SetText(
        "Lege fest, welchen Kategorien die Items zugeordnet sind."
    )

    -- ScrollFrame
    local scrollFrame = CreateFrame(
        "ScrollFrame",
        nil,
        frame,
        "UIPanelScrollFrameTemplate"
    )

    scrollFrame:SetPoint("TOPLEFT", 12, -68)
    scrollFrame:SetPoint("BOTTOMRIGHT", -32, 48)

    local content = CreateFrame("Frame", nil, scrollFrame)
    content:SetWidth(700)
    content:SetHeight(32)

    scrollFrame:SetScrollChild(content)

    self.frame = frame
    self.scrollFrame = scrollFrame
    self.content = content

    -- Aktualisieren
    local refreshButton = CreateFrame(
        "Button",
        nil,
        frame,
        "UIPanelButtonTemplate"
    )

    refreshButton:SetSize(100, 26)
    refreshButton:SetPoint("BOTTOMLEFT", 15, 15)
    refreshButton:SetText("Aktualisieren")

    refreshButton:SetScript("OnClick", function()
        self:Reload()
    end)

    -- Overrides zurücksetzen
    local resetButton = CreateFrame(
        "Button",
        nil,
        frame,
        "UIPanelButtonTemplate"
    )

    resetButton:SetSize(150, 26)
    resetButton:SetPoint("BOTTOMLEFT", 125, 15)
    resetButton:SetText("Overrides löschen")

    resetButton:SetScript("OnClick", function()
        StaticPopupDialogs[
            "PROFESSIONSHELPER_MATRIX_RESET"
        ] = {
            text =
                "Alle gespeicherten Kategorie-Overrides löschen?\n\n"
                .. "Die ursprünglichen displayCategory-Werte werden wieder verwendet.",

            button1 = "Zurücksetzen",
            button2 = "Abbrechen",

            OnAccept = function()
                local profile = GetProfile()

                if profile then
                    profile.itemCategoryOverrides = {}
                end

                self:RefreshRows()
                self:RefreshVisuals()
            end,

            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            preferredIndex = 3,
        }

        StaticPopup_Show(
            "PROFESSIONSHELPER_MATRIX_RESET"
        )
    end)

    -- Schließen
    local closeButton = CreateFrame(
        "Button",
        nil,
        frame,
        "UIPanelButtonTemplate"
    )

    closeButton:SetSize(80, 26)
    closeButton:SetPoint("BOTTOMRIGHT", -15, 15)
    closeButton:SetText("Schließen")

    closeButton:SetScript("OnClick", function()
        frame:Hide()
    end)

    frame:Hide()
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