local ADDON_NAME, _ = ...
local PH = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)

function PH:SetupOptions()
    local options = {
        name = "Professions Helper",
        type = "group",
        childGroups = "tree",
        args = {
            -- 1. ALLGEMEIN (Jetzt ohne globalen Font)
            general = {
                type = "group", name = "Allgemein", order = 1,
                args = {
                    lockFrames = {
                        name = "Alle Frames fixieren",
                        type = "toggle", order = 1,
                        set = function(_, val) PH.db.profile.locked = val end,
                        get = function() return PH.db.profile.locked end,
                    },
                },
            },
            -- 2. DESIGN: SAMMEL-BALKEN (Kat 1)
            barDesign = {
                type = "group", name = "Ressourcen-Balken", order = 2,
                args = {
                    headerLook = { name = "Optik der Fortschrittsbalken", type = "header", order = 1 },
                    barTexture = {
                        name = "Balken-Textur", type = "select", order = 2, dialogControl = "LSM30_Statusbar",
                        values = AceGUIWidgetLSMlists.statusbar,
                        set = function(_, val) PH.db.global.barTexture = val; PH:GetModule("Visuals"):Init() end,
                        get = function() return PH.db.global.barTexture or "Cilo" end,
                    },
                    font = {
                        name = "Schriftart (Balken)",
                        type = "select", order = 3, dialogControl = "LSM30_Font",
                        values = AceGUIWidgetLSMlists.font,
                        set = function(_, val) PH.db.profile.catSettings[1].font = val; PH:GetModule("Visuals"):Init() end,
                        get = function() return PH.db.profile.catSettings[1].font or "Friz Quadrata TT" end,
                    },
                    textColor = {
                        name = "Textfarbe (Name)",
                        type = "color", order = 10, hasAlpha = false,
                        set = function(_, r, g, b) PH.db.profile.catSettings[1].textColor = {r=r, g=g, b=b}; PH:GetModule("Visuals"):Init() end,
                        get = function() 
                            local c = PH.db.profile.catSettings[1].textColor or {r=1, g=1, b=1}
                            return c.r, c.g, c.b
                        end,
                    },
                    valueColor = {
                        name = "Textfarbe (Gesamtwert)",
                        type = "color", order = 11, hasAlpha = false,
                        set = function(_, r, g, b) PH.db.profile.catSettings[1].valueColor = {r=r, g=g, b=b}; PH:GetModule("Visuals"):Init() end,
                        get = function() 
                            local c = PH.db.profile.catSettings[1].valueColor or {r=1, g=1, b=1}
                            return c.r, c.g, c.b
                        end,
                    },
                    -- Ab hier kommen die spezifischen Qualitätsfarben für die Balken-Zahlen
                    colorQ1 = {
                        name = "Farbe Qualität 1 (Bronze)",
                        type = "color", order = 12,
                        set = function(_, r, g, b) PH.db.profile.catSettings[1].colorQ1 = {r=r, g=g, b=b}; PH:GetModule("Visuals"):Init() end,
                        get = function() 
                            local c = PH.db.profile.catSettings[1].colorQ1 or {r=1, g=0.5, b=0}
                            return c.r, c.g, c.b
                        end,
                    },
                    colorQ2 = {
                        name = "Farbe Qualität 2 (Silber)",
                        type = "color", order = 13,
                        set = function(_, r, g, b) PH.db.profile.catSettings[1].colorQ2 = {r=r, g=g, b=b}; PH:GetModule("Visuals"):Init() end,
                        get = function() 
                            local c = PH.db.profile.catSettings[1].colorQ2 or {r=0.8, g=0.8, b=0.8}
                            return c.r, c.g, c.b
                        end,
                    },
                    colorQ3 = {
                        name = "Farbe Qualität 3 (Gold)",
                        type = "color", order = 14,
                        set = function(_, r, g, b) PH.db.profile.catSettings[1].colorQ3 = {r=1, g=0.85, b=0}; PH:GetModule("Visuals"):Init() end,
                        get = function() 
                            local c = PH.db.profile.catSettings[1].colorQ3 or {r=1, g=0.85, b=0}
                            return c.r, c.g, c.b
                        end,
                    },
                    defaultBarColor = {
                        name = "Standard Balkenfarbe",
                        desc = "Wird genutzt, wenn das Item keine eigene Farbe definiert hat.",
                        type = "color", order = 4, hasAlpha = false,
                        set = function(_, r, g, b) 
                            PH.db.profile.catSettings[1].defaultBarColor = {r=r, g=g, b=b}
                            PH:GetModule("Visuals"):Init() 
                        end,
                        get = function() 
                            local c = PH.db.profile.catSettings[1].defaultBarColor or {r=0.5, g=0.5, b=0.5}
                            return c.r, c.g, c.b
                        end,
                    },
                }
            },
            -- 3. MATERIAL-ICONS (Kat 2)
            matFilters = { 
                name = "Material-Icons", type = "group", order = 3, childGroups = "tree", 
                args = {
                    font = {
                        name = "Schriftart (Icons)",
                        type = "select", order = 1, dialogControl = "LSM30_Font",
                        values = AceGUIWidgetLSMlists.font,
                        set = function(_, val) PH.db.profile.catSettings[2].font = val; PH:GetModule("Visuals"):Init() end,
                        get = function() return PH.db.profile.catSettings[2].font or "Friz Quadrata TT" end,
                    },
                } 
            },
            -- 4. BERUFS-ICONS (Kat 3)
            profIcons = { 
                name = "Berufs-Icons", type = "group", order = 4, childGroups = "tree", 
                args = {
                    font = {
                        name = "Schriftart (Berufe)",
                        type = "select", order = 1, dialogControl = "LSM30_Font",
                        values = AceGUIWidgetLSMlists.font,
                        set = function(_, val) PH.db.profile.catSettings[3].font = val; PH:GetModule("Visuals"):Init() end,
                        get = function() return PH.db.profile.catSettings[3].font or "Friz Quadrata TT" end,
                    },
                } 
            },
            -- 5. ANGEL-MATRIX (Kat 4)
            fishingMenu = { 
                name = "Angel-Matrix", type = "group", order = 40, childGroups = "tree", 
                args = {
                    font = {
                        name = "Schriftart (Angeln)",
                        type = "select", order = 1, dialogControl = "LSM30_Font",
                        values = AceGUIWidgetLSMlists.font,
                        set = function(_, val) PH.db.profile.catSettings[4].font = val; PH:GetModule("Visuals"):Init() end,
                        get = function() return PH.db.profile.catSettings[4].font or "Friz Quadrata TT" end,
                    },
                } 
            },
            -- 6. BERUFS-SKILLS (Kat 5)
            skillsMenu = { 
                name = "Berufs-Skills", type = "group", order = 50, childGroups = "tree", 
                args = {
                    font = {
                        name = "Schriftart (Skills)",
                        type = "select", order = 1, dialogControl = "LSM30_Font",
                        values = AceGUIWidgetLSMlists.font,
                        set = function(_, val) PH.db.profile.catSettings[5].font = val; PH:GetModule("Visuals"):Init() end,
                        get = function() return PH.db.profile.catSettings[5].font or "Friz Quadrata TT" end,
                    },
                } 
            },
        }
    }

    local profLabels = { ["Herbalism"] = "Kräuterkunde", ["Mining"] = "Bergbau", ["Skinning"] = "Kürschnerei", ["Fishing"] = "Angeln" }

    local function BucketHasCatItems(bucketData, catID)
        for _, itemInfo in pairs(bucketData) do
            if type(itemInfo) == "table" and itemInfo.displayCategory == catID then return true end
        end
        return false
    end

    -- DYNAMISCHE GRUPPEN ERSTELLEN
    local function CreateDynamicGroup(targetMenu, catID, bucketName, bucketData, expName)
        if not BucketHasCatItems(bucketData, catID) then return end 

        local _, firstItem = next(bucketData)
        local settingKey = PH:GetGlobalBucketKey(firstItem, catID)
        local groupLabel = profLabels[bucketName] or bucketName

        if not targetMenu.args[settingKey] then
            targetMenu.args[settingKey] = {
                name = groupLabel, type = "group",
                args = {
                    enabled = { 
                        name = "Anzeigen", type = "toggle", order = 1, 
                        set = function(_, val) PH.db.profile.profSubSettings[settingKey] = PH.db.profile.profSubSettings[settingKey] or {}; PH.db.profile.profSubSettings[settingKey].enabled = val; PH:GetModule("Visuals"):Init() end, 
                        get = function() return (PH.db.profile.profSubSettings[settingKey] == nil or PH.db.profile.profSubSettings[settingKey].enabled ~= false) end 
                    },

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
                            -- SICHERHEITS-CHECK: Tabelle initialisieren falls nil
                            PH.db.profile.profSubSettings[settingKey] = PH.db.profile.profSubSettings[settingKey] or {}
                            PH.db.profile.profSubSettings[settingKey].hideInDungeon = val
                            PH:GetModule("Visuals"):Init() 
                        end,
                        get = function() 
                            return PH.db.profile.profSubSettings[settingKey] and PH.db.profile.profSubSettings[settingKey].hideInDungeon 
                        end,
                    },
                    hideInRaid = {
                        name = "Raids",
                        desc = "In Schlachtzügen ausblenden",
                        type = "toggle",
                        width = 0.6,
                        order = 1.3,
                        set = function(_, val) 
                            PH.db.profile.profSubSettings[settingKey] = PH.db.profile.profSubSettings[settingKey] or {}
                            PH.db.profile.profSubSettings[settingKey].hideInRaid = val
                            PH:GetModule("Visuals"):Init() 
                        end,
                        get = function() 
                            return PH.db.profile.profSubSettings[settingKey] and PH.db.profile.profSubSettings[settingKey].hideInRaid 
                        end,
                    },
                    hideInDelve = {
                        name = "Delves",
                        desc = "In Tiefen (Delves) ausblenden",
                        type = "toggle",
                        width = 0.6,
                        order = 1.4,
                        set = function(_, val) 
                            PH.db.profile.profSubSettings[settingKey] = PH.db.profile.profSubSettings[settingKey] or {}
                            PH.db.profile.profSubSettings[settingKey].hideInDelve = val
                            PH:GetModule("Visuals"):Init() 
                        end,
                        get = function() 
                            return PH.db.profile.profSubSettings[settingKey] and PH.db.profile.profSubSettings[settingKey].hideInDelve 
                        end,
                    },

                    barGrowth = (catID == 1) and {
                        name = "Wuchsrichtung",
                        type = "select", order = 2,
                        values = { ["BOTTOM_TOP"] = "Nach oben", ["TOP_BOTTOM"] = "Nach unten" },
                        set = function(_, val) PH.db.profile.profSubSettings[settingKey] = PH.db.profile.profSubSettings[settingKey] or {}; PH.db.profile.profSubSettings[settingKey].barGrowth = val; PH:GetModule("Visuals"):Init() end,
                        get = function() return PH.db.profile.profSubSettings[settingKey] and PH.db.profile.profSubSettings[settingKey].barGrowth or "BOTTOM_TOP" end,
                    } or nil,

                    sortMode = {
                        name = "Sortierung", type = "select", order = 3,
                        values = { ["EXP_DESC"] = "Neu -> Alt", ["EXP_ASC"] = "Alt -> Neu", ["COUNT_DESC"] = "Menge (Viel)", ["COUNT_ASC"] = "Menge (Wenig)", ["NAME_ASC"] = "Alphabetisch", ["CUSTOM"] = "Eigene Prio" },
                        set = function(_, val) PH.db.profile.profSubSettings[settingKey] = PH.db.profile.profSubSettings[settingKey] or {}; PH.db.profile.profSubSettings[settingKey].sortMode = val; PH:GetModule("Visuals"):Init() end,
                        get = function() return PH.db.profile.profSubSettings[settingKey] and PH.db.profile.profSubSettings[settingKey].sortMode or "EXP_ASC" end,
                    },
                    
                    headerPos = { name = "Position", type = "header", order = 10 },
                    posX = { name = "X", type = "range", order = 11, min = -2000, max = 2000, step = 1, 
                        set = function(_, val) PH.db.profile.positions[settingKey] = PH.db.profile.positions[settingKey] or {x=0,y=0}; PH.db.profile.positions[settingKey].x = val; PH:GetModule("Visuals"):Init() end, 
                        get = function() return PH.db.profile.positions[settingKey] and PH.db.profile.positions[settingKey].x or 0 end 
                    },
                    posY = { name = "Y", type = "range", order = 12, min = -2000, max = 2000, step = 1, 
                        set = function(_, val) PH.db.profile.positions[settingKey] = PH.db.profile.positions[settingKey] or {x=0,y=0}; PH.db.profile.positions[settingKey].y = val; PH:GetModule("Visuals"):Init() end, 
                        get = function() return PH.db.profile.positions[settingKey] and PH.db.profile.positions[settingKey].y or 0 end 
                    },

                    headerFilter = { name = "Einzel-Filter & Customizing", type = "header", order = 20 },
                    items = { name = "Items verwalten", type = "group", inline = true, order = 21, args = {} }
                }
            }
        end

        for itemName, itemInfo in pairs(bucketData) do
            if itemInfo.displayCategory == catID then
                local itemExp = itemInfo.expansion or expName or "Unbekannt"
                local expKey = "exp_" .. itemExp:gsub("%s+", "_")

                if not targetMenu.args[settingKey].args.items.args[expKey] then
                    targetMenu.args[settingKey].args.items.args[expKey] = {
                        name = "|cff00ff00" .. itemExp .. "|r",
                        type = "group", inline = true, order = (itemExp == "The War Within") and 1 or 50,
                        args = {}
                    }
                end

                local itemGroupKey = "group_" .. itemName
                targetMenu.args[settingKey].args.items.args[expKey].args[itemGroupKey] = {
                    name = "", 
                    type = "group", inline = true,
                    args = {
                        check = {
                            name = itemName:gsub("_", " "),
                            type = "toggle", order = 1, width = 1.0,
                            set = function(_, val) PH.db.profile.itemFilters[itemName] = val; PH:GetModule("Visuals"):Init() end,
                            get = function() return PH.db.profile.itemFilters[itemName] ~= false end,
                        },
                        -- NEU: Farbwähler direkt beim Item (nur für Kategorie 1)
                        itemColor = (catID == 1) and {
                            name = "",
                            type = "color", order = 2, width = 0.2,
                            hasAlpha = false,
                            set = function(_, r, g, b) 
                                PH.db.profile.customItemColors = PH.db.profile.customItemColors or {}
                                PH.db.profile.customItemColors[itemName] = {r=r, g=g, b=b}
                                PH:GetModule("Visuals"):Init() 
                            end,
                            get = function() 
                                local c = PH.db.profile.customItemColors and PH.db.profile.customItemColors[itemName] 
                                        or itemInfo.color -- Fallback auf Data.lua
                                        or {r=0.5, g=0.5, b=0.5}
                                -- Falls itemInfo.color ein Hex-String ist, müsste hier ggf. konvertiert werden
                                if type(c) == "string" then 
                                    local hex = c:gsub("#","")
                                    return tonumber(hex:sub(1,2),16)/255, tonumber(hex:sub(3,4),16)/255, tonumber(hex:sub(5,6),16)/255
                                end
                                return c.r, c.g, c.b
                            end,
                        } or nil,
                        prio = {
                            name = "Prio",
                            type = "input", order = 3, width = 0.3,
                            set = function(_, val) PH.db.profile.itemSortOrder[itemName] = tonumber(val) or 99; PH:GetModule("Visuals"):Init() end,
                            get = function() return tostring(PH.db.profile.itemSortOrder[itemName] or 99) end,
                        }
                    }
                }
            end
        end
    end

    for expName, expData in pairs(ProfessionsHelperData) do
        for bucketName, bucketData in pairs(expData) do
            if bucketName ~= "Config" and type(bucketData) == "table" then
                CreateDynamicGroup(options.args.barDesign, 1, bucketName, bucketData, expName)
                CreateDynamicGroup(options.args.matFilters, 2, bucketName, bucketData, expName)
                CreateDynamicGroup(options.args.profIcons, 3, bucketName, bucketData, expName)
                CreateDynamicGroup(options.args.fishingMenu, 4, bucketName, bucketData, expName)
                CreateDynamicGroup(options.args.skillsMenu, 5, bucketName, bucketData, expName)
            end
        end
    end

    LibStub("AceConfig-3.0"):RegisterOptionsTable(ADDON_NAME, options)
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(ADDON_NAME, "Professions Helper")
end