-- FishingInputMode.lua 
-- ProfessionsHelper Item Data

-- ============================================================
-- FishingInputMode.lua
-- ProfessionsHelper - Angeln Input Mode
--
-- Dieses Modul verändert NICHT ProfessionsHelperData.
-- Es erzeugt lediglich fertigen Lua-Code zum Übernehmen
-- in die jeweilige Datenbankdatei.
-- ============================================================

local ADDON_NAME, _ = ...

local FishingInputMode = {}
FishingInputMode.name = "FishingInputMode"

------------------------------------------------------------
-- Einstellungen
------------------------------------------------------------

local DATABASES = {
    "Classic",
    "BurningCrusade",
    "Wrath of Lich King",
    "Cataclysm",
    "Mists of Pandaria",
    "Warlords of Draenor",
    "Legion",
    "Battle for Azeroth",
    "Shadowlands",
    "Dragonflight",
    "The War Within",
    "Midnight",
    "The Last Titan",
    "Forever",
}

local PROCESSING_PROFS = {
    "Alchemy",
    "Blacksmithing",
    "Enchanting",
    "Engineering",
    "Inscription",
    "Jewelcrafting",
    "Leatherworking",
    "Tailoring",
    "Cooking",
    "FirstAid",
    "Herbalism",
    "Mining",
    "Skinning",
}

-- Diese Tabellen gehören zur Datenbankstruktur, sind aber
-- keine normalen Item-Kategorien.
local CATEGORY_IGNORE = {
    Config = true,
    AllProf = true,
    Skills = true,
}

------------------------------------------------------------
-- Interne Daten
------------------------------------------------------------

FishingInputMode.selectedDatabase = "Forever"
FishingInputMode.selectedProcessingProfs = {}

FishingInputMode.itemIDs = {}
FishingInputMode.itemNames = {}

-- Neue Kategorie / Kategorie-Header
FishingInputMode.newCategoryMode = false
FishingInputMode.newCategoryExpansion = "Forever"
FishingInputMode.newCategoryName = nil

FishingInputMode.frame = nil
FishingInputMode.idBox = nil
FishingInputMode.nameText = nil
FishingInputMode.outputBox = nil
FishingInputMode.categoryDrop = nil
FishingInputMode.expansionDrop = nil
FishingInputMode.newCategoryCheck = nil
FishingInputMode.contentFrame = nil
FishingInputMode.expansionLabel = nil
FishingInputMode.newCategoryLabel = nil

------------------------------------------------------------
-- Hilfsfunktionen
------------------------------------------------------------

local function Trim(value)
    return value:match("^%s*(.-)%s*$")
end

local function Contains(tbl, value)
    for _, v in ipairs(tbl) do
        if v == value then
            return true
        end
    end

    return false
end

local function RemoveValue(tbl, value)
    for i = #tbl, 1, -1 do
        if tbl[i] == value then
            table.remove(tbl, i)
            return
        end
    end
end

local function SanitizeLuaKey(value, fallback)
    local key = Trim(tostring(value or ""))

    key = key:gsub("[^%w_]", "_")
    key = key:gsub("_+", "_")
    key = key:gsub("^_+", "")
    key = key:gsub("_+$", "")

    if key == "" then
        key = fallback or "New_Item"
    end

    -- Lua-Identifier darf nicht mit einer Zahl beginnen.
    if key:match("^%d") then
        key = "_" .. key
    end

    return key
end

------------------------------------------------------------
-- Bekannte Datenbank-Kategorien lesen
------------------------------------------------------------

function FishingInputMode:GetKnownCategories(expansion)
    local categories = {}

    if not expansion then
        return categories
    end

    if not ProfessionsHelperData then
        return categories
    end

    local database = ProfessionsHelperData[expansion]

    if not database then
        return categories
    end

    for category, value in pairs(database) do
        if type(category) == "string"
            and type(value) == "table"
            and not CATEGORY_IGNORE[category]
        then
            table.insert(categories, category)
        end
    end

    table.sort(categories)

    return categories
end

------------------------------------------------------------
-- IDs aus Text lesen
------------------------------------------------------------

