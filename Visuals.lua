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
    SpacingX_Skill = 40,
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
    -- Spezialfall Holzfällen (Spell-Check)
    if C_SpellBook.IsSpellKnownOrInSpellBook(1256697) then 
        PlayerCanHandle["Woodcutting"] = true 
    end
end

local function CanPlayerSeeItem(category, itemData)
    if not itemData or (not itemData.IDs and not itemData.spellID) then return false end

    local function HasMatch(profEntry)
        if not profEntry then return false end
        if type(profEntry) == "table" then
            for _, p in ipairs(profEntry) do
                if PlayerCanHandle and PlayerCanHandle[p] then return true end
            end
        elseif type(profEntry) == "string" then
            if PlayerCanHandle and PlayerCanHandle[profEntry] then return true end
        end
        return false
    end

    if category == "Fishing" or category == "Wood" then
        return HasMatch(itemData.gatheringProf)
    end

    local cat = tonumber(itemData.displayCategory) or 0

    if cat == 1 or cat == 5 then
        return HasMatch(itemData.gatheringProf)
    elseif cat == 2 then
        return HasMatch(itemData.processingProfs)
    elseif cat == 3 then
        local isMaker = HasMatch(itemData.gatheringProf)
        if isMaker then return true end
        local matchProc = HasMatch(itemData.processingProfs)
        return isMaker and matchProc
    end

    return false
end

-- ==========================================
-- 3. UI HILFSFUNKTIONEN
-- ==========================================

function Visuals:ClearFrames()
    for _, frame in ipairs(self.ActiveFrames) do
        frame:Hide()
        frame:UnregisterAllEvents()
        frame:SetParent(nil)
    end
    self.ActiveFrames = {}
end

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

        local storageKey = groupKey or frame.catID
        ProfessionsHelper.db.profile.positions[storageKey] = { x = newX, y = newY }
        Visuals:Init()
    end)

    frame:SetScript("OnEnter", function(self)
        if ProfessionsHelper.db.profile.locked then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            
            -- FIX: Unterscheidung zwischen Tabelle (Item) und Zahl (Spell)
            if type(itemIDs) == "table" then
                if frame.catID == 5 then
                    GameTooltip:SetSpellByID(itemIDs[1])
                else
                    GameTooltip:SetItemByID(itemIDs[1])
                end
            elseif type(itemIDs) == "number" then
                -- Wenn es eine reine Zahl ist, behandeln wir es als Spell (Experiment)
                GameTooltip:SetSpellByID(itemIDs)
            end
            
            GameTooltip:Show()
        end
    end)
    frame:SetScript("OnLeave", function() GameTooltip:Hide() end)
end

function Visuals:GetCraftableAmount(recipeID)
    local db = ProfessionsHelperData["The War Within"]
    if not db or not db.RecipeDB then return 0 end
    
    local recipe = db.RecipeDB[recipeID]
    if not recipe then return 0 end

    local maxPossible = 99999
    local slots = recipe.slots or recipe 

    for _, slot in ipairs(slots) do
        if type(slot) == "table" then
            local totalStockInSlot = 0
            local amountNeeded = slot.amount or 1
            
            -- FALL A: Spezial-Gruppe (z.B. Kräuter für Experimente)
            if slot.type == "group" and slot.key == "ExperimentHerbs" then
                local bestSingleStack = 0
                -- Wir gehen durch alle Kräuter in der Datenbank
                if db.Herbs then
                    for _, herbData in pairs(db.Herbs) do
                        if herbData.canExperiment then
                            for _, id in ipairs(herbData.IDs) do
                                local count = C_Item.GetItemCount(id, true, true, true, true, true)
                                if count > bestSingleStack then bestSingleStack = count end
                            end
                        end
                    end
                end
                totalStockInSlot = bestSingleStack
            
            -- FALL B: Normale ID-Liste
            elseif slot.ids then
                for _, id in ipairs(slot.ids) do
                    totalStockInSlot = totalStockInSlot + C_Item.GetItemCount(id, true, true, true, true, true)
                end
            end
            
            local possibleWithThisSlot = math.floor((totalStockInSlot / amountNeeded) + 0.0001)
            if possibleWithThisSlot < maxPossible then
                maxPossible = possibleWithThisSlot
            end
        end
    end

    return (maxPossible == 99999) and 0 or maxPossible
