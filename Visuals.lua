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
    -- Wir greifen direkt auf das Profil in der DB zu
    local profile = ProfessionsHelper.db.profile
    -- Reset der Liste, aber wir behalten "AllProf" als Standard
    profile.learnedProfessions = { ["AllProf"] = true }
    local profs = { GetProfessions() }
    for _, index in ipairs(profs) do
        if index then
            local _, _, _, _, _, _, skillLine = GetProfessionInfo(index)
            local name = skillLineMapping[skillLine]
            if name then 
                profile.learnedProfessions[name] = true 
            end
        end
    end

    -- Spezialfall Holzfällen (Spell-Check)
    if C_SpellBook.IsSpellKnownOrInSpellBook(1256697) then 
        profile.learnedProfessions["Woodcutting"] = true 
    end
end

local function CanPlayerSeeItem(category, itemData)
    if not itemData or (not itemData.IDs and not itemData.spellID) then return false end

    -- Wir legen uns eine lokale Referenz an, damit der Code lesbar bleibt
    local learned = ProfessionsHelper.db.profile.learnedProfessions

    local function HasMatch(profEntry)
        if not profEntry then return false end
        if type(profEntry) == "table" then
            for _, p in ipairs(profEntry) do
                -- GEÄNDERT: Zugriff auf das Profil
                if learned and learned[p] then return true end
            end
        elseif type(profEntry) == "string" then
            -- GEÄNDERT: Zugriff auf das Profil
            if learned and learned[profEntry] then return true end
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

    -- 1. ZIEHEN STARTEN
    frame:SetScript("OnDragStart", function(self)
        if not ProfessionsHelper.db.profile.locked then
            self:StartMoving()
            self.isDragging = true
        end
    end)

    -- 2. ZIEHEN STOPPEN & SPEICHERN
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

        -- Hier nutzen wir deinen groupKey (z.B. "Mining_c1")
        local storageKey = groupKey or frame.catID
        if storageKey then
            ProfessionsHelper.db.profile.positions = ProfessionsHelper.db.profile.positions or {}
            ProfessionsHelper.db.profile.positions[storageKey] = { x = newX, y = newY }
            
            -- WICHTIG: Visuals:Init() aufrufen, damit alle Icons des Berufs mitziehen
            -- (In Visuals.lua meist direkt über self:Init() oder ProfessionsHelper:GetModule("Visuals"):Init())
            ProfessionsHelper:GetModule("Visuals"):Init()
        end
    end)

    -- 3. TOOLTIP ANZEIGEN
    frame:SetScript("OnEnter", function(self)
        -- Tooltip nur zeigen, wenn die Frames fixiert sind (damit er beim Schieben nicht stört)
        if ProfessionsHelper.db.profile.locked then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            
            if type(itemIDs) == "table" then
                if frame.catID == 5 then
                    GameTooltip:SetSpellByID(itemIDs[1])
                else
                    GameTooltip:SetItemByID(itemIDs[1])
                end
            elseif type(itemIDs) == "number" then
                GameTooltip:SetSpellByID(itemIDs)
            end
            
            GameTooltip:Show()
        end
    end)

    -- 4. TOOLTIP AUSBLENDEN
    frame:SetScript("OnLeave", function() GameTooltip:Hide() end)
end