function FishingInputMode:ParseIDs(text)
    local ids = {}

    -- Alles außer Zahlen als Trennzeichen behandeln.
    -- Damit funktionieren:
    --
    -- 12345
    -- 12345, 12346, 12347
    -- 12345 12346 12347
    -- 12345
    -- 12346
    --
    for idString in tostring(text or ""):gmatch("%d+") do
        local id = tonumber(idString)

        if id and id > 0 and not Contains(ids, id) then
            table.insert(ids, id)
        end
    end

    return ids
end

------------------------------------------------------------
-- Itemdaten
------------------------------------------------------------

function FishingInputMode:GetItemName(itemID)
    if not itemID then
        return nil
    end

    -- Moderner Retail-API-Weg
    if C_Item and C_Item.GetItemNameByID then
        local name = C_Item.GetItemNameByID(itemID)

        if name then
            return name
        end
    end

    -- Item noch nicht im Cache
    if C_Item and C_Item.RequestLoadItemDataByID then
        C_Item.RequestLoadItemDataByID(itemID)
    end

    return nil
end

function FishingInputMode:RefreshItemNames()
    self.itemNames = {}

    for _, itemID in ipairs(self.itemIDs) do
        local name = self:GetItemName(itemID)

        if name then
            self.itemNames[itemID] = name
        end
    end

    self:UpdateNameDisplay()
end

------------------------------------------------------------
-- Namensanzeige
------------------------------------------------------------

function FishingInputMode:UpdateNameDisplay()
    if not self.nameText then
        return
    end

    if #self.itemIDs == 0 then
        self.nameText:SetText("Keine Item-IDs eingegeben.")
        return
    end

    local lines = {}

    for _, itemID in ipairs(self.itemIDs) do
        local name = self.itemNames[itemID] or "Lade Itemdaten..."
        table.insert(lines, tostring(itemID) .. "  →  " .. name)
    end

    self.nameText:SetText(table.concat(lines, "\n"))
end

------------------------------------------------------------
-- Lua-Code erzeugen
------------------------------------------------------------

local function EscapeLuaString(value)
    value = tostring(value or "")
    value = value:gsub("\\", "\\\\")
    value = value:gsub("\"", "\\\"")
    return value
end

function FishingInputMode:BuildLua()
    local lines = {}

    --------------------------------------------------------
    -- Name bestimmen
    --------------------------------------------------------

    local mainName = nil

    for _, itemID in ipairs(self.itemIDs) do
        local name = self.itemNames[itemID]

        if name and name ~= "Lade Itemdaten..." then
            mainName = name
            break
        end
    end

    if not mainName then
        mainName = "New_Item"
    end

    --------------------------------------------------------
    -- Lua-Key aus Itemnamen erzeugen
    --------------------------------------------------------

    local key = SanitizeLuaKey(mainName, "New_Item")

    --------------------------------------------------------
    -- Neue Kategorie
    --------------------------------------------------------

    local categoryKey = nil

    if self.newCategoryMode then
        if not self.newCategoryExpansion or not self.newCategoryName then
            return "-- Bitte Expansion und Kategorie auswählen."
        end

        categoryKey = SanitizeLuaKey(
            self.newCategoryName,
            "New_Category"
        )

        table.insert(
            lines,
            'ProfessionsHelperData["' ..
            EscapeLuaString(self.newCategoryExpansion) ..
            '"].' ..
            categoryKey ..
            " = {"
        )

        table.insert(lines, "")
        table.insert(lines, "    " .. key .. " = {")
    else
        table.insert(lines, key .. " = {")
    end

    local fieldIndent = self.newCategoryMode and "        " or "    "

    --------------------------------------------------------
    -- IDs
    --------------------------------------------------------

    if #self.itemIDs > 0 then
        local idStrings = {}

        for _, itemID in ipairs(self.itemIDs) do
            table.insert(idStrings, tostring(itemID))
        end

        table.insert(
            lines,
            fieldIndent ..
            "IDs = { " .. table.concat(idStrings, ", ") .. " },"
        )
    end

    --------------------------------------------------------
    -- Processing Professions
    --------------------------------------------------------

    if #self.selectedProcessingProfs > 0 then
        local values = {}

        for _, prof in ipairs(self.selectedProcessingProfs) do
            table.insert(
                values,
                "\"" .. EscapeLuaString(prof) .. "\""
            )
        end

        table.insert(
            lines,
            fieldIndent ..
            "processingProfs = { " ..
            table.concat(values, ", ") ..
            " },"
        )
    end

    --------------------------------------------------------
    -- Display Category (dieses Modul ist fest für Angeln)
    --------------------------------------------------------

    table.insert(lines, fieldIndent .. "displayCategory = 4,")

    --------------------------------------------------------
    -- Item schließen
    --------------------------------------------------------

    if self.newCategoryMode then
        table.insert(lines, "    },")
        table.insert(lines, "}")
    else
        table.insert(lines, "},")
    end

    return table.concat(lines, "\n")
