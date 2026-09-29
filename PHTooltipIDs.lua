local addonName = ...

-- =============================================================================
-- Abgespeckte ID-Anzeige für ProfessionsHelper
--
-- Zeigt NUR:
--   SpellID
--   ItemID
--   AchievementID
--   AbilityID
--   IconID
--   ExpansionID
--
-- Das ID-Optionsfenster wird separat von den normalen
-- ProfessionsHelper-Einstellungen registriert.
-- =============================================================================


-- ============================================================================
-- API-Kompatibilität
-- ============================================================================

local GetSpellTexture =
    (C_Spell and C_Spell.GetSpellTexture)
    and C_Spell.GetSpellTexture
    or GetSpellTexture

local GetItemIconByID =
    (C_Item and C_Item.GetItemIconByID)
    and C_Item.GetItemIconByID
    or GetItemIconByID

local GetItemInfo =
    (C_Item and C_Item.GetItemInfo)
    and C_Item.GetItemInfo
    or GetItemInfo

local GetItemGem =
    (C_Item and C_Item.GetItemGem)
    and C_Item.GetItemGem
    or GetItemGem

local GetItemSpell =
    (C_Item and C_Item.GetItemSpell)
    and C_Item.GetItemSpell
    or GetItemSpell

local GetRecipeReagentItemLink =
    (C_TradeSkillUI and C_TradeSkillUI.GetRecipeReagentItemLink)
    and C_TradeSkillUI.GetRecipeReagentItemLink
    or GetTradeSkillReagentItemLink

local GetItemLinkByGUID =
    (C_Item and C_Item.GetItemLinkByGUID)
    and C_Item.GetItemLinkByGUID
    or GetItemLinkByGUID


-- ============================================================================
-- NUR diese sechs ID-Typen
-- ============================================================================

local kinds = {
    spell       = "SpellID",
    item        = "ItemID",
    achievement = "AchievementID",
    ability     = "AbilityID",
    icon        = "IconID",
    expansion   = "ExpansionID",
}


-- ============================================================================
-- Tooltip-Datentypen
-- ============================================================================

local kindsByID = {
    [0]  = "item",
    [1]  = "spell",
    [2]  = "unit",
    [3]  = "unit",
    [4]  = "object",
    [5]  = "currency",
    [6]  = "unit",
    [7]  = "spell",
    [8]  = "spell",
    [9]  = "unit",
    [10] = "mount",
    [11] = "spell",
    [12] = "achievement",
    [13] = "spell",
    [14] = "set",
    [15] = "",
    [16] = "",
    [17] = "spell",
    [18] = "spell",
    [19] = "item",
    [20] = "",
    [21] = "",
    [22] = "",
    [23] = "quest",
    [24] = "quest",
    [25] = "macro",
    [26] = "",
}


-- ============================================================================
-- Hilfsfunktionen
-- ============================================================================

local function configKey(key)
    return key .. "Enabled"
end


local function hook(table, fn, cb)
    if table and table[fn] then
        hooksecurefunc(table, fn, cb)
    end
end


local function hookScript(table, fn, cb)
    if table and table:HasScript(fn) then
        table:HookScript(fn, cb)
    end
end


local function getTooltipName(tooltip)
    return tooltip:GetName() or nil
end


local function isSecret(value)
    if not issecretvalue or not issecrettable then
        return false
    end

    return issecretvalue(value) or issecrettable(value)
end


local function isStringOrNumber(value)
    local valueType = type(value)

    return valueType == "string"
        or valueType == "number"
end


-- ============================================================================
-- ID-Ausgabe
-- ============================================================================

local function addLine(tooltip, id, kind)

    -- Alles außer unseren sechs Typen wird verworfen.
    if not kinds[kind] then
        return
    end


    if isSecret(id) then
        return
    end


    if not id
        or id == ""
        or not tooltip
        or not tooltip.GetName
    then
        return
    end


    -- Konfiguration laden
    if not ProfessionsHelperIDConfig then
        ProfessionsHelperIDConfig = {}
    end


    -- Standardwerte
    if type(ProfessionsHelperIDConfig.enabled) ~= "boolean" then
        ProfessionsHelperIDConfig.enabled = true
    end


    for key in pairs(kinds) do
        local setting = configKey(key)

        if type(ProfessionsHelperIDConfig[setting]) ~= "boolean" then
            ProfessionsHelperIDConfig[setting] = true
        end
    end


    -- Hauptschalter
    if not ProfessionsHelperIDConfig.enabled then
        return
    end


    -- Einzelner Typ deaktiviert
    if not ProfessionsHelperIDConfig[configKey(kind)] then
        return
    end


    -- Tooltip-Name sicher ermitteln
    local ok, name =
        pcall(
            getTooltipName,
            tooltip
        )


    if not ok or not name then
        return
    end


    -- Prüfen, ob wir die ID bereits hinzugefügt haben.
    local frame
    local text


    for i = tooltip:NumLines(), 1, -1 do

        frame =
            _G[name .. "TextLeft" .. i]


        if frame then
            text = frame:GetText()
        end


        if isSecret(text) then
            return
        end


        if text
            and string.find(
                text,
                kinds[kind],
                1,
                true
            )
        then
            return
        end
    end


    local multiple =
        type(id) == "table"


    if multiple and #id == 1 then
        id = id[1]
        multiple = false
    end


    local left =
        kinds[kind] .. (multiple and "s" or "")


    local right =
        multiple
        and table.concat(id, ",")
        or id


    tooltip:AddDoubleLine(
        left,
        right,
        nil,
        nil,
        nil,
        WHITE_FONT_COLOR.r,
        WHITE_FONT_COLOR.g,
        WHITE_FONT_COLOR.b
    )


    tooltip:Show()
