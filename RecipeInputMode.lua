
local ADDON_NAME, _ = ...

local RecipeInputMode = {}
RecipeInputMode.name = "RecipeInputMode"

RecipeInputMode.frame = nil
RecipeInputMode.outputBox = nil
RecipeInputMode.recipeIDBox = nil
RecipeInputMode.yieldBox = nil
RecipeInputMode.nameBox = nil
RecipeInputMode.reagentBoxes = {}

-- Entfernt Leerzeichen am Anfang und Ende
local function Trim(value)
    return (value or ""):match("^%s*(.-)%s*$")
end

-- Liest eine oder mehrere positive Item-IDs aus einem Eingabefeld
local function ParseIDs(value)
    local ids = {}
    local seen = {}

    for number in (value or ""):gmatch("%d+") do
        local id = tonumber(number)

        if id and id > 0 and not seen[id] then
            table.insert(ids, id)
            seen[id] = true
        end
    end

    return ids
end

-- Erzeugt einen gültigen Variablennamen
local function SanitizeName(value)
    value = Trim(value)
    value = value:gsub("[^%w_]", "")
    value = value:gsub("^[^%a_]+", "")

    if value == "" then
        value = "NewRecipe"
    end

    return value
end

-- Formatiert eine Liste von IDs für Lua
local function FormatIDs(ids)
    return "{ " .. table.concat(ids, ", ") .. " }"
end

-- Erstellt die Lua-Ausgabe
function RecipeInputMode:BuildLua()
    local recipeIDs = ParseIDs(self.recipeIDBox:GetText())
    local yield = tonumber(Trim(self.yieldBox:GetText()))
    local recipeName = SanitizeName(self.nameBox:GetText())

    if #recipeIDs == 0 then
        self.outputBox:SetText("-- Bitte mindestens eine Rezept-Item-ID eingeben.")
        return
    end

    if not yield or yield < 1 then
        self.outputBox:SetText("-- Bitte eine gültige Herstellmenge eingeben.")
        return
    end

    local lines = {}

    table.insert(lines, "local recipe_" .. recipeName .. " = {")
    table.insert(lines, "    yield = " .. yield .. ",")

    for i = 1, 6 do
        local reagent = self.reagentBoxes[i]
        local ids = ParseIDs(reagent.idBox:GetText())
        local amount = tonumber(Trim(reagent.amountBox:GetText()))

        -- Leere Reagenzienfelder überspringen
        if #ids > 0 or Trim(reagent.amountBox:GetText()) ~= "" then
            if #ids == 0 or not amount or amount < 1 then
                self.outputBox:SetText(
                    "-- Reagenz " .. i ..
                    ": Bitte IDs und eine gültige Menge eingeben."
                )
                return
            end

            table.insert(
                lines,
                "    { ids = " .. FormatIDs(ids) ..
                ", amount = " .. amount .. " },"
            )
        end
    end

    table.insert(lines, "}")
    table.insert(lines, "")

    for _, id in ipairs(recipeIDs) do
        table.insert(
            lines,
            "[" .. id .. "] = recipe_" .. recipeName
        )
    end

    self.outputBox:SetText(table.concat(lines, "\n"))
end

-- Erstellt ein Eingabefeld
local function CreateInput(parent, width, height)
    local box = CreateFrame("EditBox", nil, parent, "InputBoxTemplate")
    box:SetSize(width, height)
    box:SetAutoFocus(false)
    box:SetFontObject("ChatFontNormal")
    box:SetTextInsets(6, 6, 0, 0)

    return box
end