end

------------------------------------------------------------
-- Output aktualisieren
------------------------------------------------------------

function FishingInputMode:UpdateOutput()
    if not self.outputBox then
        return
    end

    self.outputBox:SetText(self:BuildLua())
end

------------------------------------------------------------
-- Neue Kategorie: Dropdown aktualisieren
------------------------------------------------------------

function FishingInputMode:RefreshCategoryDropdown()
    if not self.categoryDrop then
        return
    end

    local categories = self:GetKnownCategories(
        self.newCategoryExpansion
    )

    local selectedStillExists = false

    if self.newCategoryName then
        for _, category in ipairs(categories) do
            if category == self.newCategoryName then
                selectedStillExists = true
                break
            end
        end
    end

    if not selectedStillExists then
        self.newCategoryName = nil
    end

    UIDropDownMenu_Initialize(self.categoryDrop, function()
        for _, category in ipairs(categories) do
            local info = UIDropDownMenu_CreateInfo()

            info.text = category
            info.value = category

            info.func = function()
                self.newCategoryName = category

                UIDropDownMenu_SetText(
                    self.categoryDrop,
                    category
                )

                self:UpdateOutput()
            end

            UIDropDownMenu_AddButton(info)
        end
    end)

    if self.newCategoryName then
        UIDropDownMenu_SetText(
            self.categoryDrop,
            self.newCategoryName
        )
    else
        UIDropDownMenu_SetText(
            self.categoryDrop,
            "Kategorie wählen"
        )
    end
end

------------------------------------------------------------
-- Neue Kategorie: Sichtbarkeit / Layout
------------------------------------------------------------

function FishingInputMode:UpdateNewCategoryUI()
    if not self.expansionDrop or not self.categoryDrop then
        return
    end

    if self.newCategoryMode then
        self.expansionDrop:Show()
        self.categoryDrop:Show()

        if self.expansionLabel then
            self.expansionLabel:Show()
        end

        if self.newCategoryLabel then
            self.newCategoryLabel:Show()
        end

        if self.contentFrame then
            self.contentFrame:ClearAllPoints()
            self.contentFrame:SetPoint(
                "TOPLEFT",
                self.frame,
                "TOPLEFT",
                0,
                -45
            )
        end

        self:RefreshCategoryDropdown()
    else
        self.expansionDrop:Hide()
        self.categoryDrop:Hide()

        if self.expansionLabel then
            self.expansionLabel:Hide()
        end

        if self.newCategoryLabel then
            self.newCategoryLabel:Hide()
        end

        if self.contentFrame then
            self.contentFrame:ClearAllPoints()
            self.contentFrame:SetPoint(
                "TOPLEFT",
                self.frame,
                "TOPLEFT",
                0,
                0
            )
        end
    end

    self:UpdateOutput()
end

------------------------------------------------------------
-- Checkbox: Processing Professions
------------------------------------------------------------

function FishingInputMode:ToggleProcessingProf(prof, checked)
    if checked then
        if not Contains(self.selectedProcessingProfs, prof) then
            table.insert(self.selectedProcessingProfs, prof)
        end
    else
        RemoveValue(self.selectedProcessingProfs, prof)
    end

    self:UpdateOutput()
end

------------------------------------------------------------
-- Reset
------------------------------------------------------------