end

function Visuals:GetSpellStatus(spellID)
    if not spellID then return false, nil, nil end
    local startTime, duration, enabled = GetSpellCooldown(spellID)
    local charges, maxCharges, chargeStart, chargeDuration = C_Spell.GetSpellCharges(spellID)
    
    if charges and maxCharges then
        return (charges == 0), tostring(charges), charges
    elseif startTime and duration > 0 then
        local timeLeft = (startTime + duration) - GetTime()
        if timeLeft > 0 then
            local hours = math.ceil(timeLeft / 3600)
            return true, hours .. "h", 0
        end
    end
    return false, nil, nil
end

local function FormatTime(s)
    if not s or s <= 0 then return "" end
    if s < 60 then return math.floor(s) .. "s" end
    if s < 3600 then return math.ceil(s / 60) .. "m" end
    
    -- Anzeige bei Stunden: 1h 30m statt nur 2h
    if s < 86400 then 
        local h = math.floor(s / 3600)
        local m = math.floor((s % 3600) / 60)
        if h < 24 then -- Bei weniger als 10 Stunden zeigen wir Minuten dazu
            return h .. "h" .. m .. "m"
        end
        return h .. "h" 
    end
    return math.ceil(s / 86400) .. "d"
end
-- ==========================================
-- 4. RENDERING FUNKTIONEN
-- ==========================================

