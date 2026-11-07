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

-- Zentrale Item-Zählung: Taschen des Charakters sind immer enthalten.
-- Die vier optionalen Lagerorte/Filter werden über die Settings gesteuert.
function Visuals:GetItemCount(itemID)
    if type(itemID) ~= "number" and type(itemID) ~= "string" then
        return 0
    end

    local profile = ProfessionsHelper.db and ProfessionsHelper.db.profile
    local settings = profile and profile.itemCountSettings or {}

    -- Bei bestehenden Profilen ohne diese neuen Werte gilt standardmäßig true.
    return C_Item.GetItemCount(
        itemID,
        settings.includeBank ~= false,
        settings.includeUses ~= false,
        settings.includeReagentBank ~= false,
        settings.includeAccountBank ~= false
    ) or 0
end

local skillLineMapping = { 
    [171] = "Alchemy", [164] = "Blacksmithing", [185] = "Cooking", 
    [333] = "Enchanting", [202] = "Engineering", [356] = "Fishing", 
    [182] = "Herbalism", [773] = "Inscription", [755] = "Jewelcrafting", 
    [165] = "Leatherworking", [186] = "Mining", [393] = "Skinning", 
    [197] = "Tailoring", [129] = "FirstAid" 
}

local specializationMapping = {
    -- Blacksmithing
    [9787]  = { profession = "Blacksmithing", name = "Weaponsmith" },
    [9788]  = { profession = "Blacksmithing", name = "Armorsmith" },

    -- Engineering
    [20219] = { profession = "Engineering", name = "Gnomish Engineer" },
    [20222] = { profession = "Engineering", name = "Goblin Engineer" },

    -- Leatherworking
    [10656] = { profession = "Leatherworking", name = "Dragonscale Leatherworking" },
    [10658] = { profession = "Leatherworking", name = "Elemental Leatherworking" },
    [10660] = { profession = "Leatherworking", name = "Tribal Leatherworking" },
}

local PlayerCanHandle = {}

function ProfessionsHelper:GetGlobalBucketKey(itemData, catID)
    local targetGroup = "DroporVendor"
    local profPriority = {"Herbalism", "Mining", "Skinning", "Wood", "Fishing"}

    -- 1. Sonderfall Holz
    if itemData.bucketName == "Wood" then
        targetGroup = "Wood"
    else
        -- 2. Berufs-Zuordnung (unterstützt Tabelle oder String)
        local profs = itemData.gatheringProf
        if type(profs) == "table" then
            for _, p in ipairs(profPriority) do
                for _, itemProf in ipairs(profs) do
                    if itemProf == p then targetGroup = p; break end
                end
                if targetGroup ~= "DroporVendor" then break end
            end
        elseif type(profs) == "string" and profs ~= "" then
            targetGroup = profs
        end
    end

    -- 3. Mappings vereinheitlichen
    if targetGroup == "Woodcutting" then targetGroup = "Wood" end
    if targetGroup == "AllProf"      then targetGroup = "DroporVendor" end

    -- Rückgabe: z.B. "Mining_c2" oder "Herbalism_c2"
    return targetGroup .. "_c" .. catID
end

-- ==========================================
-- 2. SCAN & FILTER LOGIK
-- ==========================================

local function PerformCharacterScan()
    -- Wir greifen direkt auf das Profil in der DB zu
    local profile = ProfessionsHelper.db.profile
    -- Reset der Liste, aber wir behalten "AllProf" als Standard
    profile.learnedProfessions = { ["AllProf"] = true }
    local professionSkillLevels = {}
    local profs = { GetProfessions() }
    for _, index in ipairs(profs) do
        if index then
            local _, _, skillLevel, _, _, _, skillLine = GetProfessionInfo(index)
            local name = skillLineMapping[skillLine]
            if name then
                profile.learnedProfessions[name] = true
                if type(skillLevel) == "number" then
                    professionSkillLevels[name] = skillLevel
                end
            end
        end
    end

    -- Spezialfall Holzfällen (Spell-Check)
    if C_SpellBook.IsSpellKnownOrInSpellBook(1256697) then
        profile.learnedProfessions["Woodcutting"] = true
    end

    return professionSkillLevels
end

local function GetItemCategoryOverride(itemData)
    local profile = ProfessionsHelper.db and ProfessionsHelper.db.profile
    local overrides = profile and profile.itemCategoryOverrides
    if not overrides or type(itemData) ~= "table" or type(itemData.IDs) ~= "table" then
        return nil
    end

    -- Matrix speichert denselben Override für alle IDs eines logischen Eintrags.
    -- Der erste vorhandene Eintrag gilt für den gesamten Datensatz.
    for _, itemID in ipairs(itemData.IDs) do
        local saved = overrides[tostring(itemID)]
        if saved ~= nil then return saved end
    end
    return nil
end

local function MeetsProfessionSkillRequirement(category, categoryName, itemData, professionSkillLevels)
    local profile = ProfessionsHelper.db.profile
    local cat = tonumber(category)
    if not cat and categoryName == "Fishing" then cat = 4 end
    if not cat or cat < 1 or cat > 4 or categoryName == "Wood" then
        return true
    end

    local filterSettings = profile.professionSkillFilterCategories or {}
    if filterSettings[cat] ~= true then return true end

    local required = tonumber(itemData and itemData.required)
    if not required then return true end

    local professions
    if cat == 2 then
        professions = itemData.processingProfs
    else
        professions = itemData.gatheringProf
    end

    local function HasSufficientSkill(profession)
        local level = professionSkillLevels and professionSkillLevels[profession]
        return type(level) == "number" and level >= required
    end

    if type(professions) == "string" then
        return HasSufficientSkill(professions)
    elseif type(professions) == "table" then
        for _, profession in ipairs(professions) do
            if HasSufficientSkill(profession) then return true end
        end
    end

    return false
end

local function CanPlayerSeeItem(category, itemData, categoryOverride)
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

    local cat = tonumber(categoryOverride) or tonumber(itemData.displayCategory) or 0

    if cat == 1 then
        -- Kategorie 1 bleibt unverändert: keine Spezialisierungsprüfung.
        return HasMatch(itemData.gatheringProf)
    elseif cat == 5 then
        -- Spezialisierungs-Icons werden nur angezeigt, wenn der Charakter
        -- die jeweilige Spezialisierung tatsächlich kennt. Das betrifft
        -- ausschließlich Cat 5; normale Skills behalten das bisherige Verhalten.
        local specialization = specializationMapping[tonumber(itemData.spellID)]
        if specialization then
            -- Der zugehörige Beruf muss ebenfalls gelernt sein.
            if not (learned and learned[specialization.profession]) then
                return false
            end

            local spellID = tonumber(itemData.spellID)
            local spellKnown = false
            if C_SpellBook and C_SpellBook.IsSpellKnownOrInSpellBook then
                spellKnown = C_SpellBook.IsSpellKnownOrInSpellBook(spellID)
            elseif IsSpellKnown then
                spellKnown = IsSpellKnown(spellID)
            elseif IsPlayerSpell then
                spellKnown = IsPlayerSpell(spellID)
            end

            return not not spellKnown
        end

        -- Normale Cat-5-Skills bleiben unverändert sichtbar, sofern der
        -- zugehörige Beruf gelernt ist.
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

function Visuals:ApplyFontStyle(fontString, size, catID)
    local catSettings = ProfessionsHelper.db.profile.catSettings[catID]
    local fontName = (catSettings and catSettings.font) or "Friz Quadrata TT"
    local fontPath = LSM:Fetch("font", fontName)
    
    fontString:SetFont(fontPath, size or 12, "OUTLINE")
end

function Visuals:ClearFrames()
    for _, frame in ipairs(self.ActiveFrames) do
        if frame then
            frame:Hide()
            frame:UnregisterAllEvents()
            frame:SetScript("OnUpdate", nil)
            frame:SetScript("OnEvent", nil)
            frame:SetParent(nil)
        end
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

-- RecipeDB lookup helpers: recipes are grouped by profession and may contain alternatives.
local function IsRecipeDefinition(value)
    return type(value) == "table"
        and (value.yield ~= nil or value.slots ~= nil or value.isSpell ~= nil)
end

local function FindRecipeEntry(container, itemID)
    if type(container) ~= "table" then return nil end

    for key, value in pairs(container) do
        if type(key) == "number" and key == itemID then
            return value
        end
        if type(value) == "table" and not IsRecipeDefinition(value) then
            local found = FindRecipeEntry(value, itemID)
            if found ~= nil then return found end
        end
    end

    return nil
end