end


-- ============================================================================
-- ID hinzufügen + abgeleitete IDs
-- ============================================================================

local function add(tooltip, id, kind)

    addLine(
        tooltip,
        id,
        kind
    )


    -- Spell -> IconID
    if kind == "spell"
        and GetSpellTexture
        and isStringOrNumber(id)
    then

        local iconID =
            GetSpellTexture(id)


        if iconID then

            addLine(
                tooltip,
                iconID,
                "icon"
            )
        end
    end


    -- Item -> IconID
    if kind == "item"
        and GetItemIconByID
        and isStringOrNumber(id)
    then

        local iconID =
            GetItemIconByID(id)


        if iconID then

            addLine(
                tooltip,
                iconID,
                "icon"
            )
        end
    end


    -- Item -> SpellID
    if kind == "item"
        and GetItemSpell
        and isStringOrNumber(id)
    then

        local spellID =
            select(
                2,
                GetItemSpell(id)
            )


        if spellID then

            addLine(
                tooltip,
                spellID,
                "spell"
            )
        end
    end


    -- Macro -> SpellID
    --
    -- Der ursprüngliche Hook bleibt erhalten.
    -- "macro" selbst wird aber nicht angezeigt.
    if kind == "macro" then

        if tooltip.GetPrimaryTooltipData then

            local data =
                tooltip:GetPrimaryTooltipData()


            if data
                and data.lines
                and data.lines[1]
                and data.lines[1].tooltipID
            then

                add(
                    tooltip,
                    data.lines[1].tooltipID,
                    "spell"
                )

                return
            end
        end


        if tooltip.GetSpell then

            local spellID =
                select(
                    2,
                    tooltip:GetSpell()
                )


            if spellID then

                add(
                    tooltip,
                    spellID,
                    "spell"
                )

                return
            end
        end


        if GetMacroSpell
            and isStringOrNumber(id)
        then

            local spellID =
                select(
                    3,
                    GetMacroSpell(id)
                )


            if spellID then

                add(
                    tooltip,
                    spellID,
                    "spell"
                )
            end
        end
    end
end


-- ============================================================================
-- Kind-Zuordnung
-- ============================================================================

local function addByKind(tooltip, id, kind)

    if not kind or not id then
        return
    end


    if kind == "spell"
        or kind == "enchant"
        or kind == "trade"
    then

        add(
            tooltip,
            id,
            "spell"
        )

    elseif kinds[kind] then

        add(
            tooltip,
            id,
            kind
        )
    end
end


-- ============================================================================
-- Item-Informationen
-- ============================================================================