function Visuals:GetCraftableAmount(recipeID)
    if not ProfessionsHelperData then return 0 end
    
    local recipe = nil
    for _, expData in pairs(ProfessionsHelperData) do
        if expData.RecipeDB and expData.RecipeDB[recipeID] then
            recipe = expData.RecipeDB[recipeID]
            break
        end
    end
    if not recipe then return 0 end
    local finalMax = 99999
    local data = recipe.slots or recipe
    for i = 1, #data do
        local slot = data[i]
        if type(slot) == "table" then
            local needed = slot.amount or 1
            local currentSlotPossible = 0
            if slot.type == "group" and slot.key == "ExperimentHerbs" then
                local totalApps = 0
                for _, expData in pairs(ProfessionsHelperData) do
                    if expData.Herbs then
                        for _, herbData in pairs(expData.Herbs) do
                            if herbData.canExperiment then
                                for _, id in ipairs(herbData.IDs) do
                                    local count = C_Item.GetItemCount(id, true, true, true, true, true)
                                    if count >= needed then
                                        totalApps = totalApps + math.floor(count / needed)
                                    end
                                end
                            end
                        end
                    end
                end
                currentSlotPossible = totalApps
            elseif slot.ids then
                local stock = 0
                for _, id in ipairs(slot.ids) do
                    stock = stock + C_Item.GetItemCount(id, true, true, true, true, true)
                end
                currentSlotPossible = math.floor(stock / needed)
            end
            if currentSlotPossible < finalMax then
                finalMax = currentSlotPossible
            end
        end
    end
    return (finalMax == 99999) and 0 or finalMax
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
    local gDB = ProfessionsHelper.db.global
    
    local isGrowUp = settings.growUp 
    
    local barW = settings.width or 30
    local barH = settings.height or 100
    local fSize = settings.fontSize or gDB.fontSize or 10

    -- 2. Frame-Erstellung
    local frame = CreateFrame("Frame", "PH_Bar_"..name, parent, "BackdropTemplate")
    frame.catID = 1
    frame.profName = profName
    
    frame:SetSize(barW, barH + barW + 5) 
    frame:SetPoint("CENTER", UIParent, "CENTER", posX, posY)
    frame:SetScale(settings.scale or 1)
    
    -- 3. Die Statusbar
    local bar = CreateFrame("StatusBar", nil, frame)
    bar:SetSize(barW, barH)

    ---------------------------------------------------------
    -- FIX: BALKEN-TEXTUR (LSM muss zwingend gesetzt werden)
    ---------------------------------------------------------
    local rawTexture = gDB.barTexture or settings.barTexture or "Cilo"
    local texturePath = LSM:Fetch("statusbar", rawTexture)
    
    bar:SetStatusBarTexture(texturePath)
    -- Sicherstellen, dass die Textur auch gezeichnet wird:
    bar:GetStatusBarTexture():SetHorizTile(false)
    bar:GetStatusBarTexture():SetVertTile(false)
    
    if #barColor >= 6 then
        bar:GetStatusBarTexture():SetGradient("VERTICAL", 
            CreateColor(barColor[1], barColor[2], barColor[3], 1),
            CreateColor(barColor[4], barColor[5], barColor[6], 1)
        )
    else
        bar:SetStatusBarColor(barColor[1], barColor[2], barColor[3])
    end
    
    local barBg = bar:CreateTexture(nil, "BACKGROUND")
    barBg:SetAllPoints(); barBg:SetColorTexture(0.1, 0.1, 0.1, 0.6)

    -- 4. Das Icon
    local icon = frame:CreateTexture(nil, "ARTWORK")
    icon:SetSize(barW, barW)
    
    ---------------------------------------------------------
    -- FIX: WUCHSRICHTUNG & ANKER
    ---------------------------------------------------------
    bar:ClearAllPoints()
    icon:ClearAllPoints()
    bar:SetOrientation("VERTICAL") -- Wichtig für vertikale Balken

    if isGrowUp then
        -- Symbol unten, Balken wächst nach OBEN
        icon:SetPoint("BOTTOM", frame, "BOTTOM", 0, 0)
        bar:SetPoint("BOTTOM", icon, "TOP", 0, 2)
        bar:SetReverseFill(false) -- Standard: Füllt von unten nach oben
    else
        -- Symbol oben, Balken wächst nach UNTEN
        icon:SetPoint("TOP", frame, "TOP", 0, 0)
        bar:SetPoint("TOP", icon, "BOTTOM", 0, -2)
        bar:SetReverseFill(true) -- Umkehren: Füllt von oben nach unten
    end
    
    -- 5. Texte (Zahlen auf dem Balken)
    local textOverlay = CreateFrame("Frame", nil, frame)
    textOverlay:SetAllPoints(bar)
    textOverlay:SetFrameLevel(bar:GetFrameLevel() + 10)

    local function CreateCenteredText(colorKey)
        local t = textOverlay:CreateFontString(nil, "OVERLAY", nil, 7)
        local fontPath = LSM:Fetch("font", settings.fontName or gDB.fontName or "Friz Quadrata TT")
        if not fontPath or fontPath == "" then fontPath = "Fonts\\FRIZQT__.TTF" end
        
        t:SetFont(fontPath, fSize, "OUTLINE")
        local c = settings[colorKey] or gDB[colorKey] or {r=1, g=1, b=1}
        t:SetTextColor(c.r, c.g, c.b)
        t:SetJustifyH("CENTER")
        t:SetWidth(barW + 10)
        return t
    end

    local tB = CreateCenteredText("colorQ1")
    local tS = CreateCenteredText("colorQ2")
    local tG = CreateCenteredText("colorQ3")

    -- 6. Update-Logik (Die Positions-Fixes im Update)
    local function Update()
        local b = C_Item.GetItemCount(itemIDs[1] or 0, true, true, true, true)
        local s = C_Item.GetItemCount(itemIDs[2] or 0, true, true, true, true)
        local g = C_Item.GetItemCount(itemIDs[3] or 0, true, true, true, true)
        
        -- Text-Anker basierend auf der aktuellen Balken-Mitte
        tB:ClearAllPoints()
        tS:ClearAllPoints()
        tG:ClearAllPoints()

        if not itemIDs[3] then 
            tB:SetPoint("CENTER", bar, "CENTER", 0, 8)
            tS:SetPoint("CENTER", bar, "CENTER", 0, -8)
            tG:Hide()
        else 
            tB:SetPoint("CENTER", bar, "CENTER", 0, 15)
            tS:SetPoint("CENTER", bar, "CENTER", 0, 0)
            tG:SetPoint("CENTER", bar, "CENTER", 0, -15)
            tG:Show()
        end

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

    return frame