-- Bars
function Visuals:CreateBar(name, parent, itemIDs, posX, posY, barColor, customSettings, profName)
    -- 1. Einstellungs-Priorität festlegen
    local settings = customSettings or ProfessionsHelper.db.profile.catSettings[1]
    
    local isGrowUp = settings.growUp
    local barW = settings.width or 30
    local barH = settings.height or 100
    local fSize = settings.fontSize or 10

    -- 2. Frame-Erstellung
    local frame = CreateFrame("Frame", "PH_Bar_"..name, parent, "BackdropTemplate")
    frame.catID = 1
    frame.profName = profName
    
    -- Der Frame muss so groß sein wie der Balken + das Icon + ein kleiner Puffer
    frame:SetSize(barW, barH + barW + 5) 
    frame:SetPoint("CENTER", UIParent, "CENTER", posX, posY)
    frame:SetScale(settings.scale or 1)
    
    -- Hintergrund (optional)
    if settings.showBackground then
        local bg = settings.backgroundColor or {r=0, g=0, b=0, a=0.5}
        frame:SetBackdrop({bgFile = "Interface\\ChatFrame\\ChatFrameBackground"})
        frame:SetBackdropColor(bg.r, bg.g, bg.b, bg.a)
    end
    
    -- 3. Die Statusbar
    local bar = CreateFrame("StatusBar", nil, frame)
    bar:SetSize(barW, barH)
    bar:SetStatusBarTexture(LSM:Fetch("statusbar", settings.barTexture or "Cilo"))
    
    -- FARB-LOGIK: Prüfen, ob wir einen Gradienten haben (6 Werte) oder Uni-Farbe (3 Werte)
    if #barColor >= 6 then
        -- Wir färben die Textur der Bar mit einem vertikalen Gradienten
        local tex = bar:GetStatusBarTexture()
        tex:SetGradient("VERTICAL", 
            CreateColor(barColor[1], barColor[2], barColor[3], 1), -- Start (Unten)
            CreateColor(barColor[4], barColor[5], barColor[6], 1)  -- Ende (Oben)
        )
    else
        -- Normale Uni-Farbe
        bar:SetStatusBarColor(barColor[1], barColor[2], barColor[3])
    end
    
    local barBg = bar:CreateTexture(nil, "BACKGROUND")
    barBg:SetAllPoints(); barBg:SetColorTexture(0.1, 0.1, 0.1, 0.6)

    -- 4. Das Icon
    local icon = frame:CreateTexture(nil, "ARTWORK")
    icon:SetSize(barW, barW)
    
    -- Ausrichtung (GrowUp = Balken über Icon, sonst Icon über Balken)
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
    
    -- 5. Texte (Zahlen auf dem Balken)
    local textOverlay = CreateFrame("Frame", nil, frame)
    textOverlay:SetAllPoints(bar)
    textOverlay:SetFrameLevel(bar:GetFrameLevel() + 10) -- Setzt den Text weit vor die Bar

    local function CreateCenteredText(colorKey)
        -- Parent ist jetzt textOverlay statt frame
        local t = textOverlay:CreateFontString(nil, "OVERLAY", nil, 7)
        
        local fontPath = LSM:Fetch("font", settings.fontName or "Friz Quadrata TT")
        if not fontPath or fontPath == "" then fontPath = "Fonts\\FRIZQT__.TTF" end
        
        t:SetFont(fontPath, fSize, "OUTLINE")
        
        -- Schatten für maximale Lesbarkeit
        t:SetShadowOffset(1, -1)
        t:SetShadowColor(0, 0, 0, 1)

        local c = settings[colorKey] or (ProfessionsHelper.db.profile.catSettings[1] and ProfessionsHelper.db.profile.catSettings[1][colorKey]) or {r=1, g=1, b=1}
        t:SetTextColor(c.r, c.g, c.b)
        
        t:SetJustifyH("CENTER")
        t:SetWidth(barW + 10)
        
        return t
    end

    local tB = CreateCenteredText("colorQ1")
    local tS = CreateCenteredText("colorQ2")
    local tG = CreateCenteredText("colorQ3")

    -- 6. Update-Logik
    local function Update()
            local b = C_Item.GetItemCount(itemIDs[1] or 0, true, true, true, true)
            local s = C_Item.GetItemCount(itemIDs[2] or 0, true, true, true, true)
            local g = C_Item.GetItemCount(itemIDs[3] or 0, true, true, true, true)
            
            -- Positionierung basierend auf deiner Vorgabe
            if not itemIDs[3] then 
                -- Fall: Nur 2 Qualitäten (z.B. Fisch, Stoffe ohne Q3)
                -- Qualität 1 = +8 (Bronze/Silber Position)
                -- Qualität 2 = -8 (Silber/Gold Position)
                tB:SetPoint("CENTER", bar, "CENTER", 0, 8)
                tS:SetPoint("CENTER", bar, "CENTER", 0, -8)
                tG:Hide()
            else 
                -- Fall: 3 Qualitäten (Klassisch Erze/Kräuter)
                -- Bronze = +15, Silber = 0, Gold = -15
                tB:SetPoint("CENTER", bar, "CENTER", 0, 15)
                tS:SetPoint("CENTER", bar, "CENTER", 0, 0)
                tG:SetPoint("CENTER", bar, "CENTER", 0, -15)
                tG:Show()
            end

            -- Texte setzen (nur anzeigen wenn > 0)
            tB:SetText(b > 0 and b or "")
            tS:SetText(s > 0 and s or "")
            tG:SetText(g > 0 and g or "")

            local total = b + s + g
            bar:SetMinMaxValues(0, 1000)
            bar:SetValue(total)
            
            local dID = (g > 0 and itemIDs[3]) or (s > 0 and itemIDs[2]) or itemIDs[1]
            if dID then icon:SetTexture(C_Item.GetItemIconByID(dID)) end
            frame:SetAlpha(total == 0 and 0.4 or 1.0)
        end
    
    frame:RegisterEvent("BAG_UPDATE_DELAYED")
    frame:SetScript("OnEvent", Update)
    Update()

    -- WICHTIG: Speicher-Key für Drag&Drop
    local storageKey = profName and (profName .. "_Bar") or 1
    MakeInteractive(frame, itemIDs, storageKey) 
    
    return frame
end

