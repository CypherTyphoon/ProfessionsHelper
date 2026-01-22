local ADDON_NAME, _ = ...
local ProfessionsHelper = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)
local Visuals = {}
local LSM = LibStub("LibSharedMedia-3.0")

-- ==========================================
-- 1. KONFIGURATION & MAPPINGS
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
    local profs = { GetProfessions() }
    for _, index in ipairs(profs) do
        if index then
            local _, _, _, _, _, _, skillLine = GetProfessionInfo(index)
            local name = skillLineMapping[skillLine]
            if name then PlayerCanHandle[name] = true end
        end
    end
    -- Check für Woodcutting (Spell ID aus Midnight/The War Within)
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
    for _, frame in ipairs(self.ActiveFrames) do
        frame:Hide()
        frame:UnregisterAllEvents()
        frame:SetParent(nil)
    end
    self.ActiveFrames = {}
end

-- NEU: groupKey erlaubt das Speichern pro Beruf
local function MakeInteractive(frame, itemIDs, groupKey)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")

    frame:SetScript("OnDragStart", function(self)
        if not ProfessionsHelper.db.profile.locked then
            self:StartMoving()
            self.isDragging = true
        end
    end)

    frame:SetScript("OnDragStop", function(self)
        if not self.isDragging then return end
        self:StopMovingOrSizing()
        self.isDragging = false
        
        local parent = self:GetParent() or UIParent
        local uiX, uiY = parent:GetCenter()
        local frameX, frameY = self:GetCenter()
        local s = self:GetEffectiveScale() / parent:GetEffectiveScale()
        
        local newX = (frameX - uiX) / s
        local newY = (frameY - uiY) / s

        -- Speichere Position: Entweder für die Kategorie oder den spezifischen Beruf (Reihe)
        local storageKey = groupKey or frame.catID
        ProfessionsHelper.db.profile.positions[storageKey] = { x = newX, y = newY }

        Visuals:Init()
    end)

    frame:SetScript("OnEnter", function(self)
        if ProfessionsHelper.db.profile.locked then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            local id = itemIDs[1]
            if id then GameTooltip:SetItemByID(id) end
            GameTooltip:Show()
        end
    end)
    frame:SetScript("OnLeave", function() GameTooltip:Hide() end)
end

-- ==========================================
-- 4. SPEZIALISIERTE RENDERING FUNKTIONEN
-- ==========================================