end

function Visuals:CreateMaterialIcon(parent, ids, x, y, profName, achievementID)
    local frame = CreateFrame("Frame", nil, parent)
    frame.catID = 2
    local settings = ProfessionsHelper.db.profile.catSettings[2]
    
    frame:SetSize(20, 20)
    frame:SetScale(settings.scale or 1)
    frame:SetPoint("CENTER", UIParent, "CENTER", x, y)

    local icon = frame:CreateTexture(nil, "ARTWORK")
    icon:SetAllPoints()
    icon:SetTexture(C_Item.GetItemIconByID(ids[1]))

    local text = frame:CreateFontString(nil, "OVERLAY", "NumberFontNormalSmall")
    frame.Count = text 
    text:SetTextColor(0.3, 0.9, 0.25)

    -- BALKEN ERSTELLEN + TOOLTIP
    if achievementID then
        frame.progressBar = CreateFrame("StatusBar", nil, frame)
        frame.progressBar:SetSize(20, 6)
        frame.progressBar:SetPoint("TOP", frame, "BOTTOM", 0, -2)
        frame.progressBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
        frame.progressBar:SetStatusBarColor(0.6, 0.4, 0.2)
        
        local bg = frame.progressBar:CreateTexture(nil, "BACKGROUND")
        bg:SetAllPoints(); bg:SetColorTexture(0, 0, 0, 0.6)

        -- HIER IST DER TOOLTIP WIEDER:
        frame.progressBar:EnableMouse(true)
        frame.progressBar:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            local _, achName = GetAchievementInfo(achievementID)
            local _, _, _, quantity, req = GetAchievementCriteriaInfo(achievementID, 1)
            
            GameTooltip:AddLine(achName or "Holzfällen Fortschritt", 1, 1, 1)
            GameTooltip:AddLine(string.format("Fortschritt: %d / %d", quantity or 0, req or 0), 0.8, 0.8, 0.8)
            GameTooltip:AddLine("Sammeln vom Mount nach Abschluss freigeschaltet.", 0, 1, 0, true)
            GameTooltip:Show()
        end)
        frame.progressBar:SetScript("OnLeave", function() GameTooltip:Hide() end)
    end

    local function Update()
        -- 1. Items
        local total = 0
        for _, id in ipairs(ids) do 
            total = total + C_Item.GetItemCount(id, true, true, true, true) 
        end
        text:SetText(total > 0 and total or "")
        icon:SetDesaturated(total == 0); icon:SetAlpha(total == 0 and 0.4 or 1.0)

        -- 2. Balken & Text-Verschiebung
        local hasBar = false
        if achievementID and frame.progressBar then
            local _, _, completed, quantity, req = GetAchievementCriteriaInfo(achievementID, 1)
            if not completed and req and req > 0 then
                frame.progressBar:SetMinMaxValues(0, req)
                frame.progressBar:SetValue(quantity)
                frame.progressBar:Show()
                hasBar = true
            else
                frame.progressBar:Hide()
            end
        end

        -- Anker setzen
        text:ClearAllPoints()
        local align = frame.textAlign or "BOTTOM"
        if align == "BOTTOM" then
            local yOff = hasBar and -12 or -3 
            text:SetPoint("TOP", frame, "BOTTOM", 0, yOff)
        elseif align == "TOP" then
            text:SetPoint("BOTTOM", frame, "TOP", 0, 2)
        elseif align == "LEFT" then
            text:SetPoint("RIGHT", frame, "LEFT", -4, 0)
        elseif align == "RIGHT" then
            text:SetPoint("LEFT", frame, "RIGHT", 4, 0)
        end
    end

    frame.UpdateManually = Update
    frame:RegisterEvent("BAG_UPDATE_DELAYED")
    frame:RegisterEvent("CRITERIA_UPDATE")
    frame:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", "player")
    
    frame:SetScript("OnEvent", function(self, event, unit, _, spellID)
        if event == "UNIT_SPELLCAST_SUCCEEDED" and spellID == 1239682 then
            C_Timer.After(0.2, Update)
        else
            Update()
        end
    end)

    Update()
    MakeInteractive(frame, ids, profName)
    return frame
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
        local recipe = nil
        for _, expData in pairs(ProfessionsHelperData) do
            if expData.RecipeDB and expData.RecipeDB[frame.itemID] then
                recipe = expData.RecipeDB[frame.itemID]
                break
            end
        end
        
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
        local currentText = ""

        if recipe.isSpell then
            local sc = C_Spell.GetSpellCooldown(recipe.spellID)
            local ch = C_Spell.GetSpellCharges(recipe.spellID)

            -- 1. Ladungen prüfen (z.B. Experimente)
            if ch and ch.maxCharges and ch.maxCharges > 1 then
                currentText = tostring(ch.currentCharges or "0")
                if ch.currentCharges < ch.maxCharges and ch.cooldownStartTime > 0 then
                    remain = (ch.cooldownStartTime + ch.cooldownDuration) - GetTime()
                end
            -- 2. Normaler Cooldown prüfen
            elseif sc and sc.startTime > 0 then
                remain = (sc.startTime + sc.duration) - GetTime()
            end
            
            -- Zeit formatieren, falls Cooldown läuft
            if remain > 0.1 then 
                -- Falls die Zeit absurd hoch ist (Server-Bug), fixen
                if remain > 1000000 then remain = 0 end 
                currentText = FormatTime(remain)
            end
        end

        textInfo:SetText(currentText)
        textCraft:SetText(craftCount > 0 and "x"..craftCount or "")
        
        -- VISUELLE KORREKTUR:
        -- Das Icon soll NICHT grau sein, wenn nur die Materialien fehlen.
        -- Es soll nur grau sein, wenn es auf Cooldown ist ODER man gar nichts machen kann.
        local isOnCD = (remain > 0.1)
        icon:SetDesaturated(isOnCD) 
        
        -- Alpha-Feedback: Etwas blasser wenn keine Mats da sind, aber sichtbar
        frame:SetAlpha((craftCount == 0 and not isOnCD) and 0.6 or 1.0)
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

    local learned = ProfessionsHelper.db.profile.learnedProfessions
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
                                -- Intelligenz-Logik für die Bucket-Zuordnung (Priorisierung)
                                local bucketToUse = catName -- Standard aus der Datei (z.B. "VendorDrop")
                                local displayProf = "Other"
                                
                                -- 1. Überprüfe Berufe (Gathering & Processing)
                                local pData = itemData.gatheringProf or itemData.processingProfs
                                
                                if type(pData) == "table" then
                                    for _, p in ipairs(pData) do 
                                        if learned[p] then 
                                            displayProf = p
                                            -- Wenn es Kategorie 2 (Icons) ist, soll das Item 
                                            -- in den Bucket des Berufs rutschen statt VendorDrop/Other
                                            if cat == 2 then bucketToUse = p end
                                            break 
                                        end 
                                    end
                                elseif type(pData) == "string" then
                                    displayProf = pData
                                    if cat == 2 and learned[pData] then
                                        bucketToUse = pData
                                    end
                                end

                                -- 2. In die Liste einfügen (mit dem neuen bucketToUse)
                                table.insert(buckets[cat], { 
                                    name = itemName, 
                                    data = itemData, 
                                    prof = displayProf, 
                                    bucketName = bucketToUse 
                                })
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
        -- Wir nutzen den bucketName (z.B. "Mining"), um den Key "Mining_c1" zu bauen
        local p = item.bucketName or "Other"
        barGroups[p] = barGroups[p] or {}
        table.insert(barGroups[p], item)
    end

    for bucketName, items in pairs(barGroups) do
        -- WICHTIG: Dieser Key MUSS exakt so wie in der Settings.lua sein (Name_c1)
        local settingKey = bucketName .. "_c1" 
        
        local subSettings = ProfessionsHelper.db.profile.profSubSettings[settingKey] or {}
        local baseSettings = ProfessionsHelper.db.profile.catSettings[1]
        
        -- Checkbox "Anzeigen" prüfen
        if subSettings.enabled ~= false then 
            
            -- Position laden (Nutzt jetzt den korrekten Key "Mining_c1")
            local pos = ProfessionsHelper.db.profile.positions[settingKey] or {x = -450, y = 150}
            local bX, bY = pos.x, pos.y
            
            table.sort(items, function(a, b) return (a.data.expID or 0) < (b.data.expID or 0) end)

            for _, item in ipairs(items) do
                if ProfessionsHelper.db.profile.itemFilters[item.name] ~= false then
                    local hex = (item.data.color or "#FFFFFF"):gsub("#","")
                    local r, g, b = tonumber(hex:sub(1,2),16)/255, tonumber(hex:sub(3,4),16)/255, tonumber(hex:sub(5,6),16)/255
                    local barColors = { r, g, b }
                    if item.data.gradient_End_color then
                        local gHex = item.data.gradient_End_color:gsub("#","")
                        local gr, gg, gb = tonumber(gHex:sub(1,2),16)/255, tonumber(gHex:sub(3,4),16)/255, tonumber(gHex:sub(5,6),16)/255
                        table.insert(barColors, gr)
                        table.insert(barColors, gg)
                        table.insert(barColors, gb)
                    end

                    -- Erstellen des Balkens
                    local barFrame = self:CreateBar(item.name, UIParent, item.data.IDs, bX, bY, barColors, baseSettings, bucketName)
                    
                    -- Hier übergeben wir den settingKey für die Maus-Interaktion
                    MakeInteractive(barFrame, item.data.IDs, settingKey)
                    
                    AddToUI(barFrame)
                    
                    local spacing = (baseSettings.width or 30) + 8
                    bX = bX + spacing
                end
            end
        end
    end
