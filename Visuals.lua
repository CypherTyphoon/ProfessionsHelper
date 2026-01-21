local ADDON_NAME, _ = ...
local ProfessionsHelper = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local Visuals = {}
local LSM = LibStub("LibSharedMedia-3.0")

-- ==========================================
-- 1. KONFIGURATION
-- ==========================================
Visuals.ActiveFrames = {}

Visuals.Config = {
    SpacingX_Bar = 38,
    SpacingX_Icon = 28,
    SpacingX_Prof = 48,
    SpacingX_Fish = 40,
    
    MaxWidthMain = 600,
    MaxWidthFish = 500,
    RowHeight = 60
}

local skillLineMapping = { 
    [171] = "Alchemy", [164] = "Blacksmithing", [185] = "Cooking", 
    [333] = "Enchanting", [202] = "Engineering", [356] = "Fishing", 
    [182] = "Herbalism", [773] = "Inscription", [755] = "Jewelcrafting", 
    [165] = "Leatherworking", [186] = "Mining", [393] = "Skinning", 
    [197] = "Tailoring" 
}

local professionMapping = { 
    Leather = "Skinning", Ores = "Mining", MetalAndStone = "Mining", 
    Herbs = "Herbalism", Cloth = "Tailoring", Cooking = "Cooking", 
    Fishing = "Fishing", Wood = "Woodcutting", Gems = "Jewelcrafting", 
    Ingots = "Blacksmithing" 
}

local PlayerCanHandle = {}

-- ==========================================
-- 2. SCAN & FILTER LOGIK
-- ==========================================

local function PerformCharacterScan()
    PlayerCanHandle = { ["AllProf"] = true }
    
    -- 1. Standard-Berufe scannen
    local profs = { GetProfessions() }
    for _, index in ipairs(profs) do
        if index then
            local _, _, _, _, _, _, skillLine = GetProfessionInfo(index)
            local name = skillLineMapping[skillLine]
            if name then PlayerCanHandle[name] = true end
        end
    end
    if C_SpellBook.IsSpellKnownOrInSpellBook(1256697) then 
        PlayerCanHandle["Woodcutting"] = true 
    end
end

local function CanPlayerSeeItem(category, itemData)
    if not itemData or not itemData.IDs then return false end
    if itemData.gatheringProf then return PlayerCanHandle[itemData.gatheringProf] == true end
    local target = professionMapping[category]
    if target then return PlayerCanHandle[target] == true end
    if itemData.processingProfs then
        for _, pProf in ipairs(itemData.processingProfs) do 
            if PlayerCanHandle[pProf] then return true end 
        end
    end
    return false
end

-- ==========================================
-- 3. UI HILFSFUNKTIONEN (INTERAKTION)
-- ==========================================

function Visuals:ClearFrames()
    for _, frame in ipairs(Visuals.ActiveFrames) do
        frame:Hide()
        frame:UnregisterAllEvents()
        frame:SetParent(nil)
    end
    Visuals.ActiveFrames = {}
end

local function MakeInteractive(frame, itemIDs)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")

    frame:SetScript("OnDragStart", function(self)
        if not ProfessionsHelper.db.profile.locked then
            self:StartMoving()
        end
    end)

    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local centerX, centerY = self:GetCenter()
        local uiX, uiY = UIParent:GetCenter()
        local s = self:GetScale()
        local newX = (centerX - uiX) / s
        local newY = (centerY - uiY) / s
        ProfessionsHelper.db.profile.positions[self.catID] = { x = newX, y = newY }
    end)

    frame:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        local id = itemIDs[1]
        if id then GameTooltip:SetItemByID(id) end
        GameTooltip:Show()
    end)
    frame:SetScript("OnLeave", function() GameTooltip:Hide() end)
end

-- ==========================================
-- 4. RENDERING KOMPONENTEN
-- ==========================================