-- KATEGORIE 1: Balken
function Visuals:CreateBar(name, parent, itemIDs, posX, posY, barColor)
    local settings = ProfessionsHelper.db.profile.catSettings[1]
    local isGrowUp = settings.growUp
    local barW, barH = settings.width or 30, settings.height or 100
    local fSize = settings.fontSize or 10

    local frame = CreateFrame("Frame", "PH_Bar_"..name, parent, "BackdropTemplate")
    frame.catID = 1
    frame:SetSize(barW, barH + barW + 5) 
    frame:SetPoint("CENTER", UIParent, "CENTER", posX, posY)
    frame:SetScale(settings.scale or 1)
    
    if settings.showBackground then
        local bg = settings.backgroundColor or {r=0, g=0, b=0, a=0.5}
        frame:SetBackdrop({bgFile = "Interface\\ChatFrame\\ChatFrameBackground"})
        frame:SetBackdropColor(bg.r, bg.g, bg.b, bg.a)
    else
        frame:SetBackdrop(nil)
    end
    
    local bar = CreateFrame("StatusBar", nil, frame)
    bar:SetSize(barW, barH)
    bar:SetStatusBarTexture(LSM:Fetch("statusbar", settings.barTexture or "Cilo"))
    bar:SetStatusBarColor(unpack(barColor))
    
    local barBg = bar:CreateTexture(nil, "BACKGROUND")
    barBg:SetAllPoints(); barBg:SetColorTexture(0.1, 0.1, 0.1, 0.6)

    local icon = frame:CreateTexture(nil, "ARTWORK")
    icon:SetSize(barW, barW)
    
    if isGrowUp then
        bar:SetOrientation("VERTICAL"); bar:SetPoint("BOTTOM", frame, "BOTTOM", 0, barW + 2)
        icon:SetPoint("BOTTOM", frame, "BOTTOM", 0, 0)
    else
        bar:SetOrientation("VERTICAL"); bar:SetReverseFill(true); bar:SetPoint("TOP", frame, "TOP", 0, -(barW + 2))
        icon:SetPoint("TOP", frame, "TOP", 0, 0)
    end
    
    local function CreateCenteredText(offsetY, colorKey)
        local t = bar:CreateFontString(nil, "OVERLAY")
        t:SetFont(LSM:Fetch("font", settings.fontName or "Friz Quadrata TT"), fSize, "OUTLINE")
        local c = settings[colorKey] or {r=1, g=1, b=1}
        t:SetTextColor(c.r, c.g, c.b)
        t:SetPoint("CENTER", bar, "CENTER", 0, offsetY)
        return t
    end

    local tB = CreateCenteredText(15, "colorQ1")
    local tS = CreateCenteredText(0, "colorQ2")
    local tG = CreateCenteredText(-15, "colorQ3")

    local function Update()
        local b = C_Item.GetItemCount(itemIDs[1] or 0, true, true, true, true)
        local s = C_Item.GetItemCount(itemIDs[2] or 0, true, true, true, true)
        local g = C_Item.GetItemCount(itemIDs[3] or 0, true, true, true, true)
        
        if not itemIDs[3] then 
            tB:SetPoint("CENTER", bar, "CENTER", 0, 10); tS:SetPoint("CENTER", bar, "CENTER", 0, -10)
            tG:Hide(); tB:SetText(b > 0 and b or ""); tS:SetText(s > 0 and s or "")
        else 
            tB:SetPoint("CENTER", bar, "CENTER", 0, 15); tS:SetPoint("CENTER", bar, "CENTER", 0, 0)
            tG:Show(); tB:SetText(b > 0 and b or ""); tS:SetText(s > 0 and s or ""); tG:SetText(g > 0 and g or "")
        end

        local total = b + s + g
        bar:SetMinMaxValues(0, 1000); bar:SetValue(total)
        local dID = (g > 0 and itemIDs[3]) or (s > 0 and itemIDs[2]) or itemIDs[1]
        if dID then icon:SetTexture(C_Item.GetItemIconByID(dID)) end
        frame:SetAlpha(total == 0 and 0.4 or 1.0)
    end
    
    frame:RegisterEvent("BAG_UPDATE_DELAYED"); frame:SetScript("OnEvent", Update); Update()
    MakeInteractive(frame, itemIDs); return frame
end

-- KATEGORIE 2: Material Icons (mit profSubSettings und groupKey)
function Visuals:CreateMaterialIcon(parent, ids, x, y, profName)
    local frame = CreateFrame("Frame", nil, parent)
    frame.catID = 2
    local settings = ProfessionsHelper.db.profile.catSettings[2]
    local sub = ProfessionsHelper.db.profile.profSubSettings[profName or "Other"] or {}
    
    frame:SetSize(20, 20) 
    frame:SetScale(settings.scale or 1)
    frame:SetPoint("CENTER", UIParent, "CENTER", x, y)

    local icon = frame:CreateTexture(nil, "ARTWORK"); icon:SetAllPoints()
    icon:SetTexture(C_Item.GetItemIconByID(ids[1]))

    local text = frame:CreateFontString(nil, "OVERLAY", "NumberFontNormalSmall")
    local align = sub.textAlign or "BOTTOM"
    local color = sub.color or {r=0.3, g=0.9, b=0.25}

    text:ClearAllPoints()
    if align == "LEFT" then 
        text:SetPoint("RIGHT", frame, "LEFT", -4, 0)
    elseif align == "RIGHT" then 
        text:SetPoint("LEFT", frame, "RIGHT", 4, 0)
    elseif align == "TOP" then 
        text:SetPoint("BOTTOM", frame, "TOP", 0, 4)
    else 
        text:SetPoint("TOP", frame, "BOTTOM", 0, -4) 
    end
    text:SetTextColor(color.r, color.g, color.b)

    local function Update()
        local total = 0
        for _, id in ipairs(ids) do total = total + C_Item.GetItemCount(id, true, true, true, true) end
        text:SetText(total > 0 and total or "")
        icon:SetDesaturated(total == 0); icon:SetAlpha(total == 0 and 0.4 or 1.0)
    end

    frame:RegisterEvent("BAG_UPDATE_DELAYED"); frame:SetScript("OnEvent", Update); Update()
    -- Übergabe des Berufsnamens als groupKey für Sticky-Movement
    MakeInteractive(frame, ids, profName) 
    return frame
end