-- Material Icons
function Visuals:CreateMaterialIcon(parent, ids, x, y, profName)
    local frame = CreateFrame("Frame", nil, parent)
    frame.catID = 2
    local settings = ProfessionsHelper.db.profile.catSettings[2]
    local sub = ProfessionsHelper.db.profile.profSubSettings[profName or "Other"] or {}
    
    frame:SetSize(20, 20); frame:SetScale(settings.scale or 1)
    frame:SetPoint("CENTER", UIParent, "CENTER", x, y)

    local icon = frame:CreateTexture(nil, "ARTWORK"); icon:SetAllPoints()
    icon:SetTexture(C_Item.GetItemIconByID(ids[1]))

    local text = frame:CreateFontString(nil, "OVERLAY", "NumberFontNormalSmall")
    local align = sub.textAlign or "BOTTOM"
    local color = sub.color or {r=0.3, g=0.9, b=0.25}

    text:ClearAllPoints()
    if align == "LEFT" then text:SetPoint("RIGHT", frame, "LEFT", -4, 0)
    elseif align == "RIGHT" then text:SetPoint("LEFT", frame, "RIGHT", 4, 0)
    elseif align == "TOP" then text:SetPoint("BOTTOM", frame, "TOP", 0, 4)
    else text:SetPoint("TOP", frame, "BOTTOM", 0, -4) end
    text:SetTextColor(color.r, color.g, color.b)

    local function Update()
        local total = 0
        for _, id in ipairs(ids) do total = total + C_Item.GetItemCount(id, true, true, true, true) end
        text:SetText(total > 0 and total or "")
        icon:SetDesaturated(total == 0); icon:SetAlpha(total == 0 and 0.4 or 1.0)
    end

    frame:RegisterEvent("BAG_UPDATE_DELAYED"); frame:SetScript("OnEvent", Update); Update()
    MakeInteractive(frame, ids, profName); return frame
end

-- Profession Icons
function Visuals:CreateProfessionIcon(parent, ids, x, y)
    -- 1. FRAME INITIALISIERUNG (Das hat gefehlt!)
    local frame = CreateFrame("Frame", nil, parent)
    frame.catID = 3; frame:SetSize(40, 40)
    frame.itemID = (type(ids) == "table") and ids[1] or ids
    frame:SetScale(ProfessionsHelper.db.profile.catSettings[3].scale or 1)
    frame:SetPoint("CENTER", UIParent, "CENTER", x, y)
    
    local icon = frame:CreateTexture(nil, "ARTWORK"); icon:SetAllPoints()
    icon:SetTexture(C_Item.GetItemIconByID(frame.itemID))

    -- Schriftart-Pfad
    local fontPath = "Fonts\\FRIZQT__.TTF"

    -- 2. TEXT-ELEMENTE ERSTELLEN
    -- Bestand Oben Links (Grün) - Schriftgröße 14
    local textStock = frame:CreateFontString(nil, "OVERLAY")
    textStock:SetFont(fontPath, 14, "OUTLINE")
    textStock:SetPoint("TOPLEFT", frame, "TOPLEFT", 2, -2)
    textStock:SetTextColor(0, 1, 0)

    -- Ertrag Mitte Rechts (Orange) - Näher an die Menge geschoben (Y=4)
    local textYield = frame:CreateFontString(nil, "OVERLAY")
    textYield:SetFont(fontPath, 12, "OUTLINE") 
    textYield:SetPoint("RIGHT", frame, "RIGHT", -2, 4) 
    textYield:SetTextColor(1, 0.6, 0) 

    -- Machbare Menge Unten Rechts (Gelb) - Schriftgröße 14
    local textCraft = frame:CreateFontString(nil, "OVERLAY")
    textCraft:SetFont(fontPath, 14, "OUTLINE")
    textCraft:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)
    textCraft:SetTextColor(1, 0.82, 0)

    local function Update()
        -- Bestand berechnen (mit allen 6 Parametern)
        local totalOwned = 0
        if type(ids) == "table" then
            for _, id in ipairs(ids) do 
                totalOwned = totalOwned + C_Item.GetItemCount(id, true, true, true, true, true) 
            end
        else
            totalOwned = C_Item.GetItemCount(ids, true, true, true, true, true)
        end
        textStock:SetText(totalOwned > 0 and totalOwned or "")

        -- Yield aus RecipeDB holen
        local db = ProfessionsHelperData["The War Within"]
        local recipe = db.RecipeDB and db.RecipeDB[frame.itemID]
        
        if recipe and recipe.yield and recipe.yield > 1 then
            textYield:SetText("+" .. recipe.yield)
        else
            textYield:SetText("")
        end

        -- Craftable Menge berechnen
        local craftCount = Visuals:GetCraftableAmount(frame.itemID)
        textCraft:SetText(craftCount > 0 and "x" .. craftCount or "")
        
        -- Visuelles Feedback (Sättigung/Alpha)
        local hasAnything = (totalOwned > 0 or craftCount > 0)
        icon:SetDesaturated(not hasAnything)
        icon:SetAlpha(hasAnything and 1.0 or 0.4)
    end

    frame:RegisterEvent("BAG_UPDATE_DELAYED")
    frame:SetScript("OnEvent", Update)
    Update()

    MakeInteractive(frame, ids)
    return frame