function Visuals:CreateBar(name, parent, itemIDs, posX, posY, barColor)
    local settings = ProfessionsHelper.db.profile.catSettings[1]
    local isGrowUp = settings.growUp
    local barW = settings.width or 30
    local barH = settings.height or 100
    local fSize = settings.fontSize or 10

    local frame = CreateFrame("Frame", "PH_Bar_"..name, parent)
    frame.catID = 1
    frame:SetSize(barW, barH + barW + 5) 
    frame:SetPoint("CENTER", UIParent, "CENTER", posX, posY)
    frame:SetScale(settings.scale or 1)
    
    local bar = CreateFrame("StatusBar", nil, frame)
    bar:SetSize(barW, barH)
    
    local texturePath = LSM:Fetch("statusbar", settings.barTexture or "Cilo")
    bar:SetStatusBarTexture(texturePath)
    bar:SetStatusBarColor(unpack(barColor))
    
    local bg = bar:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0.1, 0.1, 0.1, 0.6)

    local icon = frame:CreateTexture(nil, "ARTWORK")
    icon:SetSize(barW, barW)
    
    if isGrowUp then
        bar:SetOrientation("VERTICAL")
        bar:SetPoint("BOTTOM", frame, "BOTTOM", 0, barW + 2)
        icon:SetPoint("BOTTOM", frame, "BOTTOM", 0, 0)
    else
        bar:SetOrientation("VERTICAL")
        bar:SetReverseFill(true)
        bar:SetPoint("TOP", frame, "TOP", 0, -(barW + 2))
        icon:SetPoint("TOP", frame, "TOP", 0, 0)
    end
    
    local function CreateCenteredText(offsetY, color)
        local t = bar:CreateFontString(nil, "OVERLAY")
        local fontPath = LSM:Fetch("font", settings.fontName or "Friz Quadrata TT")
        t:SetFont(fontPath, fSize, "OUTLINE")
        t:SetTextColor(unpack(color))
        t:SetPoint("CENTER", bar, "CENTER", 0, offsetY)
        t:SetShadowOffset(1, -1)
        return t
    end

    local tB = CreateCenteredText(15, {1, 0.35, 0})
    local tS = CreateCenteredText(0, {0.75, 0.75, 0.75})
    local tG = CreateCenteredText(-15, {1, 0.84, 0})

    local function Update()
        local b = C_Item.GetItemCount(itemIDs[1] or 0, true, true, true, true)
        local s = C_Item.GetItemCount(itemIDs[2] or 0, true, true, true, true)
        local g = C_Item.GetItemCount(itemIDs[3] or 0, true, true, true, true)
        local total = b + s + g
        bar:SetMinMaxValues(0, 1000)
        bar:SetValue(total)
        tB:SetText(b > 0 and b or "")
        tS:SetText(s > 0 and s or "")
        tG:SetText(g > 0 and g or "")
        local dID = (g > 0 and itemIDs[3]) or (s > 0 and itemIDs[2]) or itemIDs[1]
        if dID then icon:SetTexture(C_Item.GetItemIconByID(dID)) end
        frame:SetAlpha(total == 0 and 0.4 or 1.0)
    end
    
    frame:RegisterEvent("BAG_UPDATE_DELAYED")
    frame:SetScript("OnEvent", Update)
    Update()
    MakeInteractive(frame, itemIDs)
    return frame
end

function Visuals:CreateIcon(parent, itemIDs, posX, posY, mode, profName)
    local frame = CreateFrame("Frame", nil, parent)
    frame.catID = mode
    local size = (mode == 3) and 40 or (mode == 4 and 30 or 20)
    frame:SetSize(size, size)
    frame:SetPoint("CENTER", UIParent, "CENTER", posX, posY)
    frame:SetScale(ProfessionsHelper.db.profile.catSettings[mode].scale or 1)
    
    local icon = frame:CreateTexture(nil, "ARTWORK"); icon:SetAllPoints()
    icon:SetTexture(C_Item.GetItemIconByID(itemIDs[1]))
    
    local text = frame:CreateFontString(nil, "OVERLAY", "NumberFontNormalSmall")
    
    -- Dynamische Text-Positionierung für Kategorie 2 (Unterkategorien)
    text:ClearAllPoints()
    if mode == 2 and profName then
        local pSettings = ProfessionsHelper.db.profile.profSubSettings[profName] or { textAlign = "LEFT" }
        text:SetTextColor(0.3, 0.9, 0.25, 1) -- Standardfarbe für Mats
        
        if pSettings.textAlign == "LEFT" then
            text:SetPoint("RIGHT", frame, "LEFT", -4, 0)
        elseif pSettings.textAlign == "RIGHT" then
            text:SetPoint("LEFT", frame, "RIGHT", 4, 0)
        elseif pSettings.textAlign == "TOP" then
            text:SetPoint("BOTTOM", frame, "TOP", 0, 4)
        elseif pSettings.textAlign == "BOTTOM" then
            text:SetPoint("TOP", frame, "BOTTOM", 0, -4)
        end
    else
        -- Standard-Positionen für Kat 3 und 4
        if mode == 3 then 
            text:SetPoint("TOPLEFT", frame, "TOPLEFT", 2, -2); text:SetTextColor(0.05, 1, 0, 1)
        else 
            text:SetPoint("TOP", frame, "BOTTOM", 0, -4); text:SetTextColor(1, 1, 1, 1)
        end
    end
    
    local function Update()
        local total = 0
        for _, id in ipairs(itemIDs) do total = total + C_Item.GetItemCount(id, true, true, true, true) end
        text:SetText(total > 0 and total or "")
        icon:SetDesaturated(total == 0); icon:SetAlpha(total == 0 and 0.4 or 1.0)
    end
    
    frame:RegisterEvent("BAG_UPDATE_DELAYED"); frame:SetScript("OnEvent", Update); Update()
    MakeInteractive(frame, itemIDs); return frame