local function addItemInfo(tooltip, link)

    if not link then
        return
    end


    local itemString =
        string.match(
            link,
            "item:([%-?%d:]+)"
        )


    if not itemString then
        return
    end


    local bonuses = {}
    local itemSplit = {}


    for v in string.gmatch(
        itemString,
        "(%d*:?)"
    ) do

        if v == ":" then

            itemSplit[#itemSplit + 1] = 0

        else

            itemSplit[#itemSplit + 1] =
                string.gsub(
                    v,
                    ":",
                    ""
                )
        end
    end


    -- Die Bonus-/Gem-Informationen werden
    -- weiterhin korrekt gelesen, aber nicht angezeigt.
    if itemSplit[13] then

        for index = 1, tonumber(itemSplit[13]) do

            bonuses[#bonuses + 1] =
                itemSplit[13 + index]
        end
    end


    local gems = {}


    if GetItemGem then

        for i = 1, 4 do

            local gemLink =
                select(
                    2,
                    GetItemGem(
                        link,
                        i
                    )
                )


            if gemLink then

                local gemDetail =
                    string.match(
                        gemLink,
                        "item[%-?%d:]+"
                    )


                if gemDetail then

                    gems[#gems + 1] =
                        string.match(
                            gemDetail,
                            "item:(%d+):"
                        )
                end


            elseif flags == 256 then

                gems[#gems + 1] = "0"
            end
        end
    end


    local itemId =
        string.match(
            link,
            "item:(%d*)"
        )


    -- Rezept-Reagenzien
    if (itemId == "" or itemId == "0")
        and TradeSkillFrame
        and TradeSkillFrame.RecipeList
        and TradeSkillFrame:IsVisible()
        and GetRecipeReagentItemLink
        and GetMouseFocus
        and GetMouseFocus().reagentIndex
    then

        local selectedRecipe =
            TradeSkillFrame.RecipeList:GetSelectedRecipeID()


        for i = 1, 8 do

            if GetMouseFocus().reagentIndex == i then

                itemId =
                    GetRecipeReagentItemLink(
                        selectedRecipe,
                        i
                    ):match(
                        "item:(%d*)"
                    )
                    or nil

                break
            end
        end
    end


    if itemId then

        -- ItemID
        add(
            tooltip,
            itemId,
            "item"
        )


        -- ExpansionID
        if GetItemInfo then

            local expansionId =
                select(
                    15,
                    GetItemInfo(itemId)
                )


            if expansionId
                and expansionId ~= 254
            then

                add(
                    tooltip,
                    expansionId,
                    "expansion"
                )
            end
        end
    end
end


-- ============================================================================
-- Item Tooltip
-- ============================================================================

local function attachItemTooltip(
    tooltip,
    id
)

    if (
        tooltip == ShoppingTooltip1
        or tooltip == ShoppingTooltip2
    )
        and tooltip.info
        and tooltip.info.tooltipData
        and tooltip.info.tooltipData.guid
        and GetItemLinkByGUID
    then

        local link =
            GetItemLinkByGUID(
                tooltip.info.tooltipData.guid
            )


        if link then

            addItemInfo(
                tooltip,
                link
            )

        else

            add(
                tooltip,
                id,
                "item"
            )
        end


    elseif tooltip.GetItem then

        local link =
            select(
                2,
                tooltip:GetItem()
            )


        if link then

            addItemInfo(
                tooltip,
                link
            )

        else

            add(
                tooltip,
                id,
                "item"
            )
        end


    else

        add(
            tooltip,
            id,
            "item"
        )
    end
end


-- ============================================================================
-- Moderne TooltipDataProcessor API
-- ============================================================================

if TooltipDataProcessor then

    TooltipDataProcessor.AddTooltipPostCall(
        TooltipDataProcessor.AllTypes,
        function(
            tooltip,
            data
        )

            if not data
                or not data.type
            then
                return
            end


            if isSecret(data.type)
                or isSecret(data.guid)
            then
                return
            end


            local kind =
                kindsByID[
                    tonumber(data.type)
                ]


            -- Alles, was nicht zu unseren sechs
            -- IDs gehört, wird ignoriert.
            if not kind then
                return
            end


            -- Item
            if kind == "item"
                and data
                and data.guid
                and GetItemLinkByGUID
            then

                local link =
                    GetItemLinkByGUID(
                        data.guid
                    )


                if link then

                    addItemInfo(
                        tooltip,
                        link
                    )

                else

                    add(
                        tooltip,
                        data.id,
                        kind
                    )
                end


            elseif kind == "item" then

                add(
                    tooltip,
                    data.id,
                    kind
                )


            elseif kind == "spell" then

                add(
                    tooltip,
                    data.id,
                    kind
                )


            elseif kind == "achievement" then

                add(
                    tooltip,
                    data.id,
                    kind
                )
            end
        end
    )
end


-- ============================================================================
-- Action Bar
-- ============================================================================

if GetActionInfo then

    hook(
        GameTooltip,
        "SetAction",
        function(
            tooltip,
            slot
        )

            local kind, id =
                GetActionInfo(slot)


            addByKind(
                tooltip,
                id,
                kind
            )
        end
    )
end


-- ============================================================================
-- Hyperlinks
-- ============================================================================

local function onSetHyperlink(
    tooltip,
    link
)

    local kind, id =
        string.match(
            link,
            "^(%a+):(%d+)"
        )


    addByKind(
        tooltip,
        id,
        kind
    )
end


hook(
    ItemRefTooltip,
    "SetHyperlink",
    onSetHyperlink
)


hook(
    GameTooltip,
    "SetHyperlink",
    onSetHyperlink
)


-- ============================================================================
-- Buffs
-- ============================================================================

if UnitBuff then

    hook(
        GameTooltip,
        "SetUnitBuff",
        function(
            tooltip,
            ...
        )

            local id =
                select(
                    10,
                    UnitBuff(...)
                )


            add(
                tooltip,
                id,
                "spell"
            )
        end
    )
end


-- ============================================================================
-- Debuffs
-- ============================================================================

if UnitDebuff then

    hook(
        GameTooltip,
        "SetUnitDebuff",
        function(
            tooltip,
            ...
        )

            local id =
                select(
                    10,
                    UnitDebuff(...)
                )


            add(
                tooltip,
                id,
                "spell"
            )
        end
    )
end


-- ============================================================================
-- Aura
-- ============================================================================

if UnitAura then

    hook(
        GameTooltip,
        "SetUnitAura",
        function(
            tooltip,
            ...
        )

            local id =
                select(
                    10,
                    UnitAura(...)
                )


            add(
                tooltip,
                id,
                "spell"
            )
        end
    )
end


-- ============================================================================
-- Spell by ID
-- ============================================================================

hook(
    GameTooltip,
    "SetSpellByID",
    function(
        tooltip,
        id
    )

        addByKind(
            tooltip,
            id,
            "spell"
        )
    end
)


-- ============================================================================
-- Spell Links
-- ============================================================================

hook(
    _G,
    "SetItemRef",
    function(link)

        local id =
            tonumber(
                link:match(
                    "spell:(%d+)"
                )
            )


        add(
            ItemRefTooltip,
            id,
            "spell"
        )
    end
)


-- ============================================================================
-- Spell Tooltip Script
-- ============================================================================

hookScript(
    GameTooltip,
    "OnTooltipSetSpell",
    function(tooltip)

        local id =
            select(
                2,
                tooltip:GetSpell()
            )


        add(
            tooltip,
            id,
            "spell"
        )
    end
)


-- ============================================================================
-- Spellbook
-- ============================================================================

if SpellBook_GetSpellBookSlot then

    hook(
        _G,
        "SpellButton_OnEnter",
        function(btn)

            local slot =
                SpellBook_GetSpellBookSlot(
                    btn
                )


            local spellID =
                select(
                    2,
                    GetSpellBookItemInfo(
                        slot,
                        SpellBookFrame.bookType
                    )
                )


            add(
                GameTooltip,
                spellID,
                "spell"
            )
        end
    )
end


-- ============================================================================
-- Recipe Result / Rank
-- ============================================================================

hook(
    GameTooltip,
    "SetRecipeResultItem",
    function(
        tooltip,
        id
    )

        add(
            tooltip,
            id,
            "spell"
        )
    end
)


hook(
    GameTooltip,
    "SetRecipeRankInfo",
    function(
        tooltip,
        id
    )

        add(
            tooltip,
            id,
            "spell"
        )
    end
)


-- ============================================================================
-- Talent
-- ============================================================================

if GetTalentInfoByID then

    hook(
        GameTooltip,
        "SetTalent",
        function(
            tooltip,
            id
        )

            local ok, result =
                pcall(
                    GetTalentInfoByID,
                    id
                )


            if not ok then
                return
            end


            local spellID =
                select(
                    6,
                    result
                )


            add(
                tooltip,
                spellID,
                "spell"
            )
        end
    )
end


-- ============================================================================
-- PvP Talent
-- ============================================================================

if GetPvpTalentInfoByID then

    hook(
        GameTooltip,
        "SetPvpTalent",
        function(
            tooltip,
            id
        )

            local spellID =
                select(
                    6,
                    GetPvpTalentInfoByID(id)
                )


            add(
                tooltip,
                spellID,
                "spell"
            )
        end
    )
end


-- ============================================================================
-- Unit
-- ============================================================================
--
-- Der ursprüngliche Hook bleibt erhalten, aber "unit" wird durch addLine()
-- automatisch verworfen, da "unit" nicht in "kinds" vorhanden ist.
-- ============================================================================

hookScript(
    GameTooltip,
    "OnTooltipSetUnit",
    function(tooltip)

        if C_PetBattles
            and C_PetBattles.IsInBattle
            and C_PetBattles.IsInBattle()
        then
            return
        end


        local unit =
            select(
                2,
                tooltip:GetUnit()
            )


        if unit and UnitGUID then

            local guid =
                UnitGUID(unit)
                or ""


            local id =
                tonumber(
                    guid:match(
                        "-(%d+)-%x+$"
                    ),
                    10
                )


            if id
                and guid:match("%a+")
                    ~= "Player"
            then

                add(
                    GameTooltip,
                    id,
                    "unit"
                )
            end
        end
    end
)


-- ============================================================================
-- Toy
-- ============================================================================

hook(
    GameTooltip,
    "SetToyByItemID",
    function(
        tooltip,
        id
    )

        add(
            tooltip,
            id,
            "item"
        )
    end
)


-- ============================================================================
-- Recipe Reagent
-- ============================================================================

hook(
    GameTooltip,
    "SetRecipeReagentItem",
    function(
        tooltip,
        id
    )

        add(
            tooltip,
            id,
            "item"
        )
    end
)


-- ============================================================================
-- Item Tooltip
-- ============================================================================

hookScript(
    GameTooltip,
    "OnTooltipSetItem",
    function(tooltip)

        attachItemTooltip(
            tooltip,
            nil
        )
    end
)


-- ============================================================================
-- Achievement
-- ============================================================================

local function achievementOnEnter(btn)

    GameTooltip:SetOwner(
        btn,
        "ANCHOR_NONE"
    )


    GameTooltip:SetPoint(
        "TOPLEFT",
        btn,
        "TOPRIGHT",
        0,
        0
    )


    add(
        GameTooltip,
        btn.id,
        "achievement"
    )


    GameTooltip:Show()
end


local function criteriaOnEnter(enterIndex)

    return function(frame)

        if not GetAchievementCriteriaInfo then
            return
        end


        local btn =
            frame:GetParent()
            and frame:GetParent():GetParent()


        if not btn
            or not btn.id
        then
            return
        end


        local achievementId =
            btn.id


        local index =
            frame.___index
            or enterIndex


        if index
            > GetAchievementNumCriteria(
                achievementId
            )
        then
            return
        end


        local criteriaId =
            select(
                10,
                GetAchievementCriteriaInfo(
                    achievementId,
                    index
                )
            )


        if criteriaId then

            if not GameTooltip:IsVisible() then

                GameTooltip:SetOwner(
                    btn:GetParent(),
                    "ANCHOR_NONE"
                )
            end


            GameTooltip:SetPoint(
                "TOPLEFT",
                btn,
                "TOPRIGHT",
                0,
                0
            )


            add(
                GameTooltip,
                achievementId,
                "achievement"
            )


            -- criteria wird bewusst nicht angezeigt
            -- weil es kein erlaubter ID-Typ ist.


            GameTooltip:Show()
        end
    end
end


-- ============================================================================
-- Pet Battle Ability
-- ============================================================================

if C_PetBattles
    and C_PetBattles.GetActivePet
    and C_PetBattles.GetAbilityInfo
then

    hook(
        _G,
        "PetBattleAbilityButton_OnEnter",
        function(btn)

            local petIndex =
                C_PetBattles.GetActivePet(
                    LE_BATTLE_PET_ALLY
                )


            if btn:GetEffectiveAlpha() > 0 then

                local id =
                    select(
                        1,
                        C_PetBattles.GetAbilityInfo(
                            LE_BATTLE_PET_ALLY,
                            petIndex,
                            btn:GetID()
                        )
                    )


                if id then

                    local oldText =
                        PetBattlePrimaryAbilityTooltip
                        .Description
                        :GetText(id)


                    PetBattlePrimaryAbilityTooltip
                        .Description
                        :SetText(
                            oldText
                            .. "\r\r"
                            .. kinds.ability
                            .. "|cffffffff "
                            .. id
                            .. "|r"
                        )
                end
            end
        end
    )
end


-- ============================================================================
-- Pet Battle Aura Ability
-- ============================================================================

if C_PetBattles
    and C_PetBattles.GetAuraInfo
then

    hook(
        _G,
        "PetBattleAura_OnEnter",
        function(frame)

            local parent =
                frame:GetParent()


            local id =
                select(
                    1,
                    C_PetBattles.GetAuraInfo(
                        parent.petOwner,
                        parent.petIndex,
                        frame.auraIndex
                    )
                )


            if id then

                local oldText =
                    PetBattlePrimaryAbilityTooltip
                    .Description
                    :GetText(id)


                PetBattlePrimaryAbilityTooltip
                    .Description
                    :SetText(
                        oldText
                        .. "\r\r"
                        .. kinds.ability
                        .. "|cffffffff "
                        .. id
                        .. "|r"
                    )
            end
        end
    )
end


-- ============================================================================
-- Garrison / Auto Combat Ability
-- ============================================================================

local addonFrame =
    CreateFrame("Frame")


addonFrame:RegisterEvent(
    "ADDON_LOADED"
)


addonFrame:SetScript(
    "OnEvent",
    function(
        _,
        _,
        addon
    )

        if addon == addonName then

            if not ProfessionsHelperIDConfig then
                ProfessionsHelperIDConfig = {}
            end


            local defaults = {
                enabled = true,
                version = 1,
            }


            for key, value in pairs(defaults) do

                if type(
                    ProfessionsHelperIDConfig[key]
                )
                    ~= type(value)
                then

                    ProfessionsHelperIDConfig[key] =
                        value
                end
            end


            for key in pairs(kinds) do

                local setting =
                    configKey(key)


                if type(
                    ProfessionsHelperIDConfig[setting]
                ) ~= "boolean"
                then

                    ProfessionsHelperIDConfig[setting] =
                        true
                end
            end


        elseif addon == "Blizzard_AchievementUI" then

            if AchievementTemplateMixin then

                hook(
                    AchievementTemplateMixin,
                    "OnEnter",
                    achievementOnEnter
                )


                hook(
                    AchievementTemplateMixin,
                    "OnLeave",
                    GameTooltip_Hide
                )


                local hooked = {}


                local getter =
                    function(pool)

                        return function(
                            self,
                            index
                        )

                            if not self
                                or not self[pool]
                            then
                                return
                            end


                            local frame =
                                self[pool][index]


                            if not frame then
                                return
                            end


                            frame.___index =
                                index


                            if not hooked[frame] then

                                hookScript(
                                    frame,
                                    "OnEnter",
                                    criteriaOnEnter(index)
                                )


                                hookScript(
                                    frame,
                                    "OnLeave",
                                    GameTooltip_Hide
                                )


                                hooked[frame] = true
                            end
                        end
                    end


                hook(
                    AchievementTemplateMixin:GetObjectiveFrame(),
                    "GetCriteria",
                    getter("criterias")
                )


                hook(
                    AchievementTemplateMixin:GetObjectiveFrame(),
                    "GetMiniAchievement",
                    getter("miniAchivements")
                )


                hook(
                    AchievementTemplateMixin:GetObjectiveFrame(),
                    "GetMeta",
                    getter("metas")
                )


                hook(
                    AchievementTemplateMixin:GetObjectiveFrame(),
                    "GetProgressBar",
                    getter("progressBars")
                )


            elseif AchievementFrameAchievementsContainer then

                for _,
                    button
                in ipairs(
                    AchievementFrameAchievementsContainer.buttons
                ) do

                    hookScript(
                        button,
                        "OnEnter",
                        achievementOnEnter
                    )


                    hookScript(
                        button,
                        "OnLeave",
                        GameTooltip_Hide
                    )
                end


                local hooked = {}


                hook(
                    _G,
                    "AchievementButton_GetCriteria",
                    function(
                        index,
                        renderOffScreen
                    )

                        local frame =
                            _G[
                                "AchievementFrameCriteria"
                                .. (
                                    renderOffScreen
                                    and "OffScreen"
                                    or ""
                                )
                                .. index
                            ]


                        if frame
                            and not hooked[frame]
                        then

                            hookScript(
                                frame,
                                "OnEnter",
                                criteriaOnEnter(index)
                            )


                            hookScript(
                                frame,
                                "OnLeave",
                                GameTooltip_Hide
                            )


                            hooked[frame] = true
                        end
                    end
                )
            end


        elseif addon == "Blizzard_GarrisonUI" then

            hook(
                _G,
                "AddAutoCombatSpellToTooltip",
                function(
                    tooltip,
                    info
                )

                    if info
                        and info.autoCombatSpellID
                    then

                        add(
                            tooltip,
                            info.autoCombatSpellID,
                            "ability"
                        )
                    end
                end
            )
        end
    end
)


-- ============================================================================
-- Eigenes Optionen-Panel
-- ============================================================================
--
-- Genau wie bei der Claude-Version:
-- Das ID-Panel ist ein separater Punkt in den WoW-Einstellungen.
-- ============================================================================

local panel =
    CreateFrame("Frame")


panel.name =
    addonName .. " (ID Tooltip)"


panel:Hide()


panel:SetScript(
    "OnShow",
    function()

        local function createCheckbox(
            label,
            key
        )

            local checkBox =
                CreateFrame(
                    "CheckButton",
                    addonName
                        .. "IDTipCheck"
                        .. label,
                    panel,
                    "ChatConfigCheckButtonTemplate"
                )


            checkBox:SetChecked(
                ProfessionsHelperIDConfig[key]
            )


            checkBox:HookScript(
                "OnClick",
                function(self)

                    local checked =
                        self:GetChecked()


                    ProfessionsHelperIDConfig[key] =
                        checked
                end
            )


            checkBox.Text:SetText(
                label
            )


            return checkBox
        end


        -- --------------------------------------------------------------------
        -- Titel
        -- --------------------------------------------------------------------

        local title =
            panel:CreateFontString(
                "ARTWORK",
                nil,
                "GameFontNormalLarge"
            )


        title:SetPoint(
            "TOPLEFT",
            16,
            -16
        )


        title:SetText(
            panel.name
        )


        -- --------------------------------------------------------------------
        -- Global Enabled
        -- --------------------------------------------------------------------

        local enabledCheckBox =
            createCheckbox(
                "Enabled",
                "enabled"
            )


        enabledCheckBox:SetPoint(
            "TOPLEFT",
            title,
            "BOTTOMLEFT",
            0,
            -16
        )


        -- --------------------------------------------------------------------
        -- Typen
        -- --------------------------------------------------------------------

        local kindsTitle =
            panel:CreateFontString(
                "ARTWORK",
                nil,
                "GameFontNormal"
            )


        kindsTitle:SetPoint(
            "TOPLEFT",
            enabledCheckBox,
            "BOTTOMLEFT",
            0,
            -16
        )


        kindsTitle:SetText(
            "Types"
        )


        local index = 0
        local rowHeight = 24
        local columnWidth = 150
        local rowNum = 10


        local keys = {}


        for key in pairs(kinds) do
            table.insert(
                keys,
                key
            )
        end


        table.sort(keys)


        for _, key in pairs(keys) do

            local checkBox =
                createCheckbox(
                    kinds[key],
                    configKey(key)
                )


            local columnIndex =
                math.floor(
                    index / rowNum
                )


            local offsetRight =
                columnIndex * columnWidth


            local offsetUp =
                -(index * rowHeight)
                + (
                    rowHeight
                    * rowNum
                    * columnIndex
                )
                - 16


            checkBox:SetPoint(
                "TOPLEFT",
                kindsTitle,
                "BOTTOMLEFT",
                offsetRight,
                offsetUp
            )


            index = index + 1
        end


        -- Nur einmal erzeugen
        panel:SetScript(
            "OnShow",
            nil
        )
    end
)


-- ============================================================================
-- Eigenes Blizzard-Settings-Panel registrieren
-- ============================================================================

local categoryId = nil


if InterfaceOptions_AddCategory then

    InterfaceOptions_AddCategory(
        panel
    )


elseif Settings
    and Settings.RegisterAddOnCategory
    and Settings.RegisterCanvasLayoutCategory
then

    local category =
        Settings.RegisterCanvasLayoutCategory(
            panel,
            panel.name
        )


    categoryId =
        category.ID


    Settings.RegisterAddOnCategory(
        category
    )
end


-- ============================================================================
-- Slash Command
-- ============================================================================

SLASH_PROFESSIONSHELPERID1 =
    "/phid"


SlashCmdList.PROFESSIONSHELPERID =
    function()

        if InterfaceOptionsFrame_OpenToCategory then

            InterfaceOptionsFrame_OpenToCategory(
                panel
            )


            InterfaceOptionsFrame_OpenToCategory(
                panel
            )


        elseif categoryId
            and Settings
            and Settings.OpenToCategory
        then

            Settings.OpenToCategory(
                categoryId
            )
        end
    end

-- ============================================================================
-- Player Location
-- ============================================================================

local function PrintPlayerLocation()
    local mapID = C_Map.GetBestMapForUnit("player")

    if not mapID then
        print("|cff00ff00[ProfessionsHelper]|r Keine Map-ID für den Spieler gefunden.")
        return
    end

    while mapID do
        local mapInfo = C_Map.GetMapInfo(mapID)

        if not mapInfo then
            break
        end

        print(
            "|cff00ff00[ProfessionsHelper]|r",
            mapInfo.name,
            mapID
        )

        mapID = mapInfo.parentMapID
    end
end

SLASH_PHLOCATION1 = "/phlocation"

SlashCmdList["PHLOCATION"] = function()
    PrintPlayerLocation()
end


----------------------------------------------------------------------
-- ProfessionsHelper - Map Export Dev Tool
--
-- /phmapexport
--
-- Trägt die gewünschten übergeordneten MapIDs im Settings-Fenster ein.
-- Die Namen werden automatisch über C_Map.GetMapInfo() ermittelt.
--
-- Beispiel:
--   12 = Kalimdor
--   13 = Eastern Kingdoms
--
-- Die Werte gelten nur für die aktuelle WoW-Sitzung.
----------------------------------------------------------------------

local PHMapExport = {}

----------------------------------------------------------------------
-- Standardwerte
----------------------------------------------------------------------

PHMapExport.targetMapIDs = {
    12,
    13,
}

PHMapExport.maxMapID = 2500

----------------------------------------------------------------------
-- Hilfsfunktion:
-- Name einer MapID auslesen
----------------------------------------------------------------------

local function GetMapName(mapID)
    local info = C_Map.GetMapInfo(mapID)

    if info and info.name and info.name ~= "" then
        return info.name
    end

    return "Unbekannt"
end

----------------------------------------------------------------------
-- Ermittelt, unter welcher Ziel-Map sich eine Map befindet
----------------------------------------------------------------------

local function GetTargetMap(mapID)
    local current = C_Map.GetMapInfo(mapID)

    if not current then
        return nil
    end

    while current do

        for _, targetMapID in ipairs(PHMapExport.targetMapIDs) do
            if current.mapID == targetMapID then
                return targetMapID
            end
        end

        if not current.parentMapID then
            break
        end

        current = C_Map.GetMapInfo(current.parentMapID)
    end

    return nil
end

----------------------------------------------------------------------
-- Export durchführen
----------------------------------------------------------------------

local function RunMapExport()

    local results = {}

    -- Ziel-Maps vorbereiten
    for _, targetMapID in ipairs(PHMapExport.targetMapIDs) do

        local name = GetMapName(targetMapID)

        results[targetMapID] = {
            mapID = targetMapID,
            name = name,
            zones = {},
        }
    end

    ------------------------------------------------------------------
    -- MapIDs durchlaufen
    ------------------------------------------------------------------

    for mapID = 0, PHMapExport.maxMapID do

        local mapInfo = C_Map.GetMapInfo(mapID)

        if mapInfo and mapInfo.mapType == 3 then

            local targetMapID = GetTargetMap(mapID)

            if targetMapID and results[targetMapID] then

                table.insert(results[targetMapID].zones, {
                    mapID = mapID,
                    name = mapInfo.name or "Unbekannt",
                })

            end
        end
    end

    ------------------------------------------------------------------
    -- Nach MapID sortieren
    ------------------------------------------------------------------

    for _, result in pairs(results) do

        table.sort(result.zones, function(a, b)
            return a.mapID < b.mapID
        end)

    end

    ------------------------------------------------------------------
    -- Ausgabe erzeugen
    ------------------------------------------------------------------

    local output = {}

    table.insert(output, "-- ProfessionsHelper Map Export")
    table.insert(output, "--")
    table.insert(output, "-- Automatisch generiert")
    table.insert(output, "")

    for _, targetMapID in ipairs(PHMapExport.targetMapIDs) do

        local result = results[targetMapID]

        if result then

            table.insert(
                output,
                string.format(
                    "-- %s (MapID: %d)",
                    result.name,
                    result.mapID
                )
            )

            table.insert(
                output,
                string.format(
                    "-- %d Zonen",
                    #result.zones
                )
            )

            table.insert(output, "")

            for _, zone in ipairs(result.zones) do

                table.insert(
                    output,
                    string.format(
                        "[%d] = true, -- %s",
                        zone.mapID,
                        zone.name
                    )
                )

            end

            table.insert(output, "")
            table.insert(output, "")
        end
    end

    ------------------------------------------------------------------
    -- Fenster anzeigen
    ------------------------------------------------------------------

    local frame = CreateFrame(
        "Frame",
        "PHMapExportOutputFrame",
        UIParent,
        "BackdropTemplate"
    )

    frame:SetSize(700, 600)
    frame:SetPoint("CENTER")

    frame:SetBackdrop({
        bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
        edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 32,
        insets = {
            left = 11,
            right = 12,
            top = 12,
            bottom = 11,
        },
    })

    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")

    frame:SetScript("OnDragStart", function(self)
        self:StartMoving()
    end)

    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
    end)

    ------------------------------------------------------------------
    -- Titel
    ------------------------------------------------------------------

    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -20)
    title:SetText("ProfessionsHelper - Map Export")

    ------------------------------------------------------------------
    -- Schließen
    ------------------------------------------------------------------

    local closeButton = CreateFrame(
        "Button",
        nil,
        frame,
        "UIPanelCloseButton"
    )

    closeButton:SetPoint("TOPRIGHT", -5, -5)

    ------------------------------------------------------------------
    -- ScrollFrame
    ------------------------------------------------------------------

    local scrollFrame = CreateFrame(
        "ScrollFrame",
        nil,
        frame,
        "UIPanelScrollFrameTemplate"
    )

    scrollFrame:SetPoint("TOPLEFT", 20, -55)
    scrollFrame:SetPoint("BOTTOMRIGHT", -35, 20)

    ------------------------------------------------------------------
    -- EditBox
    ------------------------------------------------------------------

    local editBox = CreateFrame("EditBox", nil, scrollFrame)

    editBox:SetMultiLine(true)
    editBox:SetFontObject(ChatFontNormal)
    editBox:SetAutoFocus(false)
    editBox:SetWidth(620)
    editBox:SetText(table.concat(output, "\n"))

    scrollFrame:SetScrollChild(editBox)

    editBox:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
    end)

    editBox:SetScript("OnMouseDown", function(self)
        self:SetFocus()
    end)

    frame:Show()
end

----------------------------------------------------------------------
-- Settings-Fenster
----------------------------------------------------------------------

local settingsFrame = CreateFrame(
    "Frame",
    "PHMapExportSettingsFrame",
    UIParent,
    "BackdropTemplate"
)

settingsFrame:SetSize(500, 420)
settingsFrame:SetPoint("CENTER")

settingsFrame:SetBackdrop({
    bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
    edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
    tile = true,
    tileSize = 32,
    edgeSize = 32,
    insets = {
        left = 11,
        right = 12,
        top = 12,
        bottom = 11,
    },
})

settingsFrame:SetMovable(true)
settingsFrame:EnableMouse(true)
settingsFrame:RegisterForDrag("LeftButton")

settingsFrame:SetScript("OnDragStart", function(self)
    self:StartMoving()
end)

settingsFrame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
end)

settingsFrame:Hide()

----------------------------------------------------------------------
-- Titel
----------------------------------------------------------------------

local settingsTitle = settingsFrame:CreateFontString(
    nil,
    "OVERLAY",
    "GameFontNormalLarge"
)

settingsTitle:SetPoint("TOP", 0, -20)
settingsTitle:SetText("ProfessionsHelper - Map Export Dev Tool")

----------------------------------------------------------------------
-- Beschreibung
----------------------------------------------------------------------

local description = settingsFrame:CreateFontString(
    nil,
    "OVERLAY",
    "GameFontHighlight"
)

description:SetPoint("TOPLEFT", 25, -55)
description:SetWidth(450)
description:SetJustifyH("LEFT")

description:SetText(
    "Trage die übergeordneten MapIDs ein, deren Zonen exportiert werden sollen.\n" ..
    "Der Name der Map wird automatisch aus WoW ausgelesen."
)

----------------------------------------------------------------------
-- MapID Eingabefelder
----------------------------------------------------------------------

local mapIDBoxes = {}

for i = 1, 5 do

    local label = settingsFrame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormal"
    )

    label:SetPoint(
        "TOPLEFT",
        30,
        -105 - ((i - 1) * 45)
    )

    label:SetText("MapID " .. i .. ":")

    local editBox = CreateFrame(
        "EditBox",
        nil,
        settingsFrame,
        "InputBoxTemplate"
    )

    editBox:SetSize(120, 25)

    editBox:SetPoint(
        "LEFT",
        label,
        "RIGHT",
        15,
        0
    )

    editBox:SetAutoFocus(false)
    editBox:SetNumeric(true)
    editBox:SetMaxLetters(6)

    local defaultValue = PHMapExport.targetMapIDs[i]

    if defaultValue then
        editBox:SetText(tostring(defaultValue))
    else
        editBox:SetText("")
    end

    mapIDBoxes[i] = editBox

    ------------------------------------------------------------------
    -- Name der Map anzeigen
    ------------------------------------------------------------------

    local nameText = settingsFrame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontHighlight"
    )

    nameText:SetPoint(
        "LEFT",
        editBox,
        "RIGHT",
        15,
        0
    )

    nameText:SetWidth(230)
    nameText:SetJustifyH("LEFT")

    if defaultValue then
        nameText:SetText(GetMapName(defaultValue))
    else
        nameText:SetText("")
    end

    editBox.nameText = nameText

    ------------------------------------------------------------------
    -- Namen aktualisieren, wenn MapID verändert wird
    ------------------------------------------------------------------

    editBox:SetScript("OnTextChanged", function(self)

        local value = tonumber(self:GetText())

        if value then
            self.nameText:SetText(GetMapName(value))
        else
            self.nameText:SetText("")
        end

    end)