-- KATEGORIE 3: Berufs-Icons
function Visuals:CreateProfessionIcon(parent, ids, x, y)
    local frame = CreateFrame("Frame", nil, parent)
    frame.catID = 3
    frame:SetSize(40, 40)
    frame:SetScale(ProfessionsHelper.db.profile.catSettings[3].scale or 1)
    frame:SetPoint("CENTER", UIParent, "CENTER", x, y)

    local icon = frame:CreateTexture(nil, "ARTWORK"); icon:SetAllPoints()
    icon:SetTexture(C_Item.GetItemIconByID(ids[1]))

    local text = frame:CreateFontString(nil, "OVERLAY", "NumberFontNormalSmall")
    text:SetPoint("TOPLEFT", frame, "TOPLEFT", 2, -2)
    text:SetTextColor(0.05, 1, 0, 1)

    local function Update()
        local total = 0
        for _, id in ipairs(ids) do total = total + C_Item.GetItemCount(id, true, true, true, true) end
        text:SetText(total > 0 and total or "")
        icon:SetDesaturated(total == 0); icon:SetAlpha(total == 0 and 0.4 or 1.0)
    end

    frame:RegisterEvent("BAG_UPDATE_DELAYED"); frame:SetScript("OnEvent", Update); Update()
    MakeInteractive(frame, ids); return frame
end

-- KATEGORIE 4: Angel-Icons
function Visuals:CreateFishingIcon(parent, ids, x, y)
    local frame = CreateFrame("Frame", nil, parent)
    frame.catID = 4
    local settings = ProfessionsHelper.db.profile.catSettings[4]
    frame:SetSize(30, 30)
    frame:SetScale(settings.scale or 1)
    frame:SetPoint("CENTER", UIParent, "CENTER", x, y)

    local icon = frame:CreateTexture(nil, "ARTWORK"); icon:SetAllPoints()
    icon:SetTexture(C_Item.GetItemIconByID(ids[1]))

    local text = frame:CreateFontString(nil, "OVERLAY", "NumberFontNormalSmall")
    local align = settings.textAlign or "BOTTOM"
    text:ClearAllPoints()
    if align == "LEFT" then text:SetPoint("RIGHT", frame, "LEFT", -4, 0)
    elseif align == "RIGHT" then text:SetPoint("LEFT", frame, "RIGHT", 4, 0)
    elseif align == "TOP" then text:SetPoint("BOTTOM", frame, "TOP", 0, 4)
    else text:SetPoint("TOP", frame, "BOTTOM", 0, -4) end
    text:SetTextColor(1, 1, 1)

    local function Update()
        local total = 0
        for _, id in ipairs(ids) do total = total + C_Item.GetItemCount(id, true, true, true, true) end
        text:SetText(total > 0 and total or "")
        icon:SetDesaturated(total == 0); icon:SetAlpha(total == 0 and 0.4 or 1.0)
    end

    frame:RegisterEvent("BAG_UPDATE_DELAYED"); frame:SetScript("OnEvent", Update); Update()
    MakeInteractive(frame, ids); return frame
end

-- ==========================================
-- 5. INITIALISIERUNG (INIT)
-- ==========================================

