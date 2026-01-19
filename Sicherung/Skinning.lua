-- Skinning.lua
-- ProfessionsHelper Addon
-- Unterstützt vertikale Balken für Itemgruppen (Bronze/Silber/Gold)
-- /ph groupadd <id1>,<id2>,<id3> <FarbwertHEX>

local addonName, _ = ...
local LSM = LibStub("LibSharedMedia-3.0")

local materialGroups = {}

-- ===============================
-- Hilfsfunktionen
-- ===============================
local function HexToRGB(hex)
    hex = hex:gsub("#", "")
    return tonumber("0x"..hex:sub(1,2)) / 255,
           tonumber("0x"..hex:sub(3,4)) / 255,
           tonumber("0x"..hex:sub(5,6)) / 255
end

-- ===============================
-- Hauptfunktion: Materialbalken
-- ===============================
local function CreateMaterialBar(name, parent, itemIDs, position, barColor)
    local frame = CreateFrame("Frame", name.."Frame", parent)
    frame:SetSize(150, 150)
    frame:SetPoint("CENTER", unpack(position))
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)

    -- StatusBar (VERTIKAL)
    local bar = CreateFrame("StatusBar", nil, frame)
    bar:SetSize(32, 100)
    bar:SetPoint("BOTTOM", frame, "BOTTOM", 0, 32)
    bar:SetOrientation("VERTICAL")
    bar:SetStatusBarTexture(LSM:Fetch("statusbar", "Cilo") or "Interface\\TARGETINGFRAME\\UI-StatusBar")
    bar:SetMinMaxValues(0, 1000)
    bar:SetValue(0)
    bar:SetStatusBarColor(unpack(barColor))

    -- Icon unterhalb
    local icon = frame:CreateTexture(nil, "ARTWORK")
    icon:SetSize(32, 32)
    icon:SetPoint("BOTTOM", frame, "BOTTOM", 0, 0)
    icon:SetTexture(C_Item.GetItemIconByID(itemIDs[1]))

    -- Tooltip beim Icon
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

    -- Texte (oben = Bronze, Mitte = Silber, unten = Gold)
    local textBronze = bar:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    local textSilver = bar:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    local textGold   = bar:CreateFontString(nil, "OVERLAY", "GameFontHighlight")

    textBronze:SetPoint("CENTER", bar, "CENTER", 0, 15)
    textSilver:SetPoint("CENTER", bar, "CENTER", 0, 0)
    textGold:SetPoint("CENTER", bar, "CENTER", 0, -15)

    textBronze:SetTextColor(1.0, 0.35, 0.0)   -- FF5900
    textSilver:SetTextColor(0.75, 0.75, 0.75) -- C0C0C0
    textGold:SetTextColor(1.0, 0.84, 0.0)     -- FFD700

    -- Update-Funktion
    local function Update()
        local bronze = C_Item.GetItemCount(itemIDs[1], true, true, true, true)
        local silver = C_Item.GetItemCount(itemIDs[2], true, true, true, true)
        local gold   = C_Item.GetItemCount(itemIDs[3], true, true, true, true)

        local total = bronze + silver + gold
        local maxVal = math.max(1000, total)
        bar:SetMinMaxValues(0, maxVal)
        bar:SetValue(total)

        -- Texte aktualisieren
        textBronze:SetText(bronze)
        textSilver:SetText(silver)
        textGold:SetText(gold)

        -- Icon dynamisch an höchste Qualität anpassen
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

-- ===============================
-- Slash-Befehle
-- ===============================
SLASH_PROFHELP1 = "/ph"
SlashCmdList["PROFHELP"] = function(msg)
    local args = {}
    for word in msg:gmatch("[^%s]+") do
        table.insert(args, word)
    end

    if args[1] == "groupadd" and args[2] and args[3] then
        local idList = {}
        for id in args[2]:gmatch("%d+") do
            table.insert(idList, tonumber(id))
        end
        local colorHex = args[3]
        if #idList == 3 then
            local r, g, b = HexToRGB(colorHex)
            local itemName = C_Item.GetItemInfo(idList[1]) or "Unbekannt"
            local offset = (#materialGroups * 200) -- Versatz nebeneinander
            local frame = CreateMaterialBar(itemName, UIParent, idList, {offset, 0}, {r, g, b})
            table.insert(materialGroups, frame)
            print("Gruppe erstellt für:", itemName)
        else
            print("Fehler: Es müssen genau 3 ItemIDs angegeben werden!")
        end
    else
        print("Verwendung:")
        print("/ph groupadd <id1>,<id2>,<id3> <FarbwertHEX>")
    end
end