end

----------------------------------------------------------------------
-- Max MapID
----------------------------------------------------------------------

local maxLabel = settingsFrame:CreateFontString(
    nil,
    "OVERLAY",
    "GameFontNormal"
)

maxLabel:SetPoint(
    "TOPLEFT",
    30,
    -335
)

maxLabel:SetText("Max. MapID:")

local maxEditBox = CreateFrame(
    "EditBox",
    nil,
    settingsFrame,
    "InputBoxTemplate"
)

maxEditBox:SetSize(120, 25)
maxEditBox:SetPoint("LEFT", maxLabel, "RIGHT", 15, 0)
maxEditBox:SetAutoFocus(false)
maxEditBox:SetNumeric(true)
maxEditBox:SetMaxLetters(6)
maxEditBox:SetText(tostring(PHMapExport.maxMapID))

----------------------------------------------------------------------
-- Export Button
----------------------------------------------------------------------

local exportButton = CreateFrame(
    "Button",
    nil,
    settingsFrame,
    "UIPanelButtonTemplate"
)

exportButton:SetSize(180, 30)
exportButton:SetPoint("BOTTOMLEFT", 30, 20)

exportButton:SetText("MapIDs exportieren")

exportButton:SetScript("OnClick", function()

    ------------------------------------------------------------------
    -- MapIDs übernehmen
    ------------------------------------------------------------------

    PHMapExport.targetMapIDs = {}

    for i = 1, #mapIDBoxes do

        local value = tonumber(mapIDBoxes[i]:GetText())

        if value then
            table.insert(
                PHMapExport.targetMapIDs,
                value
            )
        end
    end

    ------------------------------------------------------------------
    -- Max MapID übernehmen
    ------------------------------------------------------------------

    local maxValue = tonumber(maxEditBox:GetText())

    if maxValue then
        PHMapExport.maxMapID = maxValue
    end

    ------------------------------------------------------------------
    -- Export starten
    ------------------------------------------------------------------

    RunMapExport()

end)

