local ADDON_NAME, _ = ...
local Visuals = {}
local LSM = LibStub("LibSharedMedia-3.0")

-- ==========================================
-- 1. KONFIGURATION
-- ==========================================
Visuals.ActiveFrames = {}

Visuals.Config = {
    MainX = -450, MainY = 150,
    FishX = -300, FishY = 400,
    
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

    -- Woodcutting Check via Item (Erntebeil 253580)
    -- Deckt Taschen, Bank, Reagenzienbank und Ausrüstung ab
    local beilID = 253580
    if C_Item.GetItemCount(beilID, true, true, true, true) > 0 then 
        PlayerCanHandle["Woodcutting"] = true 
    end
end

local function CanPlayerSeeItem(category, itemData)
    if not itemData or not itemData.IDs then return false end
    
    if itemData.gatheringProf then 
        return PlayerCanHandle[itemData.gatheringProf] == true 
    end
    
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
-- 3. UI HILFSFUNKTIONEN
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
    frame:SetMovable(true); frame:EnableMouse(true); frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving); frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
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
    local frame = CreateFrame("Frame", "PH_Bar_"..name, parent)
    frame:SetSize(32, 130); frame:SetPoint("CENTER", UIParent, "CENTER", posX, posY)
    
    local bar = CreateFrame("StatusBar", nil, frame)
    bar:SetSize(30, 100); bar:SetPoint("BOTTOM", frame, "BOTTOM", 0, 32)
    bar:SetStatusBarTexture(LSM:Fetch("statusbar", "Cilo") or "Interface\\TargetingFrame\\UI-StatusBar")
    bar:SetStatusBarColor(unpack(barColor)); bar:SetOrientation("VERTICAL")
    
    local bg = bar:CreateTexture(nil, "BACKGROUND"); bg:SetAllPoints(); bg:SetColorTexture(0, 0, 0, 0.5)
    local icon = frame:CreateTexture(nil, "ARTWORK"); icon:SetSize(32, 32); icon:SetPoint("BOTTOM", frame, "BOTTOM", 0, 0)
    
    local function CreateT(offsetY, color)
        local t = bar:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        t:SetPoint("CENTER", bar, "CENTER", 0, offsetY); t:SetTextColor(unpack(color))
        return t
    end
    local tB, tS, tG = CreateT(15, {1, 0.35, 0}), CreateT(0, {0.75, 0.75, 0.75}), CreateT(-15, {1, 0.84, 0})

    local function Update()
        local b = C_Item.GetItemCount(itemIDs[1] or 0, true, true, true, true)
        local s = C_Item.GetItemCount(itemIDs[2] or 0, true, true, true, true)
        local g = C_Item.GetItemCount(itemIDs[3] or 0, true, true, true, true)
        local total = b + s + g
        bar:SetMinMaxValues(0, math.max(1000, total)); bar:SetValue(total)
        tB:SetText(b > 0 and b or ""); tS:SetText(s > 0 and s or ""); tG:SetText(g > 0 and g or "")
        local dID = (g > 0 and itemIDs[3]) or (s > 0 and itemIDs[2]) or itemIDs[1]
        if dID then icon:SetTexture(C_Item.GetItemIconByID(dID)) end
        frame:SetAlpha(total == 0 and 0.4 or 1.0)
    end
    
    frame:RegisterEvent("BAG_UPDATE_DELAYED"); frame:SetScript("OnEvent", Update); Update()
    MakeInteractive(frame, itemIDs); return frame
end

function Visuals:CreateIcon(parent, itemIDs, posX, posY, mode)
    local frame = CreateFrame("Frame", nil, parent)
    local size = (mode == 3) and 40 or (mode == 4 and 30 or 20)
    frame:SetSize(size, size); frame:SetPoint("CENTER", UIParent, "CENTER", posX, posY)
    
    local icon = frame:CreateTexture(nil, "ARTWORK"); icon:SetAllPoints()
    icon:SetTexture(C_Item.GetItemIconByID(itemIDs[1]))
    
    local text = frame:CreateFontString(nil, "OVERLAY", "NumberFontNormalSmall")
    if mode == 3 then
        text:SetPoint("TOPLEFT", frame, "TOPLEFT", 2, -2); text:SetTextColor(0.05, 1, 0, 1)
    elseif mode == 4 then
        text:SetPoint("TOP", frame, "BOTTOM", 0, -4); text:SetTextColor(1, 1, 1, 1)
    else
        text:SetPoint("RIGHT", frame, "LEFT", -4, 0); text:SetTextColor(0.3, 0.9, 0.25, 1)
    end
    
    local function Update()
        local total = 0
        for _, id in ipairs(itemIDs) do 
            total = total + C_Item.GetItemCount(id, true, true, true, true) 
        end
        text:SetText(total > 0 and total or "")
        icon:SetDesaturated(total == 0); icon:SetAlpha(total == 0 and 0.4 or 1.0)
    end
    
    frame:RegisterEvent("BAG_UPDATE_DELAYED"); frame:SetScript("OnEvent", Update); Update()
    MakeInteractive(frame, itemIDs); return frame