end

-- Rendering Cat 2
if ProfessionsHelper.db.profile.catSettings[2].enabled then
    local groupedBuckets = {}
    for _, item in ipairs(buckets[2]) do
        local bName = item.bucketName or "Other"
        groupedBuckets[bName] = groupedBuckets[bName] or {}
        table.insert(groupedBuckets[bName], item)
    end

    for bName, items in pairs(groupedBuckets) do
        local pSet = ProfessionsHelper.db.profile.profSubSettings[bName] or { growth = "LEFT_RIGHT", textAlign = "BOTTOM", enabled = true }
        
        if pSet.enabled ~= false then
            local pos = ProfessionsHelper.db.profile.positions[bName] or ProfessionsHelper.db.profile.positions[2] or {x = -450, y = 100}
            
            table.sort(items, function(a, b) return (a.data.expID or 0) < (b.data.expID or 0) end)

            local visibleIdx = 0 
            for _, item in ipairs(items) do
                if ProfessionsHelper.db.profile.itemFilters[item.name] ~= false then
                    -- BERECHNUNG DER POSITION (Wichtig gegen das Stapeln!)
                    local offset = visibleIdx * self.Config.SpacingX_Icon
                    local iX, iY = pos.x, pos.y
                    
                    if pSet.growth == "LEFT_RIGHT" then iX = pos.x + offset 
                    elseif pSet.growth == "RIGHT_LEFT" then iX = pos.x - offset 
                    elseif pSet.growth == "TOP_BOTTOM" then iY = pos.y - offset 
                    elseif pSet.growth == "BOTTOM_TOP" then iY = pos.y + offset 
                    else iX = pos.x + offset end

                    -- Frame erstellen (mit Übergabe der achievementID für den internen Balken)
                    local iconFrame = self:CreateMaterialIcon(UIParent, item.data.IDs, iX, iY, bName, item.data.achievementID)
                    
                    -- Dem Frame das Alignment für seine interne Update-Funktion mitteilen
                    if iconFrame then
                        iconFrame.textAlign = pSet.textAlign or "BOTTOM"
                        -- Falls wir die Funktion UpdateManually genannt haben:
                        if iconFrame.UpdateManually then iconFrame:UpdateManually() end
                    end

                    AddToUI(iconFrame)
                    visibleIdx = visibleIdx + 1
                end
            end
        end
    end
