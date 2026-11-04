local ADDON_NAME, _ = ...
local PH = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)

------------------------------------------------------------
-- AKTIVE DATENBANK ÜBER DIE SPIELERPOSITION ERMITTELN
------------------------------------------------------------

local function GetActiveDatabase()
    local mapID = C_Map.GetBestMapForUnit("player")
    if not mapID or not ProfessionsHelperData then
        return nil
    end

    for expName, expData in pairs(ProfessionsHelperData) do
        if type(expData) == "table" and type(expData.Config) == "table" then

            local config = expData.Config

            -- Städte
            if config.CityMapIDs and config.CityMapIDs[mapID] then
                return expName
            end

            -- Gebiete + Parent-Maps
            if config.ParentMapIDs then
                local tempMap = mapID

                while tempMap do
                    if config.ParentMapIDs[tempMap] then
                        return expName
                    end

                    local info = C_Map.GetMapInfo(tempMap)
                    tempMap = info and info.parentMapID

                    if not tempMap or tempMap == 0 then
                        break
                    end
                end
            end
        end
    end

    return nil
end


------------------------------------------------------------
-- DYNAMISCHE SETTINGS AKTUALISIEREN
------------------------------------------------------------

local lastSettingsDatabase = nil
local settingsUpdateTimer = 0
local settingsLocationFrame = CreateFrame("Frame")


------------------------------------------------------------
-- SETUP OPTIONS
------------------------------------------------------------