end

-- ==========================================
-- 5. INITIALISIERUNG & GRADUIERUNG
-- ==========================================

function Visuals:Init()
    Visuals:ClearFrames()
    PerformCharacterScan()
    
    local mapID = C_Map.GetBestMapForUnit("player")
    if not mapID or not ProfessionsHelperData then return end

    local buckets = { [1] = {}, [2] = {}, [3] = {}, [4] = {} }

    for expName, expData in pairs(ProfessionsHelperData) do
        local isCurrentExp = false
        local isInCity = false
        
        -- Config aus der Expansions-Lua auslesen
        if expData.Config then
            -- Stadt Check
            if expData.Config.CityMapIDs and expData.Config.CityMapIDs[mapID] then
                isInCity = true
                isCurrentExp = true
            end

            -- Expansion Check (Hierarchie-Suche)
            if not isCurrentExp and expData.Config.ParentMapIDs then
                local tempMap = mapID
                while tempMap do
                    if expData.Config.ParentMapIDs[tempMap] then
                        isCurrentExp = true
                        break
                    end
                    local info = C_Map.GetMapInfo(tempMap)
                    tempMap = info and info.parentMapID
                    if not tempMap or tempMap == 0 then break end
                end
            end
        end

        -- Items filtern
        for catName, items in pairs(expData) do
            if catName ~= "Config" then
                local isWood = (catName == "Wood")
                
                -- Filter-Logik: Holz immer | Andere Kategorien nur im passenden Gebiet
                if isWood or isCurrentExp then
                    for itemName, itemData in pairs(items) do
                        if CanPlayerSeeItem(catName, itemData) then
                            local cat = tonumber(itemData.displayCategory) or 0
                            local showItem = false

                            -- DEINE GRADUIERUNG:
                            if isWood then
                                showItem = true -- Holz: Immer
                            elseif (cat == 1 or cat == 4) and isCurrentExp then
                                showItem = true -- Balken & Fisch: Ganze Expansion
                            elseif (cat == 2 or cat == 3) and isInCity then
                                showItem = true -- Icons & ProfIcons: Nur Stadt
                            end

                            if showItem and buckets[cat] then
                                table.insert(buckets[cat], { name = itemName, data = itemData })
                            end
                        end
                    end
                end
            end
        end
    end

    -- Rendering Logik
    local function AddToUI(f) if f then table.insert(Visuals.ActiveFrames, f) end end

    local startX = Visuals.Config.MainX
    local curX, curY = startX, Visuals.Config.MainY

    local function HandleWrap()
        if (curX - startX) > Visuals.Config.MaxWidthMain then
            curX = startX
            curY = curY - Visuals.Config.RowHeight
        end
    end

    -- 1. Balken
    for _, item in ipairs(buckets[1]) do
        HandleWrap()
        local hex = (item.data.color or "#FFFFFF"):gsub("#","")
        local r,g,b = tonumber(hex:sub(1,2),16)/255, tonumber(hex:sub(3,4),16)/255, tonumber(hex:sub(5,6),16)/255
        AddToUI(Visuals:CreateBar(item.name, UIParent, item.data.IDs, curX, curY, {r,g,b}))
        curX = curX + Visuals.Config.SpacingX_Bar
    end
    if #buckets[1] > 0 then curX = curX + 15 end

    -- 2. ProfIcons
    for _, item in ipairs(buckets[3]) do
        HandleWrap()
        AddToUI(Visuals:CreateIcon(UIParent, item.data.IDs, curX, curY, 3))
        curX = curX + Visuals.Config.SpacingX_Prof
    end
    if #buckets[3] > 0 then curX = curX + 10 end

    -- 3. Icons (Mats)
    for _, item in ipairs(buckets[2]) do
        HandleWrap()
        AddToUI(Visuals:CreateIcon(UIParent, item.data.IDs, curX, curY, 2))
        curX = curX + Visuals.Config.SpacingX_Icon
    end

    -- 4. Fishing
    local fStartX = Visuals.Config.FishX
    local fX, fY = fStartX, Visuals.Config.FishY
    for _, item in ipairs(buckets[4]) do
        if (fX - fStartX) > Visuals.Config.MaxWidthFish then
            fX = fStartX
            fY = fY - Visuals.Config.RowHeight
        end
        AddToUI(Visuals:CreateIcon(UIParent, item.data.IDs, fX, fY, 4))
        fX = fX + Visuals.Config.SpacingX_Fish
    end
end

-- Event-Trigger für Gebietswechsel
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:SetScript("OnEvent", function() Visuals:Init() end)

ProfessionsHelper:RegisterModule("Visuals", Visuals)