local function NormalizeRecipeList(entry)
    if IsRecipeDefinition(entry) then
        return { entry }
    end

    local recipes = {}
    if type(entry) == "table" then
        for _, recipe in ipairs(entry) do
            if IsRecipeDefinition(recipe) then
                recipes[#recipes + 1] = recipe
            end
        end
    end
    return recipes
end

function Visuals:GetRecipeEntry(itemID)
    if not ProfessionsHelperData or not itemID then return nil end

    for _, expData in pairs(ProfessionsHelperData) do
        if expData.RecipeDB then
            local entry = FindRecipeEntry(expData.RecipeDB, itemID)
            if entry ~= nil then return entry end
        end
    end
    return nil
end

function Visuals:GetCraftableAmount(recipeID)
    local entry = self:GetRecipeEntry(recipeID)
    local recipes = NormalizeRecipeList(entry)
    if #recipes == 0 then return 0 end

    local totalCraftable = 0
    for _, recipe in ipairs(recipes) do
        local finalMax = math.huge
        local hasRequirement = false
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
                                        local count = self:GetItemCount(id)
                                        if count >= needed then
                                            totalApps = totalApps + math.floor(count / needed)
                                        end
                                    end
                                end
                            end
                        end
                    end
                    currentSlotPossible = totalApps
                    hasRequirement = true
                elseif slot.ids then
                    local stock = 0
                    for _, id in ipairs(slot.ids) do
                        stock = stock + self:GetItemCount(id)
                    end
                    currentSlotPossible = math.floor(stock / needed)
                    hasRequirement = true
                end

                if currentSlotPossible < finalMax then
                    finalMax = currentSlotPossible
                end
            end
        end

        if hasRequirement and finalMax ~= math.huge then
            totalCraftable = totalCraftable + finalMax
        end
    end

    return totalCraftable
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

function Visuals:GetCurrentZoneMode()
    local _, instanceType = GetInstanceInfo()
    -- 1. Check auf Delves (Szenario-Typ in TWW)
    if C_PartyInfo and C_PartyInfo.IsDelveInProgress and C_PartyInfo.IsDelveInProgress() then
        return "isDelve"
    end
    -- 2. Check auf Raid
    -- GetRaidDifficultyID() > 0 und instanceType "raid"
    if instanceType == "raid" then
        return "isRaid"
    end
    -- 3. Check auf Dungeon
    -- instanceType "party" ist der sicherste Indikator für 5-Mann Content
    if instanceType == "party" then
        return "isDungeon"
    end
    return "none"
end

-- ==========================================
-- 4. RENDERING FUNKTIONEN
-- ==========================================

-- Bars
function Visuals:CreateBar(name, parent, itemIDs, posX, posY, barColor, customSettings, profName)
    local settings = customSettings or {}
    local catDefault = ProfessionsHelper.db.profile.catSettings[1] or {}
    local gDB = ProfessionsHelper.db.global or {}
    
    -- Wuchsrichtung: Nutzt jetzt den String-Vergleich passend zur Settings.lua
    local growthVal = settings.barGrowth or catDefault.barGrowth or "BOTTOM_TOP"
    local isGrowUp = (growthVal == "BOTTOM_TOP")
    
    -- Maße & Skalierung
    local barW = settings.width or catDefault.width or 30
    local barH = settings.height or catDefault.height or 100
    local scale = settings.scale or catDefault.scale or 1
    local fSize = settings.fontSize or catDefault.fontSize or gDB.fontSize or 10

    -- 2. Frame-Erstellung
    local frame = CreateFrame("Frame", "PH_Bar_"..name, parent, "BackdropTemplate")
    frame.catID = 1
    frame.profName = profName
    
    frame:SetSize(barW, barH + barW + 5) 
    frame:SetPoint("CENTER", UIParent, "CENTER", posX or 0, posY or 0)
    frame:SetScale(scale)
    
    -- 3. Die Statusbar
    local bar = CreateFrame("StatusBar", nil, frame)
    bar:SetSize(barW, barH)

    -- TEXTUR-CHECK (Hier krachte es wahrscheinlich)
    local rawTexture = settings.barTexture or catDefault.barTexture or gDB.barTexture or "Cilo"
    local texturePath = LSM:Fetch("statusbar", rawTexture) or LSM:Fetch("statusbar", "Cilo")
    
    bar:SetStatusBarTexture(texturePath)
    bar:GetStatusBarTexture():SetHorizTile(false)
    bar:GetStatusBarTexture():SetVertTile(false)
    
    -- FARBEN / GRADIENT
    local tex = bar:GetStatusBarTexture()
    if #barColor >= 6 then
        -- Korrekte Nutzung von CreateColor Objekten für Gradients
        tex:SetGradient("VERTICAL", 
            CreateColor(barColor[1], barColor[2], barColor[3], 1),
            CreateColor(barColor[4], barColor[5], barColor[6], 1)
        )
    else
        -- FIX: Auch hier MÜSSEN CreateColor Objekte übergeben werden,
        -- um den Gradient-Effekt zu "resetten" oder eine flache Farbe zu erzwingen.
        local r, g, b = barColor[1] or 1, barColor[2] or 1, barColor[3] or 1
        local col = CreateColor(r, g, b, 1)
        
        tex:SetGradient("VERTICAL", col, col)
        bar:SetStatusBarColor(r, g, b)
    end
    
    local barBg = bar:CreateTexture(nil, "BACKGROUND")
    barBg:SetAllPoints()
    barBg:SetColorTexture(0.1, 0.1, 0.1, 0.6)

    -- 4. Das Icon & Wuchsrichtung
    local icon = frame:CreateTexture(nil, "ARTWORK")
    icon:SetSize(barW, barW)
    
    bar:ClearAllPoints()
    icon:ClearAllPoints()
    bar:SetOrientation("VERTICAL")

    if isGrowUp then
        icon:SetPoint("BOTTOM", frame, "BOTTOM", 0, 0)
        bar:SetPoint("BOTTOM", icon, "TOP", 0, 2)
        bar:SetReverseFill(false)
    else
        icon:SetPoint("TOP", frame, "TOP", 0, 0)
        bar:SetPoint("TOP", icon, "BOTTOM", 0, -2)
        bar:SetReverseFill(true)
    end
    
    -- 5. Texte (Zahlen)
    local textOverlay = CreateFrame("Frame", nil, frame)
        textOverlay:SetAllPoints(bar)
        textOverlay:SetFrameLevel(bar:GetFrameLevel() + 10)

        local function CreateCenteredText(colorKey, defaultColor)
            local t = textOverlay:CreateFontString(nil, "OVERLAY")
            
            -- Nutzt die zentrale ApplyFontStyle Funktion
            self:ApplyFontStyle(t, fSize, 1)
            
            -- ERWEITERTE FARB-LOGIK:
            -- 1. Schaut in spezifischen Settings (falls übergeben)
            -- 2. Schaut in catSettings[1] (da liegen jetzt colorQ1, colorQ2 etc.)
            -- 3. Schaut in global (Fallback)
            -- 4. Nutzt ein hartcodiertes Default
            local c = settings[colorKey] or catDefault[colorKey] or gDB[colorKey] or defaultColor
            
            t:SetTextColor(c.r or 1, c.g or 1, c.b or 1)
            t:SetJustifyH("CENTER")
            t:SetWidth(barW + 10)
            return t
        end

        -- Wir übergeben Standard-Farben für den Fall, dass die DB leer ist
        local tB = CreateCenteredText("colorQ1", {r=1, g=0.5, b=0})   -- Orange (Qualität 1)
        local tS = CreateCenteredText("colorQ2", {r=0.8, g=0.8, b=0.8}) -- Silber (Qualität 2)
        local tG = CreateCenteredText("colorQ3", {r=1, g=0.85, b=0})  -- Gold (Qualität 3)

    -- 6. Update-Logik
    local function Update()
        local b = self:GetItemCount(itemIDs[1] or 0)
        local s = self:GetItemCount(itemIDs[2] or 0)
        local g = itemIDs[3] and self:GetItemCount(itemIDs[3]) or 0
        
        tB:ClearAllPoints()
        tS:ClearAllPoints()
        tG:ClearAllPoints()

        if not itemIDs[3] then 
            -- FALL: Nur 2 Qualitätsstufen vorhanden
            tB:Hide() -- Wir verstecken den "Bronze" Text
            
            tS:Show()
            tS:SetPoint("CENTER", bar, "CENTER", 0, 10)
            tS:SetText(b > 0 and b or "") -- Menge von ID 1 wird als Silber angezeigt
            
            tG:Show()
            tG:SetPoint("CENTER", bar, "CENTER", 0, -10)
            tG:SetText(s > 0 and s or "") -- Menge von ID 2 wird als Gold angezeigt
        else 
            -- FALL: Standard (3 Qualitäten)
            tB:Show()
            tB:SetPoint("CENTER", bar, "CENTER", 0, 15)
            tB:SetText(b > 0 and b or "")
            
            tS:Show()
            tS:SetPoint("CENTER", bar, "CENTER", 0, 0)
            tS:SetText(s > 0 and s or "")
            
            tG:Show()
            tG:SetPoint("CENTER", bar, "CENTER", 0, -15)
            tG:SetText(g > 0 and g or "")
        end

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

-- Material Icons
function Visuals:CreateMaterialIcon(parent, ids, x, y, profName, achievementID)
    local frame = CreateFrame("Frame", nil, parent)
    frame.catID = 2
    local settings = ProfessionsHelper.db.profile.catSettings[2] or {}
    
    frame:SetSize(20, 20)
    frame:SetScale(settings.scale or 1)
    frame:SetPoint("CENTER", UIParent, "CENTER", x, y)

    local icon = frame:CreateTexture(nil, "ARTWORK")
    icon:SetAllPoints()
    icon:SetTexture(C_Item.GetItemIconByID(ids[1]))

    -- 1. SCHRIFTART (Hier nutzen wir deine neue zentrale Funktion)
    local text = frame:CreateFontString(nil, "OVERLAY") 
    frame.Count = text 
    local fSize = settings.fontSize or 12
    self:ApplyFontStyle(text, fSize, 2) -- Nutzt Schriftart aus Kat 2
    
    text:SetTextColor(0.3, 0.9, 0.25)

    -- 2. ACHIEVEMENT BALKEN (Deine funktionierende Logik)
    if achievementID then
        frame.progressBar = CreateFrame("StatusBar", nil, frame)
        frame.progressBar:SetSize(20, 6)
        frame.progressBar:SetPoint("TOP", frame, "BOTTOM", 0, -2)
        frame.progressBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
        frame.progressBar:SetStatusBarColor(0.6, 0.4, 0.2)
        
        local bg = frame.progressBar:CreateTexture(nil, "BACKGROUND")
        bg:SetAllPoints(); bg:SetColorTexture(0, 0, 0, 0.6)

        frame.progressBar:EnableMouse(true)
        frame.progressBar:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            local _, achName = GetAchievementInfo(achievementID)
            local _, _, _, quantity, req = GetAchievementCriteriaInfo(achievementID, 1)
            
            GameTooltip:AddLine(achName or "Fortschritt", 1, 1, 1)
            GameTooltip:AddLine(string.format("Fortschritt: %d / %d", quantity or 0, req or 0), 0.8, 0.8, 0.8)
            GameTooltip:AddLine("Sammeln vom Mount nach Abschluss freigeschaltet.", 0, 1, 0, true)
            GameTooltip:Show()
        end)
        frame.progressBar:SetScript("OnLeave", function() GameTooltip:Hide() end)
    end

    local function Update()
        -- Items zählen
        local total = 0
        for _, id in ipairs(ids) do 
            total = total + self:GetItemCount(id) 
        end
        text:SetText(total > 0 and total or "")
        icon:SetDesaturated(total == 0); icon:SetAlpha(total == 0 and 0.4 or 1.0)

        -- Balken-Logik (Sicherstellen, dass er richtig füllt)
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

        -- 3. ANKER SETZEN (Nutzt frame.textAlign aus dem Rendering)
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
        -- Spezieller Fix für das Holzfällen-Sammeln (Spell-ID Check)
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