end

-- ==========================================
-- 5. INITIALISIERUNG
-- ==========================================

function Visuals:Init()
    Visuals:ClearFrames()
    PerformCharacterScan()
    
    local mapID = C_Map.GetBestMapForUnit("player")
    if not mapID or not ProfessionsHelperData then return end

    local buckets = { [1] = {}, [2] = {}, [3] = {}, [4] = {} }

    for expName, expData in pairs(ProfessionsHelperData) do
        local isCurrentExp, isInCity = false, false
        if expData.Config then
            if expData.Config.CityMapIDs and expData.Config.CityMapIDs[mapID] then
                isInCity, isCurrentExp = true, true
            end
            if not isCurrentExp and expData.Config.ParentMapIDs then
                local tempMap = mapID
                while tempMap do
                    if expData.Config.ParentMapIDs[tempMap] then isCurrentExp = true; break end
                    local info = C_Map.GetMapInfo(tempMap)
                    tempMap = info and info.parentMapID
                    if not tempMap or tempMap == 0 then break end
                end
            end
        end

        for catName, items in pairs(expData) do
            if catName ~= "Config" then
                local isWood = (catName == "Wood")
                if isWood or isCurrentExp then
                    for itemName, itemData in pairs(items) do
                        if CanPlayerSeeItem(catName, itemData) then
                            local cat = tonumber(itemData.displayCategory) or 0
                            local showItem = false
                            if isWood then showItem = true 
                            elseif (cat == 1 or cat == 4) and isCurrentExp then showItem = true 
                            elseif (cat == 2 or cat == 3) and isInCity then showItem = true end

                            if showItem and buckets[cat] then
                                local settings = ProfessionsHelper.db.profile.catSettings[cat]
                                if settings and settings.enabled then
                                    table.insert(buckets[cat], { name = itemName, data = itemData })
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    local function AddToUI(f) if f then table.insert(Visuals.ActiveFrames, f) end end
    local function HandleWrap(curX, startX, width) return (curX - startX) > width end

    -- 1. RENDERING BALKEN
    local pos1 = ProfessionsHelper.db.profile.positions[1] or {x = -450, y = 150}
    local bX, bY = pos1.x, pos1.y
    local bStartX = bX
    for _, item in ipairs(buckets[1]) do
        if HandleWrap(bX, bStartX, 600) then bX = bStartX; bY = bY - 60 end
        local hex = (item.data.color or "#FFFFFF"):gsub("#","")
        local r,g,b = tonumber(hex:sub(1,2),16)/255, tonumber(hex:sub(3,4),16)/255, tonumber(hex:sub(5,6),16)/255
        AddToUI(Visuals:CreateBar(item.name, UIParent, item.data.IDs, bX, bY, {r,g,b}))
        bX = bX + Visuals.Config.SpacingX_Bar
    end

    -- 2. RENDERING PROF-ICONS (Kategorie 3)
    local pos3 = ProfessionsHelper.db.profile.positions[3] or {x = -450, y = 50}
    local pX, pY = pos3.x, pos3.y
    for _, item in ipairs(buckets[3]) do
        AddToUI(Visuals:CreateIcon(UIParent, item.data.IDs, pX, pY, 3))
        pX = pX + Visuals.Config.SpacingX_Prof
    end

    -- 3. RENDERING MAT-ICONS (Kategorie 2 mit Filter-Logik)
    local pos2 = ProfessionsHelper.db.profile.positions[2] or {x = -450, y = 100}
    local iX, iY = pos2.x, pos2.y
    for _, item in ipairs(buckets[2]) do
        local pName = item.data.gatheringProf or "Other"
        local pSettings = ProfessionsHelper.db.profile.profSubSettings[pName] or { enabled = true }
        
        -- Nur anzeigen, wenn die Unterkategorie aktiviert ist
        if pSettings.enabled then
            AddToUI(Visuals:CreateIcon(UIParent, item.data.IDs, iX, iY, 2, pName))
            iX = iX + Visuals.Config.SpacingX_Icon
        end
    end

    -- 4. RENDERING FISHING
    local pos4 = ProfessionsHelper.db.profile.positions[4] or {x = -300, y = 400}
    local fX, fY = pos4.x, pos4.y
    local fStartX = fX
    for _, item in ipairs(buckets[4]) do
        if HandleWrap(fX, fStartX, 500) then fX = fStartX; fY = fY - 60 end
        AddToUI(Visuals:CreateIcon(UIParent, item.data.IDs, fX, fY, 4))
        fX = fX + Visuals.Config.SpacingX_Fish
    end
end

-- Event-Trigger
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:SetScript("OnEvent", function() Visuals:Init() end)

ProfessionsHelper:RegisterModule("Visuals", Visuals)