end

function Visuals:CreateSpecialActionIcon(parent, recipeID, x, y)
    local recipe = nil
    if ProfessionsHelperData then
        for _, expData in pairs(ProfessionsHelperData) do
            if expData.RecipeDB and expData.RecipeDB[recipeID] then
                recipe = expData.RecipeDB[recipeID]; break
            end
        end
    end
    if not recipe then return nil end

    local frame = CreateFrame("Frame", nil, parent)
    frame.catID = 3; frame:SetSize(40, 40)
    frame:SetPoint("CENTER", UIParent, "CENTER", x, y)
    
    local icon = frame:CreateTexture(nil, "ARTWORK"); icon:SetAllPoints()
    icon:SetTexture(recipe.isSpell and C_Spell.GetSpellTexture(recipe.spellID) or C_Item.GetItemIconByID(recipeID))

    local textInfo = frame:CreateFontString(nil, "OVERLAY", "NumberFontNormalSmall")
    textInfo:SetPoint("TOPLEFT", frame, "TOPLEFT", 2, -2)
    textInfo:SetTextColor(0.4, 0.8, 1)

    local textCraft = frame:CreateFontString(nil, "OVERLAY", "NumberFontNormal")
    textCraft:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)

    local cd = CreateFrame("Cooldown", nil, frame, "CooldownFrameTemplate")
    cd:SetAlpha(0) 

    local function Update()
        local craftCount = Visuals:GetCraftableAmount(recipeID)
        local remain = 0

        if recipe.isSpell then
            local sc = C_Spell.GetSpellCooldown(recipe.spellID)
            local ch = C_Spell.GetSpellCharges(recipe.spellID)

            if ch and ch.maxCharges and ch.maxCharges > 1 then
                textInfo:SetText(ch.currentCharges or "0")
                if ch.currentCharges < ch.maxCharges then
                    remain = (ch.cooldownStartTime + ch.cooldownDuration) - GetTime()
                end
            elseif sc and sc.startTime > 0 then
                remain = (sc.startTime + sc.duration) - GetTime()
            else
                textInfo:SetText("")
            end
            
            -- Fix für Millisekunden
            if remain > 500000 then remain = remain / 1000 end
            
            if remain > 0.1 then 
                textInfo:SetText(FormatTime(remain)) 
            end
        end

        textCraft:SetText(craftCount > 0 and "x"..craftCount or "")
        cd:Clear() -- Verhindert Schatten-Wischer
        icon:SetDesaturated(craftCount == 0)
        frame:SetAlpha(craftCount == 0 and 0.5 or 1.0)
    end

    frame:RegisterEvent("BAG_UPDATE_DELAYED")
    frame:RegisterEvent("SPELL_UPDATE_COOLDOWN")
    frame:RegisterEvent("SPELL_UPDATE_CHARGES")
    frame:SetScript("OnEvent", Update)
    Update()

    MakeInteractive(frame, recipeID)
    return frame
end

-- Fishing Matrix
function Visuals:CreateFishingIcon(parent, ids, x, y)
    local frame = CreateFrame("Frame", nil, parent)
    frame.catID = 4; local settings = ProfessionsHelper.db.profile.catSettings[4]
    frame:SetSize(30, 30); frame:SetScale(settings.scale or 1)
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