end

-- Rendering Cat 3
if ProfessionsHelper.db.profile.catSettings[3].enabled then
    local profGroups = {}
    
    -- 1. Gruppierung nach gatheringProf (z.B. Skinning) oder prof
    for _, item in ipairs(buckets[3]) do
        -- FIX: Nutze gatheringProf für die Trennung (z.B. Leder von Kürschnerei)
        local groupKey = item.data.gatheringProf or item.prof or "Other"
        profGroups[groupKey] = profGroups[groupKey] or {}
        table.insert(profGroups[groupKey], item)
    end

    for groupName, items in pairs(profGroups) do
        -- Wir müssen den gleichen Key wie in der Settings.lua bauen
        local settingKey = groupName .. "_c3"
        local subSettings = ProfessionsHelper.db.profile.profSubSettings[settingKey] or {}
        
        if subSettings.enabled ~= false then
            local pos = ProfessionsHelper.db.profile.positions[settingKey] or {x = 200, y = 0}
            
            table.sort(items, function(a, b) return (a.data.expID or 0) < (b.data.expID or 0) end)

            local maxCols = subSettings.maxColumns or 5
            local spacingX = self.Config.SpacingX_Prof or 44
            local spacingY = subSettings.customSpacingY or 44

            local vIdx = 0
            for _, item in ipairs(items) do
                if ProfessionsHelper.db.profile.itemFilters[item.name] ~= false then
                    -- GRID-BERECHNUNG für den Block
                    local col = vIdx % maxCols
                    local row = math.floor(vIdx / maxCols)
                    
                    local pX = pos.x + (col * spacingX)
                    local pY = pos.y - (row * spacingY)
                    
                    -- WICHTIG: Wir übergeben settingKey am Ende, damit der ganze Block verschiebbar ist
                    AddToUI(self:CreateProfessionIcon(UIParent, item.data.IDs, pX, pY, settingKey))
                    vIdx = vIdx + 1
                end
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