function FishingInputMode:Reset()
    self.itemIDs = {}
    self.itemNames = {}

    self.selectedProcessingProfs = {}

    self.newCategoryMode = false
    self.newCategoryExpansion = self.selectedDatabase or "Forever"
    self.newCategoryName = nil

    if self.idBox then
        self.idBox:SetText("")
    end

    if self.newCategoryCheck then
        self.newCategoryCheck:SetChecked(false)
    end

    if self.expansionDrop then
        UIDropDownMenu_SetText(
            self.expansionDrop,
            self.newCategoryExpansion
        )
    end

    if self.categoryDrop then
        UIDropDownMenu_SetText(
            self.categoryDrop,
            "Kategorie wählen"
        )
    end

    self:UpdateNewCategoryUI()
    self:UpdateNameDisplay()
    self:UpdateOutput()
end

------------------------------------------------------------
-- Item-ID-Eingabe übernehmen
------------------------------------------------------------

function FishingInputMode:ApplyIDs()
    local text = self.idBox and self.idBox:GetText() or ""

    self.itemIDs = self:ParseIDs(text)

    self:RefreshItemNames()
    self:UpdateOutput()
end

------------------------------------------------------------
-- Fenster
------------------------------------------------------------

function FishingInputMode:CreateFrame()
    if self.frame then
        return
    end

    local frame = CreateFrame(
        "Frame",
        "ProfessionsHelperFishingInputModeFrame",
        UIParent,
        "BasicFrameTemplateWithInset"
    )

    self.frame = frame

    frame:SetSize(720, 700)
    frame:SetPoint("CENTER")
    frame:SetMovable(true)
    frame:EnableMouse(true)

    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)

    frame.title = frame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontHighlight"
    )

    frame.title:SetPoint("TOP", 0, -5)
    frame.title:SetText("Professions Helper - Angeln Input Mode (Display Category 4)")

    --------------------------------------------------------
    -- Datenbank
    --------------------------------------------------------

    local dbLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    dbLabel:SetPoint("TOPLEFT", 20, -45)
    dbLabel:SetText("Datenbank:")

    local dbDrop = CreateFrame(
        "Frame",
        "ProfessionsHelperFishingInputDatabaseDropDown",
        frame,
        "UIDropDownMenuTemplate"
    )

    dbDrop:SetPoint("TOPLEFT", 70, -38)
    UIDropDownMenu_SetWidth(dbDrop, 180)

    UIDropDownMenu_Initialize(dbDrop, function()
        for _, database in ipairs(DATABASES) do
            local info = UIDropDownMenu_CreateInfo()

            info.text = database
            info.value = database

            info.func = function()
                self.selectedDatabase = database
                UIDropDownMenu_SetText(dbDrop, database)

                if self.newCategoryMode then
                    self.newCategoryExpansion = database

                    if self.expansionDrop then
                        UIDropDownMenu_SetText(
                            self.expansionDrop,
                            database
                        )
                    end

                    self.newCategoryName = nil
                    self:RefreshCategoryDropdown()
                end

                self:UpdateOutput()
            end

            UIDropDownMenu_AddButton(info)
        end
    end)

    UIDropDownMenu_SetText(dbDrop, self.selectedDatabase)

    --------------------------------------------------------
    -- Neue Kategorie Checkbox
    --------------------------------------------------------

    local newCategoryCheck = CreateFrame(
        "CheckButton",
        nil,
        frame,
        "UICheckButtonTemplate"
    )

    self.newCategoryCheck = newCategoryCheck

    newCategoryCheck:SetPoint("TOPLEFT", 290, -34)
    newCategoryCheck.text:SetText("Neue Kategorie")

    newCategoryCheck:SetScript("OnClick", function(check)
        self.newCategoryMode = check:GetChecked()

        if self.newCategoryMode then
            self.newCategoryExpansion = self.selectedDatabase or "Forever"
            self.newCategoryName = nil

            if self.expansionDrop then
                UIDropDownMenu_SetText(
                    self.expansionDrop,
                    self.newCategoryExpansion
                )
            end
        end

        self:UpdateNewCategoryUI()
    end)

    --------------------------------------------------------
    -- Neue Kategorie: Expansion
    --------------------------------------------------------

    local expansionLabel = frame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormal"
    )

    self.expansionLabel = expansionLabel

    expansionLabel:SetPoint("TOPLEFT", 20, -75)
    expansionLabel:SetText("Expansion:")

    local expansionDrop = CreateFrame(
        "Frame",
        "ProfessionsHelperFishingInputExpansionDropDown",
        frame,
        "UIDropDownMenuTemplate"
    )

    self.expansionDrop = expansionDrop

    expansionDrop:SetPoint("TOPLEFT", 95, -68)
    UIDropDownMenu_SetWidth(expansionDrop, 180)

    UIDropDownMenu_Initialize(expansionDrop, function()
        for _, expansion in ipairs(DATABASES) do
            local info = UIDropDownMenu_CreateInfo()

            info.text = expansion
            info.value = expansion

            info.func = function()
                self.newCategoryExpansion = expansion
                self.newCategoryName = nil

                UIDropDownMenu_SetText(
                    expansionDrop,
                    expansion
                )

                self:RefreshCategoryDropdown()
                self:UpdateOutput()
            end

            UIDropDownMenu_AddButton(info)
        end
    end)

    UIDropDownMenu_SetText(
        expansionDrop,
        self.newCategoryExpansion
    )

    --------------------------------------------------------
    -- Neue Kategorie: Kategorie
    --------------------------------------------------------

    local newCategoryLabel = frame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormal"
    )

    self.newCategoryLabel = newCategoryLabel

    newCategoryLabel:SetPoint("TOPLEFT", 300, -75)
    newCategoryLabel:SetText("Kategorie:")

    local categoryDrop = CreateFrame(
        "Frame",
        "ProfessionsHelperFishingInputDatabaseCategoryDropDown",
        frame,
        "UIDropDownMenuTemplate"
    )

    self.categoryDrop = categoryDrop

    categoryDrop:SetPoint("TOPLEFT", 365, -68)
    UIDropDownMenu_SetWidth(categoryDrop, 220)

    UIDropDownMenu_SetText(categoryDrop, "Kategorie wählen")

    --------------------------------------------------------
    -- Content Frame
    --------------------------------------------------------

    local contentFrame = CreateFrame(
        "Frame",
        nil,
        frame
    )

    self.contentFrame = contentFrame

    contentFrame:SetSize(720, 700)
    contentFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)

    --------------------------------------------------------
    -- IDs
    --------------------------------------------------------

    local idLabel = contentFrame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormal"
    )

    idLabel:SetPoint("TOPLEFT", 20, -90)
    idLabel:SetText("Item-ID(s):")

    local idBox = CreateFrame(
        "EditBox",
        nil,
        contentFrame,
        "InputBoxTemplate"
    )

    self.idBox = idBox

    idBox:SetSize(430, 30)
    idBox:SetPoint("TOPLEFT", 100, -84)
    idBox:SetAutoFocus(false)

    idBox:SetScript("OnEnterPressed", function()
        self:ApplyIDs()
    end)

    local idHint = contentFrame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontHighlightSmall"
    )

    idHint:SetPoint("TOPLEFT", 100, -115)
    idHint:SetText("Mehrere IDs: 210796, 210797, 210798")

    local applyButton = CreateFrame(
        "Button",
        nil,
        contentFrame,
        "UIPanelButtonTemplate"
    )

    applyButton:SetSize(100, 28)
    applyButton:SetPoint("LEFT", idBox, "RIGHT", 10, 0)
    applyButton:SetText("Übernehmen")

    applyButton:SetScript("OnClick", function()
        self:ApplyIDs()
    end)

    --------------------------------------------------------
    -- Itemnamen
    --------------------------------------------------------

    local nameLabel = contentFrame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormal"
    )

    nameLabel:SetPoint("TOPLEFT", 20, -145)
    nameLabel:SetText("Erkannte Items:")

    local nameText = contentFrame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontHighlight"
    )

    self.nameText = nameText

    nameText:SetPoint("TOPLEFT", 120, -145)
    nameText:SetWidth(550)
    nameText:SetJustifyH("LEFT")
    nameText:SetText("Keine Item-IDs eingegeben.")

    --------------------------------------------------------
    -- Processing Professions
    --------------------------------------------------------

    local processingLabel = contentFrame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormal"
    )

    processingLabel:SetPoint("TOPLEFT", 20, -215)
    processingLabel:SetText("Processing Professions:")

    local processingY = -240

    for index, prof in ipairs(PROCESSING_PROFS) do
        local checkbox = CreateFrame(
            "CheckButton",
            nil,
            contentFrame,
            "UICheckButtonTemplate"
        )

        local column = (index - 1) % 3
        local row = math.floor((index - 1) / 3)

        checkbox:SetPoint(
            "TOPLEFT",
            100 + column * 180,
            processingY - row * 28
        )

        checkbox.text:SetText(prof)

        checkbox:SetScript("OnClick", function(self)
            FishingInputMode:ToggleProcessingProf(
                prof,
                self:GetChecked()
            )
        end)
    end

    --------------------------------------------------------
    -- Lua Output
    --------------------------------------------------------

    local outputLabel = contentFrame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormal"
    )

    outputLabel:SetPoint("TOPLEFT", 20, -390)
    outputLabel:SetText("Lua-Ausgabe:")

    local outputScroll = CreateFrame(
        "ScrollFrame",
        nil,
        contentFrame,
        "UIPanelScrollFrameTemplate"
    )

    outputScroll:SetPoint("TOPLEFT", 100, -385)
    outputScroll:SetSize(570, 210)

    local outputBox = CreateFrame(
        "EditBox",
        nil,
        outputScroll
    )

    self.outputBox = outputBox

    outputBox:SetMultiLine(true)
    outputBox:SetAutoFocus(false)
    outputBox:SetFontObject("ChatFontNormal")
    outputBox:SetWidth(550)
    outputBox:SetHeight(210)
    outputBox:SetText(self:BuildLua())

    outputScroll:SetScrollChild(outputBox)

    --------------------------------------------------------
    -- Reset
    --------------------------------------------------------

    local resetButton = CreateFrame(
        "Button",
        nil,
        frame,
        "UIPanelButtonTemplate"
    )

    resetButton:SetSize(100, 28)
    resetButton:SetPoint("BOTTOMLEFT", 20, 15)
    resetButton:SetText("Zurücksetzen")

    resetButton:SetScript("OnClick", function()
        self:Reset()
    end)

    -- Neue Kategorie ist beim Start deaktiviert.
    expansionLabel:Hide()
    newCategoryLabel:Hide()
    expansionDrop:Hide()
    categoryDrop:Hide()

    frame:Hide()