-- Skill Icons
function Visuals:CreateSkillIcon(parent, spellID, x, y)
    local frame = CreateFrame("Frame", nil, UIParent) 
    frame:SetFrameStrata("MEDIUM")
    frame.catID = 5
    frame:SetSize(40, 40)
    frame:SetPoint("CENTER", UIParent, "CENTER", x or 0, y or -100)

    -- Interner Datenspeicher
    frame.internal = { cur = 0, max = 0, start = 0, duration = 0, modRate = 1, hasCharges = false }

    local icon = frame:CreateTexture(nil, "ARTWORK")
    icon:SetAllPoints()
    icon:SetTexture(C_Spell.GetSpellTexture(spellID) or 134400)

    local chargeText = frame:CreateFontString(nil, "OVERLAY", "NumberFontNormal")
    chargeText:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)

    local timerText = frame:CreateFontString(nil, "OVERLAY", "NumberFontNormalSmall")
    timerText:SetPoint("CENTER", frame, "CENTER", 0, 0)
    timerText:SetTextColor(1, 0.8, 0)

    -- Tooltip Setup
    frame:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetSpellByID(spellID)
        GameTooltip:Show()
    end)
    frame:SetScript("OnLeave", function() GameTooltip:Hide() end)

    local function RefreshData(force)
        if InCombatLockdown() then return end
        
        pcall(function()
            local charges = C_Spell.GetSpellCharges(spellID)
            local cooldown = C_Spell.GetSpellCooldown(spellID)
            
            if charges and charges.maxCharges and charges.maxCharges > 1 then
                -- FALL: Aufladungen (Kraut überladen)
                local dur = charges.cooldownDuration or 0
                local start = charges.cooldownStartTime or 0
                
                -- Radikaler Millisekunden-Fix: Alles über 24 Stunden wird durch 1000 geteilt
                if dur > 86400 then 
                    dur = dur / 1000 
                    start = start / 1000 
                end
                
                frame.internal.cur = charges.currentCharges or 0
                frame.internal.max = charges.maxCharges
                frame.internal.duration = dur
                frame.internal.start = start
                frame.internal.modRate = charges.chargeModRate or 1
                frame.internal.hasCharges = true
            elseif cooldown and cooldown.startTime > 0 then
                -- FALL: Normaler Cooldown (Grüner Daumen)
                local dur = cooldown.duration or 0
                local start = cooldown.startTime or 0
                
                if dur > 86400 then 
                    dur = dur / 1000 
                    start = start / 1000 
                end
                
                frame.internal.cur = 0
                frame.internal.max = 0
                frame.internal.duration = dur
                frame.internal.start = start
                frame.internal.modRate = 1
                frame.internal.hasCharges = false
            else
                -- Bereit
                frame.internal.cur = 1
                frame.internal.max = 1
                frame.internal.start = 0
                frame.internal.duration = 0
                frame.internal.hasCharges = (charges and charges.maxCharges and charges.maxCharges > 1)
            end
        end)
    end

    local function UpdateUI()
        local data = frame.internal
        local now = GetTime()
        local remain = 0

        if data.start > 0 and data.duration > 0 then
            -- Berechnung der Restzeit unter Berücksichtigung der ModRate
            local elapsed = (now - data.start)
            remain = data.duration - (elapsed * data.modRate)
        end

        -- Ladungsanzeige (Nur wenn der Spell wirklich Charges hat)
        if data.hasCharges then
            chargeText:SetText(data.cur > 0 and data.cur or "|cFFFF00000|r")
        else
            chargeText:SetText("")
        end
        
        -- Zeit-Anzeige: KEIN FILTER. Wenn es 1198h sind, wollen wir sie sehen.
        if remain > 0.1 then
            timerText:SetText(FormatTime(remain))
        else
            timerText:SetText("")
        end

        -- Visuelles Feedback
        local isOnCD = (data.cur == 0 or (data.max > 1 and data.cur < data.max))
        icon:SetDesaturated(isOnCD and remain > 0.1)
        frame:SetAlpha((isOnCD and remain > 0.1) and 0.8 or 1.0)
    end

    frame:RegisterEvent("SPELL_UPDATE_CHARGES")
    frame:RegisterEvent("SPELL_UPDATE_COOLDOWN")
    frame:SetScript("OnEvent", function() RefreshData(); UpdateUI() end)
    
    frame:SetScript("OnUpdate", function(self, elapsed)
        self.timer = (self.timer or 0) + elapsed
        if self.timer > 0.1 then 
            RefreshData(); UpdateUI()
            self.timer = 0 
        end
    end)

    RefreshData(true)
    UpdateUI()
    if type(MakeInteractive) == "function" then MakeInteractive(frame, {spellID}) end
    return frame