function PH:SetupOptions()

    local activeDatabase = GetActiveDatabase()

    --------------------------------------------------------
    -- OPTIONS
    --------------------------------------------------------

    local options = {
        name = "Professions Helper",
        type = "group",
        childGroups = "tree",

        args = {

            ------------------------------------------------
            -- 1. ALLGEMEIN
            ------------------------------------------------

            general = {
                type = "group",
                name = "Allgemein",
                order = 1,

                args = {

                    lockFrames = {
                        name = "Alle Frames fixieren",
                        type = "toggle",
                        order = 1,

                        set = function(_, val)
                            PH.db.profile.locked = val
                        end,

                        get = function()
                            return PH.db.profile.locked
                        end,
                    },

                    -- Bestandszählung: globale Optionen für die Item-Zählung
                    itemCount = {
                        name = "Bestandszählung",
                        type = "group",
                        order = 2,
                        args = {
                            description = {
                                name = "Lege fest, welche zusätzlichen Lagerorte und Gegenstandsarten bei der Bestandszählung berücksichtigt werden. Die Taschen des Charakters werden immer mitgezählt.",
                                type = "description",
                                order = 1,
                                width = "full",
                            },

                            includeBank = {
                                name = "Character Bank",
                                desc = "Bestände in der persönlichen Bank berücksichtigen.",
                                type = "toggle",
                                order = 2,
                                get = function()
                                    local settings = PH.db.profile.itemCountSettings or {}
                                    return settings.includeBank ~= false
                                end,
                                set = function(_, value)
                                    PH.db.profile.itemCountSettings = PH.db.profile.itemCountSettings or {}
                                    PH.db.profile.itemCountSettings.includeBank = value
                                    PH:GetModule("Visuals"):Init()
                                end,
                            },

                            includeUses = {
                                name = "Uses",
                                desc = "Gegenstände mit begrenzter Anzahl von Anwendungen berücksichtigen.",
                                type = "toggle",
                                order = 3,
                                get = function()
                                    local settings = PH.db.profile.itemCountSettings or {}
                                    return settings.includeUses ~= false
                                end,
                                set = function(_, value)
                                    PH.db.profile.itemCountSettings = PH.db.profile.itemCountSettings or {}
                                    PH.db.profile.itemCountSettings.includeUses = value
                                    PH:GetModule("Visuals"):Init()
                                end,
                            },

                            includeReagentBank = {
                                name = "Reagent Bank",
                                desc = "Bestände in der Reagenzienbank berücksichtigen.",
                                type = "toggle",
                                order = 4,
                                get = function()
                                    local settings = PH.db.profile.itemCountSettings or {}
                                    return settings.includeReagentBank ~= false
                                end,
                                set = function(_, value)
                                    PH.db.profile.itemCountSettings = PH.db.profile.itemCountSettings or {}
                                    PH.db.profile.itemCountSettings.includeReagentBank = value
                                    PH:GetModule("Visuals"):Init()
                                end,
                            },

                            includeAccountBank = {
                                name = "Warband Bank",
                                desc = "Bestände in der Kriegsmeutenbank berücksichtigen.",
                                type = "toggle",
                                order = 5,
                                get = function()
                                    local settings = PH.db.profile.itemCountSettings or {}
                                    return settings.includeAccountBank ~= false
                                end,
                                set = function(_, value)
                                    PH.db.profile.itemCountSettings = PH.db.profile.itemCountSettings or {}
                                    PH.db.profile.itemCountSettings.includeAccountBank = value
                                    PH:GetModule("Visuals"):Init()
                                end,
                            },
                        },
                    },

                },
            },


            ------------------------------------------------
            -- LAYERING
            ------------------------------------------------
            layering = {
                type = "group",
                name = "Layering",
                order = 2,
                args = {
                    info = { type = "description", name = "Layer gruppieren Items nach ihrem vorhandenen required-Wert. Gruppen mit fehlenden oder ungültigen Werten bleiben in der bisherigen Darstellung.", order = 1, width = "full" },
                    rangeMode = { type = "select", name = "Bereiche", order = 2, width = "full",
                        values = { STANDARD = "Standard", CUSTOM = "Benutzerdefiniert" },
                        get = function() return PH.db.profile.layeringSettings.rangeMode or "STANDARD" end,
                        set = function(_, value) PH.db.profile.layeringSettings.rangeMode = value; PH:GetModule("Visuals"):Init() end },
                    categorySelection = {
                        type = "group", name = "Layering für Kategorien", order = 3,
                        inline = true,
                        args = {
                            category1 = { type = "toggle", name = "Cat 1 – Balken", order = 1, width = "full",
                                get = function() return PH.db.profile.layeringSettings.enabledCategories[1] end,
                                set = function(_, value) PH.db.profile.layeringSettings.enabledCategories[1] = value; PH:GetModule("Visuals"):Init() end },
                            category2 = { type = "toggle", name = "Cat 2 – Material-Icons", order = 2, width = "full",
                                get = function() return PH.db.profile.layeringSettings.enabledCategories[2] end,
                                set = function(_, value) PH.db.profile.layeringSettings.enabledCategories[2] = value; PH:GetModule("Visuals"):Init() end },
                            category3 = { type = "toggle", name = "Cat 3 – Berufs-Icons", order = 3, width = "full",
                                get = function() return PH.db.profile.layeringSettings.enabledCategories[3] ~= false end,
                                set = function(_, value) PH.db.profile.layeringSettings.enabledCategories[3] = value; PH:GetModule("Visuals"):Init() end },
                            category4 = { type = "toggle", name = "Cat 4 – Angeln", order = 4, width = "full",
                                get = function() return PH.db.profile.layeringSettings.enabledCategories[4] end,
                                set = function(_, value) PH.db.profile.layeringSettings.enabledCategories[4] = value; PH:GetModule("Visuals"):Init() end },
                        },
                    },
                    customHeader = { type = "header", name = "Benutzerdefinierte Bereiche", order = 10 },
                },
            },

            ------------------------------------------------
            -- 3. DESIGN: SAMMEL-BALKEN
            ------------------------------------------------

            barDesign = {
                type = "group",
                name = "Ressourcen-Balken",
                order = 3,

                args = {

                    headerLook = {
                        name = "Optik der Fortschrittsbalken",
                        type = "header",
                        order = 1
                    },

                    barTexture = {
                        name = "Balken-Textur",
                        type = "select",
                        order = 2,
                        dialogControl = "LSM30_Statusbar",

                        values = AceGUIWidgetLSMlists.statusbar,

                        set = function(_, val)
                            PH.db.global.barTexture = val
                            PH:GetModule("Visuals"):Init()
                        end,

                        get = function()
                            return PH.db.global.barTexture or "Cilo"
                        end,
                    },

                    font = {
                        name = "Schriftart (Balken)",
                        type = "select",
                        order = 3,
                        dialogControl = "LSM30_Font",

                        values = AceGUIWidgetLSMlists.font,

                        set = function(_, val)
                            PH.db.profile.catSettings[1].font = val
                            PH:GetModule("Visuals"):Init()
                        end,

                        get = function()
                            return PH.db.profile.catSettings[1].font or "Friz Quadrata TT"
                        end,
                    },

                    textColor = {
                        name = "Textfarbe (Name)",
                        type = "color",
                        order = 10,
                        hasAlpha = false,

                        set = function(_, r, g, b)
                            PH.db.profile.catSettings[1].textColor = {
                                r = r,
                                g = g,
                                b = b
                            }

                            PH:GetModule("Visuals"):Init()
                        end,

                        get = function()
                            local c = PH.db.profile.catSettings[1].textColor
                                or {r = 1, g = 1, b = 1}

                            return c.r, c.g, c.b
                        end,
                    },

                    valueColor = {
                        name = "Textfarbe (Gesamtwert)",
                        type = "color",
                        order = 11,
                        hasAlpha = false,

                        set = function(_, r, g, b)
                            PH.db.profile.catSettings[1].valueColor = {
                                r = r,
                                g = g,
                                b = b
                            }

                            PH:GetModule("Visuals"):Init()
                        end,

                        get = function()
                            local c = PH.db.profile.catSettings[1].valueColor
                                or {r = 1, g = 1, b = 1}

                            return c.r, c.g, c.b
                        end,
                    },

                    colorQ1 = {
                        name = "Farbe Qualität 1 (Bronze)",
                        type = "color",
                        order = 12,

                        set = function(_, r, g, b)
                            PH.db.profile.catSettings[1].colorQ1 = {
                                r = r,
                                g = g,
                                b = b
                            }

                            PH:GetModule("Visuals"):Init()
                        end,

                        get = function()
                            local c = PH.db.profile.catSettings[1].colorQ1
                                or {r = 1, g = 0.5, b = 0}

                            return c.r, c.g, c.b
                        end,
                    },

                    colorQ2 = {
                        name = "Farbe Qualität 2 (Silber)",
                        type = "color",
                        order = 13,

                        set = function(_, r, g, b)
                            PH.db.profile.catSettings[1].colorQ2 = {
                                r = r,
                                g = g,
                                b = b
                            }

                            PH:GetModule("Visuals"):Init()
                        end,

                        get = function()
                            local c = PH.db.profile.catSettings[1].colorQ2
                                or {r = 0.8, g = 0.8, b = 0.8}

                            return c.r, c.g, c.b
                        end,
                    },

                    colorQ3 = {
                        name = "Farbe Qualität 3 (Gold)",
                        type = "color",
                        order = 14,

                        set = function(_, r, g, b)
                            PH.db.profile.catSettings[1].colorQ3 = {
                                r = r,
                                g = g,
                                b = b
                            }

                            PH:GetModule("Visuals"):Init()
                        end,

                        get = function()
                            local c = PH.db.profile.catSettings[1].colorQ3
                                or {r = 1, g = 0.85, b = 0}

                            return c.r, c.g, c.b
                        end,
                    },

                    defaultBarColor = {
                        name = "Standard Balkenfarbe",
                        desc = "Wird genutzt, wenn das Item keine eigene Farbe definiert hat.",
                        type = "color",
                        order = 4,
                        hasAlpha = false,

                        set = function(_, r, g, b)
                            PH.db.profile.catSettings[1].defaultBarColor = {
                                r = r,
                                g = g,
                                b = b
                            }

                            PH:GetModule("Visuals"):Init()
                        end,

                        get = function()
                            local c = PH.db.profile.catSettings[1].defaultBarColor
                                or {r = 0.5, g = 0.5, b = 0.5}

                            return c.r, c.g, c.b
                        end,
                    },

                }
            },


            ------------------------------------------------
            -- 3. MATERIAL-ICONS
            ------------------------------------------------

            matFilters = {
                name = "Material-Icons",
                type = "group",
                order = 4,
                childGroups = "tree",

                args = {

                    font = {
                        name = "Schriftart (Icons)",
                        type = "select",
                        order = 1,
                        dialogControl = "LSM30_Font",

                        values = AceGUIWidgetLSMlists.font,

                        set = function(_, val)
                            PH.db.profile.catSettings[2].font = val
                            PH:GetModule("Visuals"):Init()
                        end,

                        get = function()
                            return PH.db.profile.catSettings[2].font or "Friz Quadrata TT"
                        end,
                    },

                }
            },


            ------------------------------------------------
            -- 4. BERUFS-ICONS
            ------------------------------------------------

            profIcons = {
                name = "Berufs-Icons",
                type = "group",
                order = 5,
                childGroups = "tree",

                args = {

                    font = {
                        name = "Schriftart (Berufe)",
                        type = "select",
                        order = 1,
                        dialogControl = "LSM30_Font",

                        values = AceGUIWidgetLSMlists.font,

                        set = function(_, val)
                            PH.db.profile.catSettings[3].font = val
                            PH:GetModule("Visuals"):Init()
                        end,

                        get = function()
                            return PH.db.profile.catSettings[3].font or "Friz Quadrata TT"
                        end,
                    },

                }
            },


            ------------------------------------------------
            -- 5. ANGEL-MATRIX
            ------------------------------------------------

            fishingMenu = {
                name = "Angel-Matrix",
                type = "group",
                order = 6,
                childGroups = "tree",

                args = {

                    font = {
                        name = "Schriftart (Angeln)",
                        type = "select",
                        order = 1,
                        dialogControl = "LSM30_Font",

                        values = AceGUIWidgetLSMlists.font,

                        set = function(_, val)
                            PH.db.profile.catSettings[4].font = val
                            PH:GetModule("Visuals"):Init()
                        end,

                        get = function()
                            return PH.db.profile.catSettings[4].font or "Friz Quadrata TT"
                        end,
                    },

                }
            },


            ------------------------------------------------
            -- 6. BERUFS-SKILLS
            ------------------------------------------------

            skillsMenu = {
                name = "Berufs-Skills",
                type = "group",
                order = 7,
                childGroups = "tree",

                args = {

                    font = {
                        name = "Schriftart (Skills)",
                        type = "select",
                        order = 1,
                        dialogControl = "LSM30_Font",

                        values = AceGUIWidgetLSMlists.font,

                        set = function(_, val)
                            PH.db.profile.catSettings[5].font = val
                            PH:GetModule("Visuals"):Init()
                        end,

                        get = function()
                            return PH.db.profile.catSettings[5].font or "Friz Quadrata TT"
                        end,
                    },

                }
            },

        }
    }


    -- Benutzerdefinierte Ranges als editierbare Zeilen erzeugen.
    local layeringArgs = options.args.layering.args
    for index in ipairs(PH.db.profile.layeringSettings.customRanges) do
        local rangeIndex = index
        local rowOrder = 10 + rangeIndex
        layeringArgs["rangeMin" .. rangeIndex] = {
            type = "input", name = "Layer " .. rangeIndex .. " – Minimum", order = rowOrder,
            disabled = function() return PH.db.profile.layeringSettings.rangeMode ~= "CUSTOM" end,
            get = function() return tostring(PH.db.profile.layeringSettings.customRanges[rangeIndex].min) end,
            set = function(_, value)
                local number = tonumber(value)
                local range = PH.db.profile.layeringSettings.customRanges[rangeIndex]
                local valid = number and number >= 0 and number == math.floor(number) and number <= range.max
                local previous = PH.db.profile.layeringSettings.customRanges[rangeIndex - 1]
                local following = PH.db.profile.layeringSettings.customRanges[rangeIndex + 1]
                if previous and number and previous.max >= number then valid = false end
                if following and following.min <= range.max then valid = false end
                for otherIndex, other in ipairs(PH.db.profile.layeringSettings.customRanges) do
                    if otherIndex ~= rangeIndex and number and number <= other.max and range.max >= other.min then valid = false end
                end
                if valid then
                    range.min = number
                    PH:GetModule("Visuals"):Init()
                end
            end,
        }
        layeringArgs["rangeMax" .. rangeIndex] = {
            type = "input", name = "Maximum", order = rowOrder + 0.1,
            disabled = function() return PH.db.profile.layeringSettings.rangeMode ~= "CUSTOM" end,
            get = function() return tostring(PH.db.profile.layeringSettings.customRanges[rangeIndex].max) end,
            set = function(_, value)
                local number = tonumber(value)
                local range = PH.db.profile.layeringSettings.customRanges[rangeIndex]
                local valid = number and number >= range.min and number == math.floor(number)
                local previous = PH.db.profile.layeringSettings.customRanges[rangeIndex - 1]
                local following = PH.db.profile.layeringSettings.customRanges[rangeIndex + 1]
                if previous and previous.max >= range.min then valid = false end
                if following and number and following.min <= number then valid = false end
                for otherIndex, other in ipairs(PH.db.profile.layeringSettings.customRanges) do
                    if otherIndex ~= rangeIndex and number and range.min <= other.max and number >= other.min then valid = false end
                end
                if valid then
                    range.max = number
                    PH:GetModule("Visuals"):Init()
                end
            end,
        }
    end
    layeringArgs.addRange = {
        type = "execute", name = "Layer hinzufügen", order = 1000,
        disabled = function() return PH.db.profile.layeringSettings.rangeMode ~= "CUSTOM" end,
        func = function()
            local ranges = PH.db.profile.layeringSettings.customRanges
            local last = ranges[#ranges]
            local minValue = (tonumber(last and last.max) or -1) + 1
            table.insert(ranges, { min = minValue, max = minValue + 49 })
            PH:SetupOptions()
            PH:GetModule("Visuals"):Init()
        end,
    }
    layeringArgs.removeRange = {
        type = "execute", name = "Letzten Layer entfernen", order = 1001,
        disabled = function() return PH.db.profile.layeringSettings.rangeMode ~= "CUSTOM" or #PH.db.profile.layeringSettings.customRanges <= 1 end,
        func = function()
            table.remove(PH.db.profile.layeringSettings.customRanges)
            PH:SetupOptions()
            PH:GetModule("Visuals"):Init()
        end,
    }

    --------------------------------------------------------
    -- LABELS
    --------------------------------------------------------

    local profLabels = {
        ["Herbalism"] = "Kräuterkunde",
        ["Mining"] = "Bergbau",
        ["Skinning"] = "Kürschnerei",
        ["Fishing"] = "Angeln"
    }


    --------------------------------------------------------
    -- PHMATRIX-KATEGORIE UND KATEGORIEPRÜFUNG
    --------------------------------------------------------

    -- Gleiche Override-Auflösung wie in Visuals.lua: Der erste vorhandene
    -- Override einer Item-ID gilt für den gesamten Datensatz.
    local function GetItemCategoryOverride(itemInfo)
        local profile = PH.db and PH.db.profile
        local overrides = profile and profile.itemCategoryOverrides
        if not overrides or type(itemInfo) ~= "table" or type(itemInfo.IDs) ~= "table" then
            return nil
        end

        for _, itemID in ipairs(itemInfo.IDs) do
            local saved = overrides[tostring(itemID)]
            if saved ~= nil then
                return saved
            end
        end
        return nil
    end

    -- Entspricht der Kategorieauflösung in Visuals.lua. Matrix-Overrides
    -- steuern die Kategorien 1-3; Kategorien 4/5 behalten ihre Originalzuordnung.
    local function ItemBelongsToCategory(itemInfo, catID)
        if type(itemInfo) ~= "table" then
            return false
        end

        local originalCat = tonumber(itemInfo.displayCategory) or 0
        local override = GetItemCategoryOverride(itemInfo)

        if override ~= nil then
            if catID >= 1 and catID <= 3 then
                return override[catID] == true
            end
            return (catID == 4 or catID == 5) and originalCat == catID
        end

        return originalCat == catID
    end

    local function BucketHasCatItems(bucketData, catID)
        for _, itemInfo in pairs(bucketData) do
            if ItemBelongsToCategory(itemInfo, catID) then
                return true
            end
        end
        return false
    end


    --------------------------------------------------------
    -- DYNAMISCHE GRUPPE
    --------------------------------------------------------

    local function CreateDynamicGroup(
        targetMenu,
        catID,
        bucketName,
        bucketData,
        expName
    )

        if not BucketHasCatItems(bucketData, catID) then
            return
        end


        -- Für den Gruppenschlüssel muss ein Item verwendet werden, das in
        -- dieser effektiven Kategorie liegt (auch wenn die PHMatrix es verschoben hat).
        local firstItem = nil
        for _, itemInfo in pairs(bucketData) do
            if ItemBelongsToCategory(itemInfo, catID) then
                firstItem = itemInfo
                break
            end
        end

        if not firstItem then
            return
        end

        local settingKey = PH:GetGlobalBucketKey(firstItem, catID)

        -- Kernkategorien 1, 2 und 3: Top-Level-Datentabellen wie Hide und Scales
        -- erhalten jeweils einen eigenen Settings- und Darstellungsbereich.
        if catID == 1 or catID == 2 or catID == 3 then
            settingKey = settingKey .. "_" .. tostring(bucketName)
        end

        local groupLabel =
            profLabels[bucketName] or bucketName


        if not targetMenu.args[settingKey] then

            targetMenu.args[settingKey] = {

                name = groupLabel,
                type = "group",

                args = {

                    ------------------------------------------------
                    -- AKTIV
                    ------------------------------------------------

                    enabled = {

                        name = "Anzeigen",
                        type = "toggle",
                        order = 1,

                        set = function(_, val)

                            PH.db.profile.profSubSettings[settingKey] =
                                PH.db.profile.profSubSettings[settingKey] or {}

                            PH.db.profile.profSubSettings[settingKey].enabled =
                                val

                            PH:GetModule("Visuals"):Init()
                        end,

                        get = function()

                            return (
                                PH.db.profile.profSubSettings[settingKey] == nil
                                or
                                PH.db.profile.profSubSettings[settingKey].enabled ~= false
                            )

                        end
                    },


                    ------------------------------------------------
                    -- AUTO-HIDE
                    ------------------------------------------------

                    modeHeader = {
                        name = "Auto-Hide (Instanz)",
                        type = "header",
                        order = 1.1,
                    },


                    hideInDungeon = {

                        name = "Dungeons",
                        desc = "In Instanzen ausblenden",
                        type = "toggle",
                        width = 0.6,
                        order = 1.2,

                        set = function(_, val)

                            PH.db.profile.profSubSettings[settingKey] =
                                PH.db.profile.profSubSettings[settingKey] or {}

                            PH.db.profile.profSubSettings[settingKey].hideInDungeon =
                                val

                            PH:GetModule("Visuals"):Init()
                        end,

                        get = function()

                            return PH.db.profile.profSubSettings[settingKey]
                                and PH.db.profile.profSubSettings[settingKey].hideInDungeon

                        end,
                    },


                    hideInRaid = {

                        name = "Raids",
                        desc = "In Schlachtzügen ausblenden",
                        type = "toggle",
                        width = 0.6,
                        order = 1.3,

                        set = function(_, val)

                            PH.db.profile.profSubSettings[settingKey] =
                                PH.db.profile.profSubSettings[settingKey] or {}

                            PH.db.profile.profSubSettings[settingKey].hideInRaid =
                                val

                            PH:GetModule("Visuals"):Init()
                        end,

                        get = function()

                            return PH.db.profile.profSubSettings[settingKey]
                                and PH.db.profile.profSubSettings[settingKey].hideInRaid

                        end,
                    },


                    hideInDelve = {

                        name = "Delves",
                        desc = "In Tiefen (Delves) ausblenden",
                        type = "toggle",
                        width = 0.6,
                        order = 1.4,

                        set = function(_, val)

                            PH.db.profile.profSubSettings[settingKey] =
                                PH.db.profile.profSubSettings[settingKey] or {}

                            PH.db.profile.profSubSettings[settingKey].hideInDelve =
                                val

                            PH:GetModule("Visuals"):Init()
                        end,

                        get = function()

                            return PH.db.profile.profSubSettings[settingKey]
                                and PH.db.profile.profSubSettings[settingKey].hideInDelve

                        end,
                    },


                    ------------------------------------------------
                    -- BALKEN-WACHSTUM
                    ------------------------------------------------

                    barGrowth = (catID == 1) and {

                        name = "Wuchsrichtung",
                        type = "select",
                        order = 2,

                        values = {
                            ["BOTTOM_TOP"] = "Nach oben",
                            ["TOP_BOTTOM"] = "Nach unten"
                        },

                        set = function(_, val)

                            PH.db.profile.profSubSettings[settingKey] =
                                PH.db.profile.profSubSettings[settingKey] or {}

                            PH.db.profile.profSubSettings[settingKey].barGrowth =
                                val

                            PH:GetModule("Visuals"):Init()
                        end,

                        get = function()

                            return PH.db.profile.profSubSettings[settingKey]
                                and PH.db.profile.profSubSettings[settingKey].barGrowth
                                or "BOTTOM_TOP"

                        end,

                    } or nil,


                    ------------------------------------------------
                    -- SORTIERUNG
                    ------------------------------------------------

                    sortMode = {

                        name = "Sortierung",
                        type = "select",
                        order = 3,

                        values = {
                            ["ID_ASC"] = "ID aufsteigend",
                            ["ID_DESC"] = "ID absteigend",
                            ["COUNT_DESC"] = "Menge (Viel)",
                            ["COUNT_ASC"] = "Menge (Wenig)",
                            ["NAME_ASC"] = "Alphabetisch",
                            ["CUSTOM"] = "Eigene Prio"
                        },

                        set = function(_, val)

                            PH.db.profile.profSubSettings[settingKey] =
                                PH.db.profile.profSubSettings[settingKey] or {}

                            PH.db.profile.profSubSettings[settingKey].sortMode =
                                val

                            PH:GetModule("Visuals"):Init()
                        end,

                        get = function()

                            local savedMode = PH.db.profile.profSubSettings[settingKey]
                                and PH.db.profile.profSubSettings[settingKey].sortMode

                            -- Alte gespeicherte Werte auf die neue ID-Sortierung abbilden.
                            if savedMode == "EXP_ASC" then return "ID_ASC" end
                            if savedMode == "EXP_DESC" then return "ID_DESC" end

                            return savedMode or "ID_ASC"

                        end,
                    },


                    ------------------------------------------------
                    -- POSITION
                    ------------------------------------------------

                    headerPos = {
                        name = "Position",
                        type = "header",
                        order = 10
                    },


                    posX = {

                        name = "X",
                        type = "range",
                        order = 11,

                        min = -2000,
                        max = 2000,
                        step = 1,

                        set = function(_, val)

                            PH.db.profile.positions[settingKey] =
                                PH.db.profile.positions[settingKey]
                                or {x = 0, y = 0}

                            PH.db.profile.positions[settingKey].x = val

                            PH:GetModule("Visuals"):Init()
                        end,

                        get = function()

                            return PH.db.profile.positions[settingKey]
                                and PH.db.profile.positions[settingKey].x
                                or 0

                        end
                    },


                    posY = {

                        name = "Y",
                        type = "range",
                        order = 12,

                        min = -2000,
                        max = 2000,
                        step = 1,

                        set = function(_, val)

                            PH.db.profile.positions[settingKey] =
                                PH.db.profile.positions[settingKey]
                                or {x = 0, y = 0}

                            PH.db.profile.positions[settingKey].y = val

                            PH:GetModule("Visuals"):Init()
                        end,

                        get = function()

                            return PH.db.profile.positions[settingKey]
                                and PH.db.profile.positions[settingKey].y
                                or 0

                        end
                    },


                    ------------------------------------------------
                    -- MAX COLUMNS
                    ------------------------------------------------

                    maxColumns = (catID == 2 or catID == 3 or catID == 4) and {

                        name = "Symbole pro Zeile",

                        desc =
                            "Wie viele Icons nebeneinander angezeigt werden, bevor eine neue Zeile beginnt.",

                        type = "range",
                        order = 13,

                        min = 1,
                        max = 20,
                        step = 1,

                        set = function(_, val)

                            PH.db.profile.profSubSettings[settingKey] =
                                PH.db.profile.profSubSettings[settingKey] or {}

                            PH.db.profile.profSubSettings[settingKey].maxColumns =
                                val

                            PH:GetModule("Visuals"):Init()
                        end,

                        get = function()

                            return PH.db.profile.profSubSettings[settingKey]
                                and PH.db.profile.profSubSettings[settingKey].maxColumns
                                or 5

                        end,

                    } or nil,


                    ------------------------------------------------
                    -- ITEMS
                    ------------------------------------------------

                    headerFilter = {
                        name = "Einzel-Filter & Customizing",
                        type = "header",
                        order = 20
                    },


                    items = {

                        name = "Items verwalten",
                        type = "group",
                        inline = true,
                        order = 21,
                        args = {}

                    }

                }
            }

        end


        --------------------------------------------------------
        -- ITEMS EINTRAGEN
        --------------------------------------------------------

        for itemName, itemInfo in pairs(bucketData) do

            if ItemBelongsToCategory(itemInfo, catID) then

                local itemExp =
                    itemInfo.expansion
                    or expName
                    or "Unbekannt"


                local expKey =
                    "exp_" .. itemExp:gsub("%s+", "_")


                if not targetMenu.args[settingKey].args.items.args[expKey] then

                    targetMenu.args[settingKey].args.items.args[expKey] = {

                        name = "|cff00ff00" .. itemExp .. "|r",

                        type = "group",
                        inline = true,

                        order =
                            (itemExp == "The War Within")
                            and 1
                            or 50,

                        args = {}

                    }

                end


                local itemGroupKey =
                    "group_" .. itemName


                targetMenu.args[settingKey].args.items.args[expKey].args[itemGroupKey] = {

                    name = "",
                    type = "group",
                    inline = true,

                    args = {

                        ------------------------------------------------
                        -- ITEM AKTIV
                        ------------------------------------------------

                        check = {

                            name = itemName:gsub("_", " "),

                            type = "toggle",
                            order = 1,
                            width = 1.0,

                            set = function(_, val)

                                PH.db.profile.itemFilters[itemName] =
                                    val

                                PH:GetModule("Visuals"):Init()
                            end,

                            get = function()

                                return
                                    PH.db.profile.itemFilters[itemName]
                                    ~= false

                            end,

                        },


                        ------------------------------------------------
                        -- ITEM FARBE
                        ------------------------------------------------

                        itemColor = (catID == 1) and {

                            name = "",
                            type = "color",
                            order = 2,
                            width = 0.2,

                            hasAlpha = false,

                            set = function(_, r, g, b)

                                PH.db.profile.customItemColors =
                                    PH.db.profile.customItemColors or {}

                                PH.db.profile.customItemColors[itemName] = {
                                    r = r,
                                    g = g,
                                    b = b
                                }

                                PH:GetModule("Visuals"):Init()
                            end,

                            get = function()

                                local c =
                                    PH.db.profile.customItemColors
                                    and PH.db.profile.customItemColors[itemName]
                                    or itemInfo.color
                                    or {r = 0.5, g = 0.5, b = 0.5}


                                if type(c) == "string" then

                                    local hex =
                                        c:gsub("#", "")

                                    return
                                        tonumber(hex:sub(1, 2), 16) / 255,
                                        tonumber(hex:sub(3, 4), 16) / 255,
                                        tonumber(hex:sub(5, 6), 16) / 255

                                end


                                return c.r, c.g, c.b

                            end,

                        } or nil,


                        ------------------------------------------------
                        -- PRIORITÄT
                        ------------------------------------------------

                        prio = {

                            name = "Prio",

                            type = "input",
                            order = 3,
                            width = 0.3,

                            set = function(_, val)

                                PH.db.profile.itemSortOrder[itemName] =
                                    tonumber(val) or 99

                                PH:GetModule("Visuals"):Init()
                            end,

                            get = function()

                                return tostring(
                                    PH.db.profile.itemSortOrder[itemName]
                                    or 99
                                )

                            end,

                        }

                    }

                }

            end

        end

    end


    --------------------------------------------------------
    -- NUR AKTIVE DATENBANK AUFBAUEN
    --------------------------------------------------------

    if activeDatabase
        and ProfessionsHelperData[activeDatabase] then

        local expData =
            ProfessionsHelperData[activeDatabase]


        for bucketName, bucketData in pairs(expData) do

            if bucketName ~= "Config"
                and type(bucketData) == "table" then

                CreateDynamicGroup(
                    options.args.barDesign,
                    1,
                    bucketName,
                    bucketData,
                    activeDatabase
                )

                CreateDynamicGroup(
                    options.args.matFilters,
                    2,
                    bucketName,
                    bucketData,
                    activeDatabase
                )

                CreateDynamicGroup(
                    options.args.profIcons,
                    3,
                    bucketName,
                    bucketData,
                    activeDatabase
                )

                CreateDynamicGroup(
                    options.args.fishingMenu,
                    4,
                    bucketName,
                    bucketData,
                    activeDatabase
                )

                CreateDynamicGroup(
                    options.args.skillsMenu,
                    5,
                    bucketName,
                    bucketData,
                    activeDatabase
                )

            end

        end

    end


    --------------------------------------------------------
    -- ACE CONFIG REGISTRIEREN
    --------------------------------------------------------

    local AceConfig =
        LibStub("AceConfig-3.0")

    local AceConfigDialog =
        LibStub("AceConfigDialog-3.0")


    AceConfig:RegisterOptionsTable(
        ADDON_NAME,
        options
    )


    --------------------------------------------------------
    -- BLIZZARD OPTIONEN NUR EINMAL ANLEGEN
    --------------------------------------------------------

    if not self.optionsFrame then

        self.optionsFrame =
            AceConfigDialog: AddToBlizOptions(
                ADDON_NAME,
                "Professions Helper"
            )

    end


    --------------------------------------------------------
    -- AKTUELLE DB MERKEN
    --------------------------------------------------------

    lastSettingsDatabase = activeDatabase


    --------------------------------------------------------
    -- ACE CONFIG AKTUALISIEREN
    --------------------------------------------------------

    LibStub("AceConfigRegistry-3.0"):NotifyChange(
        ADDON_NAME
    )

end


------------------------------------------------------------
-- LOCATION-ÜBERWACHUNG
------------------------------------------------------------

settingsLocationFrame:SetScript("OnUpdate", function(self, elapsed)

    settingsUpdateTimer =
        settingsUpdateTimer + elapsed


    -- 0,5 Sekunden
    if settingsUpdateTimer < 0.5 then
        return
    end


    settingsUpdateTimer = 0


    --------------------------------------------------------
    -- AKTUELLE DB ERMITTELN
    --------------------------------------------------------

    local currentDatabase =
        GetActiveDatabase()


    --------------------------------------------------------
    -- NUR BEI EINEM WECHSEL AKTUALISIEREN
    --------------------------------------------------------

    if currentDatabase ~= lastSettingsDatabase then

        PH:SetupOptions()

    end

end)


------------------------------------------------------------
-- ZONEN-EVENTS
------------------------------------------------------------

settingsLocationFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
settingsLocationFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
settingsLocationFrame:RegisterEvent("ZONE_CHANGED")
settingsLocationFrame:RegisterEvent("ZONE_CHANGED_INDOORS")


settingsLocationFrame:SetScript("OnEvent", function()

    local currentDatabase =
        GetActiveDatabase()


    if currentDatabase ~= lastSettingsDatabase then

        PH:SetupOptions()

    end

end)