end

------------------------------------------------------------
-- Öffnen / Schließen
------------------------------------------------------------

function FishingInputMode:Toggle()
    self:CreateFrame()

    if self.frame:IsShown() then
        self.frame:Hide()
    else
        self.frame:Show()
    end
end

------------------------------------------------------------
-- Itemdaten nachladen
------------------------------------------------------------

function FishingInputMode:OnItemInfoReceived(itemID)
    if not itemID then
        return
    end

    for _, id in ipairs(self.itemIDs) do
        if id == itemID then
            local name = nil

            if C_Item and C_Item.GetItemNameByID then
                name = C_Item.GetItemNameByID(itemID)
            end

            if name then
                self.itemNames[itemID] = name
            end
        end
    end

    self:UpdateNameDisplay()
    self:UpdateOutput()
end

------------------------------------------------------------
-- Initialisierung
------------------------------------------------------------

function FishingInputMode:Init()
    self:CreateFrame()

    local eventFrame = CreateFrame("Frame")

    eventFrame:RegisterEvent("GET_ITEM_INFO_RECEIVED")

    eventFrame:SetScript("OnEvent", function(_, event, itemID)
        if event == "GET_ITEM_INFO_RECEIVED" then
            FishingInputMode:OnItemInfoReceived(itemID)
        end
    end)

    ProfessionsHelper:RegisterChatCommand(
        "phinputfish",
        function()
            FishingInputMode:Toggle()
        end
    )
end

------------------------------------------------------------
-- Modul registrieren
------------------------------------------------------------

ProfessionsHelper:RegisterModule("FishingInputMode", FishingInputMode)