-- Professions Icons
function Visuals:CreateProfessionIcon(parent, ids, x, y, profName)
    local frame = CreateFrame("Frame", nil, parent)
    frame.catID = 3
    local settings = ProfessionsHelper.db.profile.catSettings[3] or {}
    
    frame:SetSize(40, 40)
    frame.itemID = (type(ids) == "table") and ids[1] or ids
    frame:SetScale(settings.scale or 1)
    frame:SetPoint("CENTER", UIParent, "CENTER", x, y)
    
    local icon = frame:CreateTexture(nil, "ARTWORK")
    icon:SetAllPoints()
    icon:SetTexture(C_Item.GetItemIconByID(frame.itemID))

    -- TEXT-ELEMENTE ERSTELLEN
    -- Bestand Oben Links (Grün)
    local textStock = frame:CreateFontString(nil, "OVERLAY")
    self:ApplyFontStyle(textStock, 14, 3) -- Nutzt Kat 3 Font, Größe 14
    textStock:SetPoint("TOPLEFT", frame, "TOPLEFT", 2, -2)
    textStock:SetTextColor(0, 1, 0)

    -- Ertrag Mitte Rechts (Orange)
    local textYield = frame:CreateFontString(nil, "OVERLAY")
    self:ApplyFontStyle(textYield, 12, 3) -- Nutzt Kat 3 Font, Größe 12
    textYield:SetPoint("RIGHT", frame, "RIGHT", -2, 4) 
    textYield:SetTextColor(1, 0.6, 0) 

    -- Machbare Menge Unten Rechts (Gelb)
    local textCraft = frame:CreateFontString(nil, "OVERLAY")
    self:ApplyFontStyle(textCraft, 14, 3) -- Nutzt Kat 3 Font, Größe 14
    textCraft:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)
    textCraft:SetTextColor(1, 0.82, 0)

    local function Update()
        -- Bestand berechnen
        local totalOwned = 0
        if type(ids) == "table" then
            for _, id in ipairs(ids) do 
                totalOwned = totalOwned + self:GetItemCount(id) 
            end
        else
            totalOwned = self:GetItemCount(ids)
        end
        textStock:SetText(totalOwned > 0 and totalOwned or "")

        -- Yield Logik: only display a yield when all recipe alternatives agree.
        local recipeEntry = self:GetRecipeEntry(frame.itemID)
        local recipes = NormalizeRecipeList(recipeEntry)
        local commonYield = recipes[1] and recipes[1].yield or nil
        if commonYield then
            for i = 2, #recipes do
                if recipes[i].yield ~= commonYield then
                    commonYield = nil
                    break
                end
            end
        end

        if commonYield and commonYield > 1 then
            textYield:SetText("+" .. commonYield)
        else
            textYield:SetText("")
        end

        -- Craftable Menge
        local craftCount = Visuals:GetCraftableAmount(frame.itemID)
        textCraft:SetText(craftCount > 0 and "x" .. craftCount or "")
        
        local hasAnything = (totalOwned > 0 or craftCount > 0)
        icon:SetDesaturated(not hasAnything)
        icon:SetAlpha(hasAnything and 1.0 or 0.4)
    end

    frame:RegisterEvent("BAG_UPDATE_DELAYED")
    frame:SetScript("OnEvent", Update)
    Update()

    MakeInteractive(frame, ids, profName)
    return frame
end

function Visuals:CreateSpecialActionIcon(parent, recipeID, x, y, profName)
    local recipeEntry = self:GetRecipeEntry(recipeID)
    local recipes = NormalizeRecipeList(recipeEntry)
    local recipe = recipes[1]
    if not recipe then return nil end

    local frame = CreateFrame("Frame", nil, parent)
    frame.catID = 3; frame:SetSize(40, 40)
    frame:SetPoint("CENTER", UIParent, "CENTER", x, y)
    
    local icon = frame:CreateTexture(nil, "ARTWORK"); icon:SetAllPoints()
    icon:SetTexture(recipe.isSpell and C_Spell.GetSpellTexture(recipe.spellID) or C_Item.GetItemIconByID(recipeID))

    -- SCHRIFTART ANPASSEN
    local textInfo = frame:CreateFontString(nil, "OVERLAY")
    self:ApplyFontStyle(textInfo, 11, 3) -- Cooldown/Ladungen
    textInfo:SetPoint("TOPLEFT", frame, "TOPLEFT", 2, -2)
    textInfo:SetTextColor(0.4, 0.8, 1)

    local textCraft = frame:CreateFontString(nil, "OVERLAY")
    self:ApplyFontStyle(textCraft, 14, 3) -- Handwerk-Menge
    textCraft:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)

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

    MakeInteractive(frame, recipeID, profName)
    return frame
end

-- Fishing Matrix
function Visuals:CreateFishingIcon(parent, ids, x, y, settingKey)
    local frame = CreateFrame("Frame", nil, parent)
    frame.catID = 4
    local settings = ProfessionsHelper.db.profile.catSettings[4] or {}
    
    frame:SetSize(30, 30)
    frame:SetScale(settings.scale or 1)
    frame:SetPoint("CENTER", UIParent, "CENTER", x, y)
    
    local icon = frame:CreateTexture(nil, "ARTWORK")
    icon:SetAllPoints()
    icon:SetTexture(C_Item.GetItemIconByID(ids[1]))
    
    -- SCHRIFTART: ApplyFontStyle statt festem Template
    local text = frame:CreateFontString(nil, "OVERLAY")
    frame.Count = text
    local fSize = settings.fontSize or 12
    self:ApplyFontStyle(text, fSize, 4) -- Kat 4 Font nutzen
    
    text:SetTextColor(1, 1, 1)

    local function Update()
        -- 1. Bestand zählen
        local total = 0
        for _, id in ipairs(ids) do 
            total = total + self:GetItemCount(id) 
        end
        text:SetText(total > 0 and total or "")
        icon:SetDesaturated(total == 0)
        icon:SetAlpha(total == 0 and 0.4 or 1.0)

        -- 2. Dynamische Text-Ausrichtung
        -- Wir schauen erst in die Sub-Settings (Beruf), dann in die Cat-Settings
        local pSet = ProfessionsHelper.db.profile.profSubSettings[settingKey] or {}
        local align = pSet.textAlign or settings.textAlign or "BOTTOM"
        
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
    end

    frame.UpdateManually = Update
    frame:RegisterEvent("BAG_UPDATE_DELAYED")
    frame:SetScript("OnEvent", Update)
    
    Update()
    MakeInteractive(frame, ids, settingKey) 
    return frame
end