end

-- ==========================================
-- 5. INITIALISIERUNG (INIT)
-- ==========================================

function Visuals:Init()
    self:ClearFrames()
    PerformCharacterScan()
    
    local mapID = C_Map.GetBestMapForUnit("player")
    if not mapID or not ProfessionsHelperData then return end

    local buckets = { [1] = {}, [2] = {}, [3] = {}, [4] = {}, [5] = {} }

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

        for catName, subCatData in pairs(expData) do
            if catName ~= "Config" then
                for itemName, itemData in pairs(subCatData) do
                    if CanPlayerSeeItem(catName, itemData) then
                        local cat = tonumber(itemData.displayCategory) or 0
                        local showItem = false
                        
                        if catName == "Wood" then showItem = true 
                        elseif (cat == 1 or cat == 5) and isCurrentExp then showItem = true 
                        elseif (cat == 4) and isCurrentExp then showItem = true 
                        elseif (cat == 2 or cat == 3) and isInCity then showItem = true end

                        if showItem and buckets[cat] then
                            local settings = ProfessionsHelper.db.profile.catSettings[cat]
                            if settings and settings.enabled then
                                local displayProf = "Other"
                                local pData = itemData.gatheringProf or itemData.processingProfs
                                if type(pData) == "table" then
                                    for _, p in ipairs(pData) do if PlayerCanHandle[p] then displayProf = p break end end
                                elseif type(pData) == "string" then
                                    displayProf = pData
                                end
                                
                                table.insert(buckets[cat], { name = itemName, data = itemData, prof = displayProf })
                            end
                        end
                    end
                end
            end
        end
    end

    local function AddToUI(f) if f then table.insert(self.ActiveFrames, f) end end
    local function HandleWrap(curX, startX, width) return (curX - startX) > width end

-- Rendering Cat 1 (Balken)
if ProfessionsHelper.db.profile.catSettings[1].enabled then
    local barGroups = {}
    for _, item in ipairs(buckets[1]) do
        local p = item.prof or "Other"
        barGroups[p] = barGroups[p] or {}
        table.insert(barGroups[p], item)
    end

    for prof, items in pairs(barGroups) do
        -- Sicherheits-Check: Falls barSettings[prof] nil ist, nimm Cat 1 Defaults
        local cSettings = (ProfessionsHelper.db.profile.barSettings and ProfessionsHelper.db.profile.barSettings[prof]) 
        or ProfessionsHelper.db.profile.catSettings[1]
        
        -- Falls der Beruf deaktiviert wurde, überspringen
        if cSettings.enabled ~= false then
            local pos = ProfessionsHelper.db.profile.positions[prof .. "_Bar"] or {x = -450, y = 150}
            local bX, bY = pos.x, pos.y
            
            for _, item in ipairs(items) do
                -- Hauptfarbe umrechnen
                local hex = (item.data.color or "#FFFFFF"):gsub("#","")
                local r, g, b = tonumber(hex:sub(1,2),16)/255, tonumber(hex:sub(3,4),16)/255, tonumber(hex:sub(5,6),16)/255
                
                -- NEU: Gradient-Endfarbe umrechnen (falls vorhanden)
                local barColors = { r, g, b }
                if item.data.gradient_End_color then
                    local gHex = item.data.gradient_End_color:gsub("#","")
                    local gr, gg, gb = tonumber(gHex:sub(1,2),16)/255, tonumber(gHex:sub(3,4),16)/255, tonumber(gHex:sub(5,6),16)/255
                    table.insert(barColors, gr)
                    table.insert(barColors, gg)
                    table.insert(barColors, gb)
                end

                -- Erstellen des Balkens
                AddToUI(self:CreateBar(item.name, UIParent, item.data.IDs, bX, bY, barColors, cSettings, prof))
                
                -- Dynamischer Abstand basierend auf der Breite des Balkens + kleiner Puffer
                local spacing = (cSettings and cSettings.width and (cSettings.width + 8)) or self.Config.SpacingX_Bar
                bX = bX + spacing
            end
        end
    end