-- Erstellt die Oberfläche
function RecipeInputMode:CreateFrame()
    if self.frame then
        return
    end

    local frame = CreateFrame("Frame", "ProfessionsHelperRecipeInputFrame", UIParent, "BasicFrameTemplateWithInset")
    frame:SetSize(620, 680)
    frame:SetPoint("CENTER")
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame:Hide()

    frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    frame.title:SetPoint("LEFT", frame.TitleBg, "LEFT", 5, 0)
    frame.title:SetText("Recipe Input Mode")

    self.frame = frame

    -- Rezeptname
    local nameLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    nameLabel:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, -45)
    nameLabel:SetText("Variablenname")

    self.nameBox = CreateInput(frame, 250, 24)
    self.nameBox:SetPoint("TOPLEFT", nameLabel, "BOTTOMLEFT", 0, -6)
    self.nameBox:SetText("NewRecipe")

    -- Rezept-Item-IDs
    local recipeLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    recipeLabel:SetPoint("TOPLEFT", self.nameBox, "BOTTOMLEFT", 0, -16)
    recipeLabel:SetText("Herzustellende Item-ID(s), durch Komma getrennt")

    self.recipeIDBox = CreateInput(frame, 250, 24)
    self.recipeIDBox:SetPoint("TOPLEFT", recipeLabel, "BOTTOMLEFT", 0, -6)

    -- Herstellmenge
    local yieldLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    yieldLabel:SetPoint("LEFT", self.recipeIDBox, "RIGHT", 25, 0)
    yieldLabel:SetText("Herstellmenge (yield)")

    self.yieldBox = CreateInput(frame, 90, 24)
    self.yieldBox:SetPoint("TOPLEFT", yieldLabel, "BOTTOMLEFT", 0, -6)
    self.yieldBox:SetText("1")

    -- Reagenzien-Überschrift
    local reagentHeader = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    reagentHeader:SetPoint("TOPLEFT", self.recipeIDBox, "BOTTOMLEFT", 0, -22)
    reagentHeader:SetText("Reagenzien (bis zu 6)")

    -- Spaltenüberschriften
    local idsHeader = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    idsHeader:SetPoint("TOPLEFT", reagentHeader, "BOTTOMLEFT", 0, -12)
    idsHeader:SetText("Item-ID(s), mehrere IDs mit Komma trennen")

    local amountHeader = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    amountHeader:SetPoint("TOPLEFT", idsHeader, "TOPLEFT", 390, 0)
    amountHeader:SetText("Benötigte Menge")

    -- Sechs Reagenzienzeilen
    local previousRow

    for i = 1, 6 do
        local row = CreateFrame("Frame", nil, frame)
        row:SetSize(570, 32)

        if i == 1 then
            row:SetPoint("TOPLEFT", idsHeader, "BOTTOMLEFT", 0, -8)
        else
            row:SetPoint("TOPLEFT", previousRow, "BOTTOMLEFT", 0, -5)
        end

        local numberLabel = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        numberLabel:SetPoint("LEFT", row, "LEFT", 0, 0)
        numberLabel:SetWidth(22)
        numberLabel:SetText(i .. ".")

        local idBox = CreateInput(row, 350, 24)
        idBox:SetPoint("LEFT", numberLabel, "RIGHT", 5, 0)

        local amountBox = CreateInput(row, 100, 24)
        amountBox:SetPoint("LEFT", idBox, "RIGHT", 20, 0)

        self.reagentBoxes[i] = {
            idBox = idBox,
            amountBox = amountBox,
        }

        previousRow = row
    end

    -- Ausgabeüberschrift
    local outputLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    outputLabel:SetPoint("TOPLEFT", previousRow, "BOTTOMLEFT", 0, -15)
    outputLabel:SetText("Generierter Lua-Code")

    -- Ausgabefeld
    local outputScroll = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
    outputScroll:SetPoint("TOPLEFT", outputLabel, "BOTTOMLEFT", 0, -8)
    outputScroll:SetSize(560, 125)

    local outputBox = CreateFrame("EditBox", nil, outputScroll)
    outputBox:SetMultiLine(true)
    outputBox:SetAutoFocus(false)
    outputBox:SetFontObject("ChatFontNormal")
    outputBox:SetWidth(535)
    outputBox:SetHeight(125)
    outputBox:SetMaxLetters(0)
    outputBox:SetScript("OnEscapePressed", function(box)
        box:ClearFocus()
    end)

    outputScroll:SetScrollChild(outputBox)
    self.outputBox = outputBox

    -- Buttons
    local generateButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    generateButton:SetSize(130, 26)
    generateButton:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 20, 15)
    generateButton:SetText("Code erzeugen")
    generateButton:SetScript("OnClick", function()
        self:BuildLua()
    end)

    local resetButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    resetButton:SetSize(100, 26)
    resetButton:SetPoint("LEFT", generateButton, "RIGHT", 10, 0)
    resetButton:SetText("Zurücksetzen")
    resetButton:SetScript("OnClick", function()
        self:Reset()
    end)

    -- Bei Änderungen automatisch aktualisieren
    local function UpdateOutput()
        self:BuildLua()
    end

    self.nameBox:SetScript("OnTextChanged", UpdateOutput)
    self.recipeIDBox:SetScript("OnTextChanged", UpdateOutput)
    self.yieldBox:SetScript("OnTextChanged", UpdateOutput)

    for i = 1, 6 do
        self.reagentBoxes[i].idBox:SetScript("OnTextChanged", UpdateOutput)
        self.reagentBoxes[i].amountBox:SetScript("OnTextChanged", UpdateOutput)
    end

    -- Escape schließt das Fenster
    frame:SetScript("OnKeyDown", function(_, key)
        if key == "ESCAPE" then
            self:Toggle()
        end
    end)
    frame:EnableKeyboard(true)
end

-- Setzt alle Eingaben zurück
function RecipeInputMode:Reset()
    self.nameBox:SetText("NewRecipe")
    self.recipeIDBox:SetText("")
    self.yieldBox:SetText("1")

    for i = 1, 6 do
        self.reagentBoxes[i].idBox:SetText("")
        self.reagentBoxes[i].amountBox:SetText("")
    end

    self.outputBox:SetText("")
end

-- Fenster öffnen oder schließen
function RecipeInputMode:Toggle()
    if not self.frame then
        self:CreateFrame()
    end

    if self.frame:IsShown() then
        self.frame:Hide()
    else
        self.frame:Show()
    end
end

-- Modul initialisieren
function RecipeInputMode:Init()
    self:CreateFrame()

    ProfessionsHelper:RegisterChatCommand("phrecipe", function()
        self:Toggle()
    end)
end

ProfessionsHelper:RegisterModule("RecipeInputMode", RecipeInputMode)