function Visuals:Init()
    self:ClearFrames()
    PerformCharacterScan()
    
    local mapID = C_Map.GetBestMapForUnit("player")
    if not mapID or not ProfessionsHelperData then return end

    local buckets = { [1] = {}, [2] = {}, [3] = {}, [4] = {} }

    for expName, expData in pairs(ProfessionsHelperData) do
        local isCurrentExp, isInCity = false, false
        if expData.Config then
            if expData.Config.CityMapIDs and expData.Config.CityMapIDs[mapID] then isInCity, isCurrentExp = true, true end
            if not isCurrentExp and expData.Config.ParentMapIDs then
                local tempMap = mapID
                while tempMap do
                    if expData.Config.ParentMapIDs[tempMap] then isCurrentExp = true; break end
                    local info = C_Map.GetMapInfo(tempMap); tempMap = info and info.parentMapID
                    if not tempMap or tempMap == 0 then break end
                end
            end
        end

        for catName, items in pairs(expData) do
            if catName ~= "Config" then
                for itemName, itemData in pairs(items) do
                    if CanPlayerSeeItem(catName, itemData) then
                        local cat = tonumber(itemData.displayCategory) or 0
                        local showItem = false
                        
                        -- Woodcutting ist global sichtbar, andere nach Zone
                        if catName == "Wood" then showItem = true 
                        elseif (cat == 1 or cat == 4) and isCurrentExp then showItem = true 
                        elseif (cat == 2 or cat == 3) and isInCity then showItem = true end

                        if showItem and buckets[cat] then
                            local settings = ProfessionsHelper.db.profile.catSettings[cat]
                            if settings and settings.enabled then
                                table.insert(buckets[cat], { name = itemName, data = itemData, prof = itemData.gatheringProf or "Other" })
                            end
                        end
                    end
                end
            end
        end
    end

    local function AddToUI(f) if f then table.insert(self.ActiveFrames, f) end end
    local function HandleWrap(curX, startX, width) return (curX - startX) > width end

    -- 1. RENDERING BALKEN (Wie bisher)
    local pos1 = ProfessionsHelper.db.profile.positions[1] or {x = -450, y = 150}
    local bX, bY = pos1.x, pos1.y
    local bStartX = bX
    for _, item in ipairs(buckets[1]) do
        if HandleWrap(bX, bStartX, self.Config.MaxWidthMain) then bX = bStartX; bY = bY - self.Config.RowHeight end
        local hex = (item.data.color or "#FFFFFF"):gsub("#","")
        local r,g,b = tonumber(hex:sub(1,2),16)/255, tonumber(hex:sub(3,4),16)/255, tonumber(hex:sub(5,6),16)/255
        AddToUI(self:CreateBar(item.name, UIParent, item.data.IDs, bX, bY, {r,g,b}))
        bX = bX + self.Config.SpacingX_Bar
    end

    -- 2. RENDERING PROF-ICONS (Wie bisher)
    local pos3 = ProfessionsHelper.db.profile.positions[3] or {x = -450, y = 50}
    local pX, pY = pos3.x, pos3.y
    if ProfessionsHelper.db.profile.catSettings[3].enabled then
        for _, item in ipairs(buckets[3]) do
            AddToUI(self:CreateProfessionIcon(UIParent, item.data.IDs, pX, pY))
            pX = pX + self.Config.SpacingX_Prof
        end
    end

    -- 3. RENDERING MAT-ICONS (NEUES REIHEN-SYSTEM)
    if ProfessionsHelper.db.profile.catSettings[2].enabled then
        -- Erst nach Berufen sortieren
        local profGroups = {}
        for _, item in ipairs(buckets[2]) do
            profGroups[item.prof] = profGroups[item.prof] or {}
            table.insert(profGroups[item.prof], item)
        end

        -- Jede Gruppe (Reihe) einzeln zeichnen
        for prof, items in pairs(profGroups) do
            local pSettings = ProfessionsHelper.db.profile.profSubSettings[prof] or { enabled = true }
            if pSettings.enabled then
                -- Position aus dem Berufsspeicher laden (Mining, Herbalism, etc.)
                -- Standardwerte leicht versetzt, damit sie nicht alle aufeinander liegen
                local defaultY = 100
                if prof == "Herbalism" then defaultY = 130 elseif prof == "Skinning" then defaultY = 70 end
                
                local pos = ProfessionsHelper.db.profile.positions[prof] or {x = -450, y = defaultY}
                local iX, iY = pos.x, pos.y
                
                for i, item in ipairs(items) do
                    -- Sticky-Logik: Erstes Icon ist Anker, Rest folgt mit Abstand
                    local iconX = iX + ((i-1) * self.Config.SpacingX_Icon)
                    AddToUI(self:CreateMaterialIcon(UIParent, item.data.IDs, iconX, iY, prof))
                end
            end
        end
    end

    -- 4. RENDERING FISHING (Wie bisher)
    local pos4 = ProfessionsHelper.db.profile.positions[4] or {x = -300, y = 400}
    local fX, fY = pos4.x, pos4.y
    local fStartX = fX
    if ProfessionsHelper.db.profile.catSettings[4].enabled then
        for _, item in ipairs(buckets[4]) do
            if HandleWrap(fX, fStartX, self.Config.MaxWidthFish) then fX = fStartX; fY = fY - self.Config.RowHeight end
            AddToUI(self:CreateFishingIcon(UIParent, item.data.IDs, fX, fY))
            fX = fX + self.Config.SpacingX_Fish
        end
    end
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:SetScript("OnEvent", function() Visuals:Init() end)

ProfessionsHelper:RegisterModule("Visuals", Visuals)