-- Skill Icons
function Visuals:CreateSkillIcon(parent, spellID, x, y, settingKey) 
    local frame = CreateFrame("Frame", nil, UIParent)
    frame:SetFrameStrata("MEDIUM")
    frame.catID = 5
    local settings = ProfessionsHelper.db.profile.catSettings[5] or {}
    
    frame:SetSize(40, 40)
    frame:SetScale(settings.scale or 1)
    frame:SetPoint("CENTER", UIParent, "CENTER", x or 0, y or -100)

    -- Interner Datenspeicher
    frame.internal = { cur = 0, max = 0, start = 0, duration = 0, modRate = 1, hasCharges = false }

    local icon = frame:CreateTexture(nil, "ARTWORK")
    icon:SetAllPoints()
    icon:SetTexture(C_Spell.GetSpellTexture(spellID) or 134400)

    -- SCHRIFTART: Ladungs-Text (Unten Rechts)
    local chargeText = frame:CreateFontString(nil, "OVERLAY")
    self:ApplyFontStyle(chargeText, 14, 5) -- Kat 5 Font, Größe 14
    chargeText:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)

    -- SCHRIFTART: Timer-Text (Zentrum)
    local timerText = frame:CreateFontString(nil, "OVERLAY")
    -- Timer etwas kleiner (12), damit h/m/s Angaben gut reinpassen
    self:ApplyFontStyle(timerText, 12, 5) 
    timerText:SetPoint("CENTER", frame, "CENTER", 0, 0)
    timerText:SetTextColor(1, 0.8, 0)

    -- Tooltip Setup (Bleibt gleich)
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
            local elapsed = (now - data.start)
            remain = data.duration - (elapsed * data.modRate)
        end

        if data.hasCharges then
            chargeText:SetText(data.cur > 0 and data.cur or "|cFFFF00000|r")
        else
            chargeText:SetText("")
        end
        
        if remain > 0.1 then
            timerText:SetText(FormatTime(remain))
        else
            timerText:SetText("")
        end

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

    if type(MakeInteractive) == "function" then 
        MakeInteractive(frame, {spellID}, settingKey) 
    end
    return frame
end

-- ==========================================
-- 5. INITIALISIERUNG (INIT)
-- ==========================================

