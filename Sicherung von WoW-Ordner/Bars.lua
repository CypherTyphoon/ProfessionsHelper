-- Bars.lua
-- Modul für ProfessionsHelper

local ADDON_NAME, _ = ...
local Bars = {}
local LSM = LibStub("LibSharedMedia-3.0")

-- ==========================================
-- Globale Variablen & Tabellen
-- ==========================================
local materialGroups = {}
local initialized = false

-- Beruf-SpellIDs
local professionSpellIDs = {
    ["Skinning"]       = 423342,
    ["Mining"]         = 423353,
    ["Herbalism"]      = 441327,
    ["Tailoring"]      = 423355,
    ["Enchanting"]     = 423346,
    ["Inscription"]    = 423350,
    ["Jewelcrafting"]  = 423339,
    ["Blacksmithing"]  = 423344,
    ["Engineering"]    = 423347,
}

-- Mapping: Kategorie → Beruf
local professionMapping = {
    Leather = "Skinning",
    Ore     = "Mining",
    Herbs   = "Herbalism",
    Cloth   = "Tailoring",
    Dust    = "Enchanting",
    Pigments= "Inscription",
    Gems    = "Jewelcrafting",
    Ingots  = "Blacksmithing",
    Wires   = "Engineering",
}

-- ==========================================
-- Hilfsfunktionen
-- ==========================================
local function HexToRGB(hex)
    hex = hex:gsub("#","")
    return tonumber("0x"..hex:sub(1,2))/255,
           tonumber("0x"..hex:sub(3,4))/255,
           tonumber("0x"..hex:sub(5,6))/255
end

-- Prüft, ob ein Charakter den Beruf für eine Kategorie erlernt hat
local function HasProfessionForCategory(category)
    local prof = professionMapping[category]
    if not prof then return false end
    local spellID = professionSpellIDs[prof]
    if not spellID or spellID == 0 then return false end
    return C_SpellBook.IsSpellInSpellBook(spellID)
end

-- ==========================================
-- Balkenerstellung
-- ==========================================
local function CreateMaterialBar(name, parent, itemIDs, position, barColor)
    local frame = CreateFrame("Frame", name.."Frame", parent)
    frame:SetSize(150,150)
    frame:SetPoint("CENTER", unpack(position))
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)

    local bar = CreateFrame("StatusBar", nil, frame)
    bar:SetSize(32,100)
    bar:SetPoint("BOTTOM", frame, "BOTTOM", 0, 32)
    bar:SetOrientation("VERTICAL")
    bar:SetStatusBarTexture(LSM:Fetch("statusbar", "Cilo") or "Interface\\TARGETINGFRAME\\UI-StatusBar")
    bar:SetMinMaxValues(0,1000)
    bar:SetValue(0)
    bar:SetStatusBarColor(unpack(barColor))

    local bg = bar:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints(true)
    bg:SetColorTexture(0, 0, 0, 0.5)

    local icon = frame:CreateTexture(nil,"ARTWORK")
    icon:SetSize(32,32)
    icon:SetPoint("BOTTOM", frame, "BOTTOM",0,0)
    icon:SetTexture(C_Item.GetItemIconByID(itemIDs[1]))

    local textBronze = bar:CreateFontString(nil,"OVERLAY","GameFontHighlight")
    local textSilver = bar:CreateFontString(nil,"OVERLAY","GameFontHighlight")
    local textGold   = bar:CreateFontString(nil,"OVERLAY","GameFontHighlight")

    textBronze:SetPoint("CENTER", bar, "CENTER", 0, 15)
    textSilver:SetPoint("CENTER", bar, "CENTER", 0, 0)
    textGold:SetPoint("CENTER", bar, "CENTER", 0, -15)

    textBronze:SetTextColor(1,0.35,0)
    textSilver:SetTextColor(0.75,0.75,0.75)
    textGold:SetTextColor(1,0.84,0)

    -- Tooltip beim Icon (wiederhergestellt)
    icon:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        local bronze = C_Item.GetItemCount(itemIDs[1], true, true, true, true)
        local silver = C_Item.GetItemCount(itemIDs[2], true, true, true, true)
        local gold   = C_Item.GetItemCount(itemIDs[3], true, true, true, true)
        local highestID = itemIDs[1]
        if gold > 0 then
            highestID = itemIDs[3]
        elseif silver > 0 then
            highestID = itemIDs[2]
        end
        GameTooltip:SetItemByID(highestID)
        GameTooltip:Show()
    end)
    icon:SetScript("OnLeave", function() GameTooltip:Hide() end)

    local function Update()
        local bronze = C_Item.GetItemCount(itemIDs[1], true, true, true, true)
        local silver = C_Item.GetItemCount(itemIDs[2], true, true, true, true)
        local gold = C_Item.GetItemCount(itemIDs[3], true, true, true, true)
        local total = bronze + silver + gold
        bar:SetMinMaxValues(0, math.max(1000, total))
        bar:SetValue(total)
        textBronze:SetText(bronze)
        textSilver:SetText(silver)
        textGold:SetText(gold)
        if gold > 0 then
            icon:SetTexture(C_Item.GetItemIconByID(itemIDs[3]))
        elseif silver > 0 then
            icon:SetTexture(C_Item.GetItemIconByID(itemIDs[2]))
        else
            icon:SetTexture(C_Item.GetItemIconByID(itemIDs[1]))
        end
    end

    frame:RegisterEvent("BAG_UPDATE")
    frame:RegisterEvent("PLAYER_ENTERING_WORLD")
    frame:SetScript("OnEvent", Update)
    Update()

    return frame
end

-- ==========================================
-- Automatisch Balken aus AddonData erzeugen
-- ==========================================
local function CreateBarsFromData()
    local data = ProfessionsHelperData and ProfessionsHelperData["The War Within"]
    if not data then
        print("ProfessionsHelper: Keine Daten in AddonData gefunden.")
        return
    end

    local offsetX, offsetY = 0, 0
    local spacing = 7

    for catName, items in pairs(data) do
        if HasProfessionForCategory(catName) then
            for subName, subData in pairs(items) do
                local itemIDs = subData.IDs or subData
                if itemIDs and #itemIDs == 3 then
                    local r,g,b = 1, 0.6, 0
                    if subData.color then r,g,b = HexToRGB(subData.color) end
                    local frame = CreateMaterialBar(subName, UIParent, itemIDs, {offsetX, offsetY}, {r,g,b})
                    table.insert(materialGroups, frame)

                    offsetX = offsetX + 33 + spacing
                    if offsetX > 600 then offsetX = 0; offsetY = offsetY - 132 - spacing end
                end
            end
        end
    end
end

-- ==========================================
-- Init
-- ==========================================
function Bars:Init()
    if initialized then return end
    initialized = true

    local f = CreateFrame("Frame")
    f:RegisterEvent("PLAYER_LOGIN")
    f:SetScript("OnEvent", function()
        ProfessionsHelperDB = ProfessionsHelperDB or {}
        ProfessionsHelperDB.barSettings = ProfessionsHelperDB.barSettings or {}
        CreateBarsFromData()
    end)
end

-- ==========================================
-- Registrierung
-- ==========================================
if ProfessionsHelper then
    ProfessionsHelper:RegisterModule("Bars", Bars)
else
    C_Timer.After(0.5, function()
        if ProfessionsHelper then
            ProfessionsHelper:RegisterModule("Bars", Bars)
        end
    end)
end