----------------------------------------------------------------------
-- Zurücksetzen
----------------------------------------------------------------------

local resetButton = CreateFrame(
    "Button",
    nil,
    settingsFrame,
    "UIPanelButtonTemplate"
)

resetButton:SetSize(150, 30)
resetButton:SetPoint("LEFT", exportButton, "RIGHT", 10, 0)

resetButton:SetText("Zurücksetzen")

resetButton:SetScript("OnClick", function()

    PHMapExport.targetMapIDs = {
        12,
        13,
    }

    PHMapExport.maxMapID = 2500

    for i = 1, #mapIDBoxes do

        local value = PHMapExport.targetMapIDs[i]

        if value then
            mapIDBoxes[i]:SetText(tostring(value))
        else
            mapIDBoxes[i]:SetText("")
        end
    end

    maxEditBox:SetText(
        tostring(PHMapExport.maxMapID)
    )
end)

----------------------------------------------------------------------
-- Schließen
----------------------------------------------------------------------

local closeButton = CreateFrame(
    "Button",
    nil,
    settingsFrame,
    "UIPanelCloseButton"
)

closeButton:SetPoint("TOPRIGHT", -5, -5)

----------------------------------------------------------------------
-- Slash Command
----------------------------------------------------------------------

SLASH_PHMAPEXPORT1 = "/phmapexport"

SlashCmdList["PHMAPEXPORT"] = function()

    if settingsFrame:IsShown() then
        settingsFrame:Hide()
    else
        settingsFrame:Show()
    end

end