function Visuals:Init()
    self:ClearFrames()
    local professionSkillLevels = PerformCharacterScan()

    local learned = ProfessionsHelper.db.profile.learnedProfessions
    local mapID = C_Map.GetBestMapForUnit("player")
    if not mapID or not ProfessionsHelperData then return end

    local buckets = { [1] = {}, [2] = {}, [3] = {}, [4] = {}, [5] = {} }
    -- Dieselbe Item-ID kann in mehreren Quelldatensätzen vorkommen.
    -- Innerhalb einer Kategorie darf sie aber nur einmal visualisiert werden.
    -- Die Deduplizierung ist bewusst pro Kategorie getrennt, damit ein Item
    -- weiterhin gleichzeitig z. B. als Balken und Material-Icon erscheinen kann.
    local bucketSeen = { [1] = {}, [2] = {}, [3] = {}, [4] = {}, [5] = {} }

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
                    local override = GetItemCategoryOverride(itemData)
                    local originalCat = tonumber(itemData.displayCategory) or 0
                    local categoriesToProcess = {}

                    if override ~= nil then
                        -- Ein vorhandener Matrix-Override ersetzt die Standardkategorie
                        -- ausschließlich für die drei Matrix-Kategorien.
                        for _, matrixCat in ipairs({ 1, 2, 3 }) do
                            if override[matrixCat] == true then
                                table.insert(categoriesToProcess, matrixCat)
                            end
                        end
                        -- Andere bestehende Kategorien (z. B. 4/5) bleiben erhalten.
                        if originalCat == 4 or originalCat == 5 then
                            table.insert(categoriesToProcess, originalCat)
                        end
                    else
                        table.insert(categoriesToProcess, originalCat)
                    end

                    for _, cat in ipairs(categoriesToProcess) do
                        if CanPlayerSeeItem(catName, itemData, cat)
                            and MeetsProfessionSkillRequirement(cat, catName, itemData, professionSkillLevels) then
                            local showItem = false

                            if catName == "Wood" then showItem = true
                            elseif (cat == 1 or cat == 5 or cat == 4) and isCurrentExp then showItem = true
                            elseif (cat == 2 or cat == 3) and isInCity then showItem = true end

                            if showItem and buckets[cat] then
                                local settings = ProfessionsHelper.db.profile.catSettings[cat]
                                if settings and settings.enabled then
                                    -- Bestehende Berufs-/Bucket-Zuordnung beibehalten.
                                    local bucketToUse = catName
                                    local displayProf = "Other"
                                    local pData = itemData.gatheringProf or itemData.processingProfs

                                    if type(pData) == "table" then
                                        for _, p in ipairs(pData) do
                                            if learned[p] then
                                                displayProf = p
                                                if cat == 2 then bucketToUse = p end
                                                break
                                            end
                                        end
                                    elseif type(pData) == "string" then
                                        displayProf = pData
                                        if cat == 2 and learned[pData] then bucketToUse = pData end
                                    end

                                    local itemKey = nil
                                    if type(itemData.IDs) == "table" then
                                        for _, itemID in ipairs(itemData.IDs) do
                                            if itemID ~= nil then
                                                itemKey = tostring(itemID)
                                                break
                                            end
                                        end
                                    end
                                    -- Datensätze ohne ID behalten ihr bisheriges Verhalten.
                                    itemKey = itemKey or (tostring(itemName) .. "|" .. tostring(itemData))
                                    -- Für doppelte Quelldatensätze einen stabilen Gruppenschlüssel
                                    -- bestimmen. Nicht der zufällige pairs()-Durchlauf entscheidet,
                                    -- welcher Datensatz die spätere Anzeige-Gruppe festlegt.
                                    local candidateGroupKey = ProfessionsHelper:GetGlobalBucketKey(itemData, cat)

                                    -- Kernkategorien 1, 2 und 3 erhalten dynamische Untergruppen
                                    -- anhand des Top-Level-Tabellennamens (z. B. Hide oder Scales).
                                    -- Der Schlüssel muss mit Settings.lua übereinstimmen.
                                    if cat == 1 or cat == 2 or cat == 3 then
                                        candidateGroupKey = candidateGroupKey .. "_" .. tostring(catName)
                                    end
                                    candidateGroupKey = tostring(candidateGroupKey or "Other")

                                    -- Ein Datensatz, dessen native displayCategory der gerade
                                    -- dargestellten Kategorie entspricht, ist die bevorzugte
                                    -- Quelle. Damit gewinnt bei z. B. Leichtem Leder die
                                    -- ursprüngliche Gruppenzuordnung statt eines alphabetisch
                                    -- zufällig bevorzugten Duplikats.
                                    local candidateNative = (originalCat == cat) and 1 or 0
                                    local candidate = {
                                        name = itemName,
                                        data = itemData,
                                        prof = displayProf,
                                        bucketName = bucketToUse,
                                        sourceBucket = catName,
                                        groupKey = candidateGroupKey,
                                        nativeCategory = candidateNative
                                    }
                                    local existingIndex = bucketSeen[cat][itemKey]
                                    if not existingIndex then
                                        table.insert(buckets[cat], candidate)
                                        bucketSeen[cat][itemKey] = #buckets[cat]
                                    else
                                        local existing = buckets[cat][existingIndex]
                                        -- Erst native Kategorie bevorzugen. Bei Gleichstand
                                        -- bleibt die Auswahl deterministisch über den Schlüssel.
                                        if candidate.nativeCategory > (existing.nativeCategory or 0)
                                            or (candidate.nativeCategory == (existing.nativeCategory or 0)
                                                and candidateGroupKey < existing.groupKey) then
                                            buckets[cat][existingIndex] = candidate
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    local function AddToUI(f) if f then table.insert(self.ActiveFrames, f) end end
    -- Die linke Tab-Kante folgt der sichtbaren linken Kante des ersten Items.
    local function GetLayerTabBarLeft(itemCenterX, _, itemWidth)
        return itemCenterX - ((tonumber(itemWidth) or 0) / 2), 0
    end
    local function HandleWrap(curX, startX, width) return (curX - startX) > width end

    -- Cat 1/2/4 use the existing group renderer and its layout settings.
    -- A group only enters layering when every currently visible item has a
    -- valid required value; otherwise the original complete group is retained.
    local function ApplyCategoryLayering(category, settingKey, items, pos)
        local profile = ProfessionsHelper.db.profile
        local config = profile.layeringSettings or {}
        local enabled = config.enabledCategories and config.enabledCategories[category]
        if not enabled then return items end

        -- Wood's displayCategory 2 rendering remains deliberately unchanged.
        if category == 2 then
            for _, item in ipairs(items) do
                if item.sourceBucket == "Wood" and tonumber(item.data.displayCategory) == 2 then
                    return items
                end
            end
        end

        local ranges
        if config.rangeMode == "CUSTOM" then
            ranges = config.customRanges
            if type(ranges) ~= "table" or #ranges == 0 then return items end
            local previousMax = -1
            for _, range in ipairs(ranges) do
                if type(range) ~= "table" then return items end
                local minValue, maxValue = tonumber(range.min), tonumber(range.max)
                if not minValue or not maxValue or minValue < 0 or minValue ~= math.floor(minValue)
                    or maxValue < minValue or maxValue ~= math.floor(maxValue) or minValue <= previousMax then
                    return items
                end
                previousMax = maxValue
            end
        else
            ranges = {
                { min = 0, max = 50 }, { min = 51, max = 100 },
                { min = 101, max = 150 }, { min = 151, max = 200 },
                { min = 201, max = 250 }, { min = 251, max = 300 },
                { min = 301, max = math.huge },
            }
        end

        local layerByItem, counts = {}, {}
        for index = 1, #ranges do counts[index] = 0 end
        local visibleCount = 0
        for _, item in ipairs(items) do
            if profile.itemFilters[item.name] ~= false then
                visibleCount = visibleCount + 1
                local required = type(item.data) == "table" and tonumber(item.data.required)
                local layer
                if required and required >= 0 and required == math.floor(required) then
                    for index, range in ipairs(ranges) do
                        if required >= tonumber(range.min) and required <= tonumber(range.max) then
                            layer = index
                            break
                        end
                    end
                end
                if not layer then return items end
                layerByItem[item] = layer
                counts[layer] = counts[layer] + 1
            end
        end
        if visibleCount == 0 then return items end

        local layerKey = "cat" .. category .. ":" .. tostring(settingKey)
        local selected = config.selectedLayers and config.selectedLayers[layerKey]
        if not selected or not counts[selected] or counts[selected] == 0 then
            selected = nil
            for index = 1, #ranges do
                if counts[index] > 0 then selected = index; break end
            end
        end

        local tabWidth, tabHeight, tabGap = 30, 22, 2
        local totalWidth = (#ranges * tabWidth) + ((#ranges - 1) * tabGap)
        local categorySettings = profile.catSettings[category] or {}
        local itemWidth
        if category == 1 then
            local subSettings = profile.profSubSettings[settingKey] or {}
            itemWidth = (tonumber(subSettings.width) or tonumber(categorySettings.width) or 30)
                * (tonumber(subSettings.scale) or tonumber(categorySettings.scale) or 1)
        elseif category == 2 then
            itemWidth = 20 * (tonumber(categorySettings.scale) or 1)
        else
            itemWidth = 30 * (tonumber(categorySettings.scale) or 1)
        end
        local tabBar = CreateFrame("Frame", nil, UIParent)
        tabBar:SetSize(totalWidth, tabHeight)
        local tabBarLeft, layerOffsetX = GetLayerTabBarLeft(pos.x, totalWidth, itemWidth)
        tabBar:SetPoint("BOTTOMLEFT", UIParent, "CENTER", tabBarLeft, pos.y)
        tabBar:SetFrameStrata("MEDIUM")
        tabBar:SetFrameLevel(20)
        AddToUI(tabBar)

        local buttons = {}
        local function RefreshTabs()
            for index, button in ipairs(buttons) do
                button.bg:SetColorTexture(index == selected and 0.16 or (counts[index] > 0 and 0.20 or 0.08),
                    index == selected and 0.38 or (counts[index] > 0 and 0.20 or 0.08),
                    index == selected and 0.68 or (counts[index] > 0 and 0.20 or 0.08),
                    counts[index] > 0 and 1 or 0.55)
                button.label:SetTextColor(counts[index] > 0 and 0.9 or 0.4, counts[index] > 0 and 0.9 or 0.4, counts[index] > 0 and 0.9 or 0.4, 1)
            end
        end
        for index, range in ipairs(ranges) do
            local button = CreateFrame("Button", nil, tabBar)
            button:SetSize(tabWidth, tabHeight)
            button:SetPoint("LEFT", tabBar, "LEFT", (index - 1) * (tabWidth + tabGap), 0)
            button.bg = button:CreateTexture(nil, "BACKGROUND")
            button.bg:SetAllPoints()
            button.label = button:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            button.label:SetPoint("CENTER")
            button.label:SetText(index)
            if counts[index] > 0 then
                button:SetScript("OnClick", function()
                    config.selectedLayers = config.selectedLayers or {}
                    config.selectedLayers[layerKey] = index
                    self:Init()
                end)
            else
                button:EnableMouse(false)
            end
            button:SetScript("OnEnter", function(selfButton)
                GameTooltip:SetOwner(selfButton, "ANCHOR_TOP")
                GameTooltip:AddLine("Layer " .. index, 1, 1, 1)
                GameTooltip:AddLine("Required: " .. tostring(range.min) .. "–" .. tostring(range.max), 0.8, 0.8, 0.8)
                GameTooltip:AddLine("Items: " .. tostring(counts[index]), 0.7, 0.7, 0.7)
                GameTooltip:Show()
            end)
            button:SetScript("OnLeave", function() GameTooltip:Hide() end)
            buttons[index] = button
        end
        RefreshTabs()

        local filtered = {}
        for _, item in ipairs(items) do
            if profile.itemFilters[item.name] ~= false and layerByItem[item] == selected then
                filtered[#filtered + 1] = item
            end
        end
        return filtered, layerOffsetX, -(tabHeight + 8)
    end

-- Rendering Cat 1 (Balken)
if ProfessionsHelper.db.profile.catSettings[1].enabled then
    local barGroups = {}
    
    -- Schritt 1: Items nach Beruf (settingKey) gruppieren
    for _, item in ipairs(buckets[1]) do
        local settingKey = item.groupKey or ProfessionsHelper:GetGlobalBucketKey(item.data, 1)
        if settingKey then
            barGroups[settingKey] = barGroups[settingKey] or {}
            table.insert(barGroups[settingKey], item)
        end
    end

    -- Schritt 2: Die Gruppen rendern
    for settingKey, items in pairs(barGroups) do
        local subSettings = ProfessionsHelper.db.profile.profSubSettings[settingKey] or {}
        local currentMode = self:GetCurrentZoneMode()
        
        -- Prüfung: Auto-Hide (Dungeon/Raid/Delve)
        local isHiddenByMode = (currentMode == "isDungeon" and subSettings.hideInDungeon) or 
                               (currentMode == "isRaid" and subSettings.hideInRaid) or 
                               (currentMode == "isDelve" and subSettings.hideInDelve)

        if subSettings.enabled ~= false and not isHiddenByMode then 
            local pos = ProfessionsHelper.db.profile.positions[settingKey] or {x = -450, y = 150}
            local currentX = pos.x
            local currentY = pos.y
            local growthSetting = subSettings.barGrowth or "BOTTOM_TOP"

            -- Sortierung
            local mode = subSettings.sortMode or "ID_ASC"
            table.sort(items, function(a, b)
                if mode == "CUSTOM" then
                    local sortA = ProfessionsHelper.db.profile.itemSortOrder and ProfessionsHelper.db.profile.itemSortOrder[a.name] or 99
                    local sortB = ProfessionsHelper.db.profile.itemSortOrder and ProfessionsHelper.db.profile.itemSortOrder[b.name] or 99
                    if sortA ~= sortB then return sortA < sortB end
                elseif mode == "COUNT_DESC" or mode == "COUNT_ASC" then
                    local function GetTotal(itemObj)
                        local total = 0
                        for _, id in ipairs(itemObj.data.IDs or {}) do
                            total = total + self:GetItemCount(id)
                        end
                        return total
                    end
                    local countA, countB = GetTotal(a), GetTotal(b)
                    if countA ~= countB then
                        return (mode == "COUNT_DESC") and (countA > countB) or (countA < countB)
                    end
                elseif mode == "ID_DESC" then
                    local idA = tonumber(a.data.IDs and a.data.IDs[1]) or 0
                    local idB = tonumber(b.data.IDs and b.data.IDs[1]) or 0
                    if idA ~= idB then return idA > idB end
                elseif mode == "ID_ASC" then
                    local idA = tonumber(a.data.IDs and a.data.IDs[1]) or 0
                    local idB = tonumber(b.data.IDs and b.data.IDs[1]) or 0
                    if idA ~= idB then return idA < idB end
                elseif mode == "NAME_ASC" then
                    return (a.name or "") < (b.name or "")
                end
                local idA = tonumber(a.data.IDs and a.data.IDs[1]) or 0
                local idB = tonumber(b.data.IDs and b.data.IDs[1]) or 0
                return idA < idB -- Default: ID_ASC
            end)

            local layerOffsetX, layerOffsetY
            items, layerOffsetX, layerOffsetY = ApplyCategoryLayering(1, settingKey, items, pos)
            currentX = pos.x + (layerOffsetX or 0)
            currentY = pos.y + (layerOffsetY or 0)

            -- Schritt 3: Items der Gruppe zeichnen
            for _, item in ipairs(items) do
                if ProfessionsHelper.db.profile.itemFilters[item.name] ~= false then
                    
                    -- === FARB-LOGIK (Wiederhergestellt) ===
                    local barColors = {}
                    local customCol = ProfessionsHelper.db.profile.customItemColors and ProfessionsHelper.db.profile.customItemColors[item.name]

                    if customCol then
                        -- 1. Prio: User-Einstellung (RGB)
                        barColors = { customCol.r, customCol.g, customCol.b }
                    elseif item.data.color then
                        -- 2. Prio: Farbe aus Data.lua (Hex)
                        local hex = item.data.color:gsub("#","")
                        local r, g, b = tonumber(hex:sub(1,2),16)/255, tonumber(hex:sub(3,4),16)/255, tonumber(hex:sub(5,6),16)/255
                        barColors = { r, g, b }
                        
                        -- Gradient aus Data.lua hinzufügen
                        if item.data.gradient_End_color then
                            local gHex = item.data.gradient_End_color:gsub("#","")
                            table.insert(barColors, tonumber(gHex:sub(1,2),16)/255)
                            table.insert(barColors, tonumber(gHex:sub(3,4),16)/255)
                            table.insert(barColors, tonumber(gHex:sub(5,6),16)/255)
                        end
                    else
                        -- 3. Prio: Globaler Default
                        local d = ProfessionsHelper.db.profile.catSettings[1].defaultBarColor or {r=0.5, g=0.5, b=0.5}
                        barColors = { d.r, d.g, d.b }
                    end

                    if #barColors < 3 then barColors = {0.5, 0.5, 0.5} end
                    -- =======================================

                    local renderOptions = {}
                    for k,v in pairs(subSettings) do renderOptions[k] = v end
                    renderOptions.barGrowth = growthSetting 

                    local profName = settingKey:gsub("_c1", "") 
                    
                    local barFrame = self:CreateBar(item.name, UIParent, item.data.IDs, currentX, currentY, barColors, renderOptions, profName)
                    
                    MakeInteractive(barFrame, item.data.IDs, settingKey)
                    AddToUI(barFrame)
                    
                    local barWidth = subSettings.width or 30
                    currentX = currentX + barWidth + 8
                end
            end
        end
    end
end

-- Rendering Cat 2 (Material-Icons)
if ProfessionsHelper.db.profile.catSettings[2].enabled then
    local globalGroups = {}
    
    -- 1. Zonen-Modus abfragen
    local currentMode = self:GetCurrentZoneMode()

    -- 2. Gruppieren nach Global Key
    for _, item in ipairs(buckets[2]) do
        local gKey = item.groupKey or ProfessionsHelper:GetGlobalBucketKey(item.data, 2)
        globalGroups[gKey] = globalGroups[gKey] or {}
        table.insert(globalGroups[gKey], item)
    end

    -- 3. Rendern der Gruppen
    for gKey, items in pairs(globalGroups) do
        local pSet = ProfessionsHelper.db.profile.profSubSettings[gKey] or {}
        
        -- PRÜFUNG: Auto-Hide Logik
        local isHiddenByMode = (currentMode == "isDungeon" and pSet.hideInDungeon) or (currentMode == "isRaid" and pSet.hideInRaid) or (currentMode == "isDelve" and pSet.hideInDelve)

        -- Nur wenn enabled UND nicht durch den Modus versteckt
        if pSet.enabled ~= false and not isHiddenByMode then 
            local pos = ProfessionsHelper.db.profile.positions[gKey] or {x = -450, y = 100}
            
            -- Grid-Parameter: maxColumns begrenzt die Anzahl der Icons pro Zeile.
            local maxCols = math.max(1, tonumber(pSet.maxColumns) or 5)
            local spacingX = self.Config.SpacingX_Icon or 28
            local spacingY = self.Config.RowHeight or 40
            local visibleIdx = 0
            
            -- Sortierung nach ExpID
            table.sort(items, function(a, b) return (a.data.expID or 0) < (b.data.expID or 0) end)
            local layerOffsetX, layerOffsetY
            items, layerOffsetX, layerOffsetY = ApplyCategoryLayering(2, gKey, items, pos)
            layerOffsetX = layerOffsetX or 0
            layerOffsetY = layerOffsetY or 0
            local baseY = pos.y + layerOffsetY

            -- 4. Items der Gruppe im Grid zeichnen
            for _, item in ipairs(items) do
                if ProfessionsHelper.db.profile.itemFilters[item.name] ~= false then
                    local col = visibleIdx % maxCols
                    local row = math.floor(visibleIdx / maxCols)
                    local baseX = pos.x + layerOffsetX
                    local iX, iY = baseX, pos.y
                    
                    -- Standardmäßig links nach rechts, danach nächste Zeile nach unten.
                    -- Die bisherigen Richtungsoptionen bleiben erhalten.
                    local growth = pSet.growth or "LEFT_RIGHT"
                    if growth == "LEFT_RIGHT" then
                        iX = baseX + (col * spacingX)
                        iY = baseY - (row * spacingY)
                    elseif growth == "RIGHT_LEFT" then
                        iX = baseX - (col * spacingX)
                        iY = baseY - (row * spacingY)
                    elseif growth == "TOP_BOTTOM" then
                        iX = baseX + (row * spacingX)
                        iY = baseY - (col * spacingY)
                    elseif growth == "BOTTOM_TOP" then
                        iX = baseX + (row * spacingX)
                        iY = baseY + (col * spacingY)
                    end

                    -- Frame erstellen
                    local iconFrame = self:CreateMaterialIcon(UIParent, item.data.IDs, iX, iY, gKey, item.data.achievementID)
                    
                    if iconFrame then
                        iconFrame.textAlign = pSet.textAlign or "BOTTOM"
                        if iconFrame.UpdateManually then
                            iconFrame:UpdateManually()
                        end
                        AddToUI(iconFrame)
                        visibleIdx = visibleIdx + 1
                    end
                end
            end
        end
    end
end

-- Rendering Cat 3 (Berufs-Icons)
if ProfessionsHelper.db.profile.catSettings[3].enabled then
    local profGroups = {}
    local professionGroups = {}
    local currentMode = self:GetCurrentZoneMode()

    local layerRanges = {
        { min = 0,   max = 50,  label = "0–50" },
        { min = 51,  max = 100, label = "51–100" },
        { min = 101, max = 150, label = "101–150" },
        { min = 151, max = 200, label = "151–200" },
        { min = 201, max = 250, label = "201–250" },
        { min = 251, max = 300, label = "251–300" },
        { min = 301, max = math.huge, label = "301+" },
    }

    local professionIconWidth = 40 * (tonumber(ProfessionsHelper.db.profile.catSettings[3].scale) or 1)

    local function GetLayerIndex(required)
        required = tonumber(required)
        if not required or required < 0 then return nil end
        for index, range in ipairs(layerRanges) do
            if required >= range.min and required <= range.max then
                return index
            end
        end
        return nil
    end

    local function CreateLayerTabs(settingKey, pos, layerFrames, layerCounts, layoutGroups, contentX, initialTop)
        local tabWidth, tabHeight, tabGap = 30, 24, 2
        local totalWidth = (#layerRanges * tabWidth) + ((#layerRanges - 1) * tabGap)
        local tabBar = CreateFrame("Frame", nil, UIParent)
        tabBar:SetSize(totalWidth, tabHeight)
        local tabBarLeft = GetLayerTabBarLeft(pos.x, totalWidth, professionIconWidth)
        tabBar:SetPoint("BOTTOMLEFT", UIParent, "CENTER", tabBarLeft, pos.y)
        tabBar:SetFrameStrata("MEDIUM")
        tabBar:SetFrameLevel(20)

        local tabs = {}
        local activeLayer = nil
        for index = 1, #layerRanges do
            if layerCounts[index] > 0 then
                activeLayer = activeLayer or index
            end
        end

        local function RefreshTabs()
            for index, button in ipairs(tabs) do
                if index == activeLayer then
                    button.bg:SetColorTexture(0.16, 0.38, 0.68, 1)
                    button.label:SetTextColor(1, 1, 1, 1)
                elseif layerCounts[index] > 0 then
                    button.bg:SetColorTexture(0.20, 0.20, 0.20, 0.95)
                    button.label:SetTextColor(0.85, 0.85, 0.85, 1)
                else
                    button.bg:SetColorTexture(0.08, 0.08, 0.08, 0.55)
                    button.label:SetTextColor(0.40, 0.40, 0.40, 0.8)
                end
            end
        end

        for index, range in ipairs(layerRanges) do
            local button = CreateFrame("Button", nil, tabBar)
            button:SetSize(tabWidth, tabHeight)
            button:SetPoint("LEFT", tabBar, "LEFT", (index - 1) * (tabWidth + tabGap), 0)
            button.bg = button:CreateTexture(nil, "BACKGROUND")
            button.bg:SetAllPoints()
            button.label = button:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            button.label:SetPoint("CENTER")
            button.label:SetText(index)

            if layerCounts[index] > 0 then
                button:SetScript("OnClick", function()
                    activeLayer = index
                    for layerIndex, frames in ipairs(layerFrames) do
                        for _, iconFrame in ipairs(frames) do
                            if layerIndex == activeLayer then iconFrame:Show() else iconFrame:Hide() end
                        end
                    end
                    if layoutGroups then
                        local nextTop = initialTop
                        for _, layoutGroup in ipairs(layoutGroups) do
                            local frames = layoutGroup.framesByLayer[activeLayer] or {}
                            local itemCount = #frames

                            if itemCount > 0 then
                                layoutGroup.header:ClearAllPoints()
                                layoutGroup.header:SetPoint("TOPLEFT", UIParent, "CENTER", contentX, nextTop - 16)
                                layoutGroup.header:Show()

                                for itemIndex, iconFrame in ipairs(frames) do
                                    local col = (itemIndex - 1) % layoutGroup.maxCols
                                    local row = math.floor((itemIndex - 1) / layoutGroup.maxCols)
                                    iconFrame:ClearAllPoints()
                                    iconFrame:SetPoint(
                                        "CENTER", UIParent, "CENTER",
                                        contentX + 20 + (col * layoutGroup.spacingX),
                                        nextTop - 26 - (row * layoutGroup.spacingY)
                                    )
                                    iconFrame:Show()
                                end

                                local rows = math.ceil(itemCount / layoutGroup.maxCols)
                                nextTop = nextTop - 58 - (math.max(0, rows - 1) * layoutGroup.spacingY)
                            else
                                layoutGroup.header:Hide()
                            end
                        end
                    end
                    RefreshTabs()
                end)
            else
                button:EnableMouse(false)
            end

            button:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_TOP")
                GameTooltip:AddLine("Layer " .. index, 1, 1, 1)
                GameTooltip:AddLine("Required: " .. range.label, 0.8, 0.8, 0.8)
                GameTooltip:AddLine("Items: " .. tostring(layerCounts[index]), 0.7, 0.7, 0.7)
                GameTooltip:Show()
            end)
            button:SetScript("OnLeave", function() GameTooltip:Hide() end)
            tabs[index] = button
        end

        for layerIndex, frames in ipairs(layerFrames) do
            for _, iconFrame in ipairs(frames) do
                if layerIndex == activeLayer then iconFrame:Show() else iconFrame:Hide() end
            end
        end
        if activeLayer and layoutGroups then
            local nextTop = initialTop
            for _, layoutGroup in ipairs(layoutGroups) do
                local frames = layoutGroup.framesByLayer[activeLayer] or {}
                if #frames > 0 then
                    layoutGroup.header:ClearAllPoints()
                    layoutGroup.header:SetPoint("TOPLEFT", UIParent, "CENTER", contentX, nextTop - 16)
                    layoutGroup.header:Show()
                    for itemIndex, iconFrame in ipairs(frames) do
                        local col = (itemIndex - 1) % layoutGroup.maxCols
                        local row = math.floor((itemIndex - 1) / layoutGroup.maxCols)
                        iconFrame:ClearAllPoints()
                        iconFrame:SetPoint(
                            "CENTER", UIParent, "CENTER",
                            contentX + 20 + (col * layoutGroup.spacingX),
                            nextTop - 26 - (row * layoutGroup.spacingY)
                        )
                        iconFrame:Show()
                    end
                    local rows = math.ceil(#frames / layoutGroup.maxCols)
                    nextTop = nextTop - 58 - (math.max(0, rows - 1) * layoutGroup.spacingY)
                else
                    layoutGroup.header:Hide()
                end
            end
        end
        RefreshTabs()
        return tabBar
    end

    -- Die Datenbank-Untergruppen (z. B. Alchemy_c3_Potions) bleiben erhalten.
    -- Für das Layering werden sie zusätzlich unter der eigentlichen Profession
    -- zusammengefasst (z. B. Alchemy). Dadurch gibt es nur eine Tab-Leiste.
    for _, item in ipairs(buckets[3]) do
        local groupKey = item.groupKey or item.data.gatheringProf or item.prof or "Other"
        profGroups[groupKey] = profGroups[groupKey] or {}
        table.insert(profGroups[groupKey], item)
    end

    for groupName, items in pairs(profGroups) do
        -- Für Cat 3 ist gatheringProf die verlässlichste gemeinsame Profession.
        -- Der groupKey kann zusätzlich den Unterkategorienamen enthalten.
        local professionName = items[1] and items[1].data and items[1].data.gatheringProf
        if type(professionName) == "table" then professionName = professionName[1] end
        professionName = tostring(professionName or tostring(groupName):match("^(.-)_c3") or groupName)
        professionGroups[professionName] = professionGroups[professionName] or {}
        table.insert(professionGroups[professionName], {
            settingKey = groupName,
            items = items
        })
    end

    -- Gleiche Reihenfolge bei jedem Init; die erste aktive Untergruppe bestimmt
    -- lediglich den Ankerpunkt der gemeinsamen Tab-Leiste.
    for professionName, groups in pairs(professionGroups) do
        table.sort(groups, function(a, b) return tostring(a.settingKey) < tostring(b.settingKey) end)

        local activeGroups = {}
        local professionCanLayer = true
        local visibleItemCount = 0
        local layerCounts = {}
        local layerFrames = {}
        for index = 1, #layerRanges do
            layerCounts[index] = 0
            layerFrames[index] = {}
        end

        -- Zunächst alle aktivierten Untergruppen der Profession einsammeln.
        for _, group in ipairs(groups) do
            local settingKey = group.settingKey
            local subSettings = ProfessionsHelper.db.profile.profSubSettings[settingKey] or {}
            local isHiddenByMode = (currentMode == "isDungeon" and subSettings.hideInDungeon) or
                                   (currentMode == "isRaid" and subSettings.hideInRaid) or
                                   (currentMode == "isDelve" and subSettings.hideInDelve)

            if subSettings.enabled ~= false and not isHiddenByMode then
                local pos = ProfessionsHelper.db.profile.positions[settingKey] or {x = 200, y = 0}
                local mode = subSettings.sortMode or "ID_ASC"

                table.sort(group.items, function(a, b)
                    if mode == "CUSTOM" then
                        local sortA = ProfessionsHelper.db.profile.itemSortOrder and ProfessionsHelper.db.profile.itemSortOrder[a.name] or 99
                        local sortB = ProfessionsHelper.db.profile.itemSortOrder and ProfessionsHelper.db.profile.itemSortOrder[b.name] or 99
                        if sortA ~= sortB then return sortA < sortB end
                    elseif mode == "COUNT_DESC" or mode == "COUNT_ASC" then
                        local function GetTotal(itemObj)
                            local total = 0
                            if itemObj.data.IDs then
                                for _, id in ipairs(itemObj.data.IDs) do total = total + self:GetItemCount(id) end
                            end
                            return total
                        end
                        local cA, cB = GetTotal(a), GetTotal(b)
                        if cA ~= cB then return mode == "COUNT_DESC" and cA > cB or cA < cB end
                    elseif mode == "ID_DESC" then
                        local idA = tonumber(a.data.IDs and a.data.IDs[1]) or 0
                        local idB = tonumber(b.data.IDs and b.data.IDs[1]) or 0
                        if idA ~= idB then return idA > idB end
                    elseif mode == "ID_ASC" then
                        local idA = tonumber(a.data.IDs and a.data.IDs[1]) or 0
                        local idB = tonumber(b.data.IDs and b.data.IDs[1]) or 0
                        if idA ~= idB then return idA < idB end
                    end
                    local idA = tonumber(a.data.IDs and a.data.IDs[1]) or 0
                    local idB = tonumber(b.data.IDs and b.data.IDs[1]) or 0
                    return idA < idB
                end)

                local visibleItems = {}
                for _, item in ipairs(group.items) do
                    if ProfessionsHelper.db.profile.itemFilters[item.name] ~= false then
                        local layerIndex = GetLayerIndex(item.data and item.data.required)
                        if not layerIndex then professionCanLayer = false end
                        visibleItems[#visibleItems + 1] = { item = item, layer = layerIndex }
                    end
                end

                if #visibleItems > 0 then
                    visibleItemCount = visibleItemCount + #visibleItems
                    table.insert(activeGroups, {
                        settingKey = settingKey,
                        pos = pos,
                        subSettings = subSettings,
                        visibleItems = visibleItems
                    })
                end
            end
        end

        if visibleItemCount > 0 then
            local cat3LayeringEnabled = not (
                ProfessionsHelper.db.profile.layeringSettings
                and ProfessionsHelper.db.profile.layeringSettings.enabledCategories
                and ProfessionsHelper.db.profile.layeringSettings.enabledCategories[3] == false
            )
            if professionCanLayer and cat3LayeringEnabled then
                -- Ein gemeinsamer Layer-Filter für alle Unterkategorien der Profession.
                -- Die Unterkategorien werden im gemeinsamen Fenster untereinander angeordnet.
                local anchorGroup = activeGroups[1]
                local windowX = anchorGroup and anchorGroup.pos.x or 200
                local windowY = anchorGroup and anchorGroup.pos.y or 0
                -- Der erste Layer-Icon-Punkt bleibt an der gespeicherten Gruppenposition.
                local _, layerOffsetX = GetLayerTabBarLeft(windowX, (#layerRanges * 30) + ((#layerRanges - 1) * 2), professionIconWidth)
                local contentOffsetX = -20 -- Icon-Punkt bleibt auf dem wirksamen Layer-Anker
                local contentX = windowX + layerOffsetX + contentOffsetX
                local layerContentOffsetY = -(24 + 8)
                local sectionTop = windowY + layerContentOffsetY + 26
                local layoutGroups = {}

                for _, group in ipairs(activeGroups) do
                    local maxCols = math.max(1, tonumber(group.subSettings.maxColumns) or 5)
                    local spacingX = self.Config.SpacingX_Prof or 44
                    local spacingY = group.subSettings.customSpacingY or 40
                    local layerItemIndexes = {}
                    local groupLayerCounts = {}
                    local maxRows = 0
                    for index = 1, #layerRanges do
                        layerItemIndexes[index] = 0
                        groupLayerCounts[index] = 0
                    end
                    for _, entry in ipairs(group.visibleItems) do
                        groupLayerCounts[entry.layer] = groupLayerCounts[entry.layer] + 1
                        layerCounts[entry.layer] = layerCounts[entry.layer] + 1
                    end
                    for index = 1, #layerRanges do
                        maxRows = math.max(maxRows, math.ceil(groupLayerCounts[index] / maxCols))
                    end

                    -- Überschrift der Unterkategorie innerhalb des gemeinsamen
                    -- Layering-Bereichs; die Unterkategorien bleiben getrennt.
                    local rawSettingKey = tostring(group.settingKey)
                    -- Erst den technischen Kategorie-Suffix aus dem Setting-Key lesen:
                    -- z. B. Alchemy_c3_AlchemyBarsAndMixed -> AlchemyBarsAndMixed.
                    local categoryLabel = rawSettingKey:match("_c3_(.+)$") or rawSettingKey
                    -- Manche Top-Level-Datenbanknamen enthalten die Profession nochmals:
                    -- AlchemyBarsAndMixed -> BarsAndMixed.
                    if categoryLabel:sub(1, #professionName) == professionName then
                        categoryLabel = categoryLabel:sub(#professionName + 1)
                    end
                    categoryLabel = categoryLabel:gsub("^[_%-]+", "")
                    categoryLabel = categoryLabel:gsub("_", " "):gsub("(%l)(%u)", "%1 %2")
                    if categoryLabel == "" then categoryLabel = rawSettingKey end

                    local headerFrame = CreateFrame("Frame", nil, UIParent)
                    headerFrame:SetSize(1, 1)
                    headerFrame:SetPoint("TOPLEFT", UIParent, "CENTER", contentX, sectionTop)
                    local headerText = headerFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
                    headerText:SetPoint("BOTTOMLEFT", headerFrame, "TOPLEFT", 0, 12)
                    headerText:SetText(categoryLabel)
                    AddToUI(headerFrame)

                    local layoutGroup = {
                        header = headerFrame,
                        framesByLayer = {},
                        maxCols = maxCols,
                        spacingX = spacingX,
                        spacingY = spacingY
                    }
                    for index = 1, #layerRanges do
                        layoutGroup.framesByLayer[index] = {}
                    end

                    for _, entry in ipairs(group.visibleItems) do
                        local layerIndex = entry.layer
                        layerItemIndexes[layerIndex] = layerItemIndexes[layerIndex] + 1
                        local itemIndex = layerItemIndexes[layerIndex]
                        local col = (itemIndex - 1) % maxCols
                        local row = math.floor((itemIndex - 1) / maxCols)
                        -- Die endgültige Position wird abhängig vom aktiven Layer
                        -- in CreateLayerTabs gesetzt, damit leere Gruppen aufrücken.
                        local iconFrame = self:CreateProfessionIcon(
                            UIParent, entry.item.data.IDs, contentX + 20, sectionTop - 26, group.settingKey
                        )
                        if iconFrame then
                            layerFrames[layerIndex][#layerFrames[layerIndex] + 1] = iconFrame
                            layoutGroup.framesByLayer[layerIndex][#layoutGroup.framesByLayer[layerIndex] + 1] = iconFrame
                            AddToUI(iconFrame)
                        end
                    end

                    -- Die Gruppe wird für das dynamische Layout gespeichert.
                    -- Unterkategorien ohne Rezepte im aktiven Layer werden ausgeblendet
                    -- und belegen beim Umschalten keinen vertikalen Platz.
                    layoutGroups[#layoutGroups + 1] = layoutGroup
                end

                -- Eine gemeinsame Tab-Leiste steuert Sichtbarkeit und Anordnung
                -- sämtlicher Unterkategorien innerhalb der Profession.
                if anchorGroup then
                    local tabBar = CreateLayerTabs(
                        professionName, { x = windowX + layerOffsetX, y = windowY }, layerFrames, layerCounts,
                        layoutGroups, contentX, sectionTop
                    )
                    AddToUI(tabBar)
                end
            else
                -- Sicherheits-Fallback: Sobald ein sichtbares Rezept der
                -- Profession keinen gültigen required-Wert hat, bleibt die
                -- komplette Profession in der bisherigen Untergruppen-Ansicht.
                for _, group in ipairs(activeGroups) do
                    local maxCols = math.max(1, tonumber(group.subSettings.maxColumns) or 5)
                    local spacingX = self.Config.SpacingX_Prof or 44
                    local spacingY = group.subSettings.customSpacingY or 40
                    local vIdx = 0
                    for _, entry in ipairs(group.visibleItems) do
                        local col = vIdx % maxCols
                        local row = math.floor(vIdx / maxCols)
                        local pX = group.pos.x + (col * spacingX)
                        local pY = group.pos.y - (row * spacingY)
                        local iconFrame = self:CreateProfessionIcon(UIParent, entry.item.data.IDs, pX, pY, group.settingKey)
                        if iconFrame then
                            AddToUI(iconFrame)
                            vIdx = vIdx + 1
                        end
                    end
                end
            end
        end
    end
end

-- Rendering Cat 4 (Fishing)
if ProfessionsHelper.db.profile.catSettings[4].enabled and buckets[4] then
    local fishingGroups = {}
    
    -- 1. Zonen-Modus abfragen
    local currentMode = self:GetCurrentZoneMode()

    -- 2. Gruppieren (Bucket-Items in fishingGroups sortieren)
    for _, item in ipairs(buckets[4]) do
        local gKey = item.groupKey or ProfessionsHelper:GetGlobalBucketKey(item.data, 4)
        fishingGroups[gKey] = fishingGroups[gKey] or {}
        table.insert(fishingGroups[gKey], item)
    end

    -- 3. Rendern der Gruppen
    for gKey, items in pairs(fishingGroups) do
        local pSet = ProfessionsHelper.db.profile.profSubSettings[gKey] or { enabled = true }
        
        -- PRÜFUNG: Auto-Hide Logik (Dungeon/Raid/Delve)
        local isHiddenByMode = (currentMode == "isDungeon" and pSet.hideInDungeon) or (currentMode == "isRaid" and pSet.hideInRaid) or (currentMode == "isDelve" and pSet.hideInDelve)

        -- Nur rendern, wenn aktiviert UND nicht durch Zone versteckt
        if pSet.enabled ~= false and not isHiddenByMode then
            local pos = ProfessionsHelper.db.profile.positions[gKey] or {x = -300, y = 400}
            
            -- Sortierung
            table.sort(items, function(a, b)
                local idA = tonumber(a.data.IDs and a.data.IDs[1]) or 0
                local idB = tonumber(b.data.IDs and b.data.IDs[1]) or 0
                return idA < idB
            end)

            local layerOffsetX, layerOffsetY
            items, layerOffsetX, layerOffsetY = ApplyCategoryLayering(4, gKey, items, pos)
            layerOffsetX = layerOffsetX or 0
            layerOffsetY = layerOffsetY or 0

            -- 4. Grid-Parameter (analog zu Kategorie 3)
            local maxCols = pSet.maxColumns or 5
            local spacingX = self.Config.SpacingX_Fish or 35
            local spacingY = pSet.customSpacingY or self.Config.RowHeight or 40
            local vIdx = 0

            for _, item in ipairs(items) do
                if ProfessionsHelper.db.profile.itemFilters[item.name] ~= false then
                    -- GRID-BERECHNUNG
                    local col = vIdx % maxCols
                    local row = math.floor(vIdx / maxCols)
                    
                    local fX = pos.x + layerOffsetX + (col * spacingX)
                    local fY = pos.y + layerOffsetY - (row * spacingY)
                    
                    -- Frame erstellen
                    local iconFrame = self:CreateFishingIcon(UIParent, item.data.IDs, fX, fY, gKey)
                    if iconFrame then 
                        if iconFrame.UpdateManually then iconFrame:UpdateManually() end
                        AddToUI(iconFrame) 
                        vIdx = vIdx + 1
                    end
                end
            end
        end
    end
end

-- Rendering Cat 5 (Skills)
if ProfessionsHelper.db.profile.catSettings[5].enabled then
    local skillGroups = {}
    
    -- 1. Zonen-Modus abfragen
    local currentMode = self:GetCurrentZoneMode()

    -- 2. Gruppieren
    if buckets[5] then
        for _, item in ipairs(buckets[5]) do
            local gKey = item.groupKey or ProfessionsHelper:GetGlobalBucketKey(item.data, 5)
            skillGroups[gKey] = skillGroups[gKey] or {}
            table.insert(skillGroups[gKey], item)
        end
    end

    -- 3. Rendern der Gruppen
    for gKey, items in pairs(skillGroups) do
        local pSet = ProfessionsHelper.db.profile.profSubSettings[gKey] or { enabled = true }
        
        -- PRÜFUNG: Auto-Hide Logik (Dungeon/Raid/Delve)
        local isHiddenByMode = (currentMode == "isDungeon" and pSet.hideInDungeon) or (currentMode == "isRaid" and pSet.hideInRaid) or (currentMode == "isDelve" and pSet.hideInDelve)

        -- Nur rendern, wenn aktiviert UND nicht durch Zone versteckt
        if pSet.enabled ~= false and not isHiddenByMode then
            local pos = ProfessionsHelper.db.profile.positions[gKey] or {x = 0, y = -100}
            local visibleIdx = 0 -- HIER: Wichtig, damit die Rechnung (visibleIdx * spacing) funktioniert!
            
            -- Sortierung (Prio)
            table.sort(items, function(a, b)
                local prioA = (ProfessionsHelper.db.profile.itemSortOrder and ProfessionsHelper.db.profile.itemSortOrder[a.name]) or 99
                local prioB = (ProfessionsHelper.db.profile.itemSortOrder and ProfessionsHelper.db.profile.itemSortOrder[b.name]) or 99
                if prioA ~= prioB then return prioA < prioB end
                return a.name < b.name
            end)

            -- 4. Icons der Gruppe zeichnen
            for _, item in ipairs(items) do
                if ProfessionsHelper.db.profile.itemFilters[item.name] ~= false then
                    local spellID = item.data.spellID
                    if spellID then
                        -- Spacing nutzen
                        local offset = visibleIdx * (self.Config.SpacingX_Skill or 45)
                        local iX = pos.x + offset
                        local iY = pos.y
                        
                        -- Frame erstellen
                        local iconFrame = self:CreateSkillIcon(UIParent, spellID, iX, iY, gKey)
                        if iconFrame then
                            if iconFrame.UpdateManually then iconFrame:UpdateManually() end
                            AddToUI(iconFrame)
                        end
                        visibleIdx = visibleIdx + 1
                    end
                end
            end
        end
    end
end
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:SetScript("OnEvent", function() Visuals:Init() end)
ProfessionsHelper:RegisterModule("Visuals", Visuals)