end

-- Rendering Cat 3
    local pos3 = ProfessionsHelper.db.profile.positions[3] or {x = -450, y = 50}
    if ProfessionsHelper.db.profile.catSettings[3].enabled then
        local pX, pY = pos3.x, pos3.y
        for _, item in ipairs(buckets[3]) do
            -- HIER IST DIE ABZWEIGUNG
            -- Wir prüfen, ob das Rezept ein Spell ist oder spezielle Aufladungen hat
            if item.data.isSpell or item.data.hasCharges then
                -- Nutzt die Spezial-Logik für Experimente/Cooldowns
                -- Wir nehmen die spellID als Referenz, falls vorhanden
                local refID = item.data.spellID or item.data.IDs[1]
                AddToUI(self:CreateSpecialActionIcon(UIParent, refID, pX, pY))
            else
                -- Standard-Logik für Tränke und Items
                AddToUI(self:CreateProfessionIcon(UIParent, item.data.IDs, pX, pY))
            end
            
            pX = pX + self.Config.SpacingX_Prof
        end
    end

-- Rendering Cat 2
    if ProfessionsHelper.db.profile.catSettings[2].enabled then
        local profGroups = {}
        for _, item in ipairs(buckets[2]) do
            profGroups[item.prof] = profGroups[item.prof] or {}
            table.insert(profGroups[item.prof], item)
        end
        
        for prof, items in pairs(profGroups) do
            -- NEU: Sortierung innerhalb der Berufsgruppe nach Expansion-ID
            table.sort(items, function(a, b)
                local expA = a.data.expID or 0
                local expB = b.data.expID or 0
                if expA ~= expB then
                    return expA < expB
                else
                    return a.name < b.name -- Alphabetisch bei gleicher Expansion
                end
            end)

            local pSettings = ProfessionsHelper.db.profile.profSubSettings[prof] or { enabled = true }
            if pSettings.enabled then
                local defaultY = 100
                if prof == "Herbalism" then defaultY = 130 elseif prof == "Skinning" then defaultY = 70 end
                local pos = ProfessionsHelper.db.profile.positions[prof] or {x = -450, y = defaultY}
                
                for i, item in ipairs(items) do
                    -- Durch die Sortierung oben ist 'i' jetzt in der richtigen ExpID-Reihenfolge
                    local iconX = pos.x + ((i-1) * self.Config.SpacingX_Icon)
                    AddToUI(self:CreateMaterialIcon(UIParent, item.data.IDs, iconX, pos.y, prof))
                end
            end
        end
    end

    -- Rendering Cat 4
    local pos4 = ProfessionsHelper.db.profile.positions[4] or {x = -300, y = 400}
    if ProfessionsHelper.db.profile.catSettings[4].enabled then
        local fX, fY = pos4.x, pos4.y
        local fStartX = fX
        for _, item in ipairs(buckets[4]) do
            if HandleWrap(fX, fStartX, self.Config.MaxWidthFish) then fX = fStartX; fY = fY - self.Config.RowHeight end
            AddToUI(self:CreateFishingIcon(UIParent, item.data.IDs, fX, fY))
            fX = fX + self.Config.SpacingX_Fish
        end
    end

-- Rendering Cat 5 (Skills)
    local pos5 = (ProfessionsHelper.db.profile.positions and ProfessionsHelper.db.profile.positions[5]) or {x = 0, y = -100}
    
    local sX, sY = pos5.x, pos5.y
    -- NEU: Ein lokaler Cache, um doppelte SpellIDs pro Init-Durchgang zu verhindern
    local processedSpells = {} 

    for _, item in ipairs(buckets[5]) do
        local spellID = item.data.spellID
        -- Nur erstellen, wenn diese SpellID in diesem Durchgang noch nicht gezeichnet wurde
        if spellID and not processedSpells[spellID] then
            AddToUI(self:CreateSkillIcon(UIParent, spellID, sX, sY))
            sX = sX + self.Config.SpacingX_Skill
            processedSpells[spellID] = true
        end
    end
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:SetScript("OnEvent", function() Visuals:Init() end)
ProfessionsHelper:RegisterModule("Visuals", Visuals)