local ADDON_NAME, _ = ...
local PH = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)

function PH:SetupOptions()
    local options = {
        name = "Professions Helper",
        type = "group",
        childGroups = "tree",
        args = {
            -------------------------------------------------------------------
            -- 1. ALLGEMEIN
            -------------------------------------------------------------------
            general = {
                type = "group",
                name = "Allgemein",
                order = 1,
                args = {
                    lockFrames = {
                        name = "Alle Frames fixieren",
                        desc = "Deaktiviert das Verschieben der Frames per Maus.",
                        type = "toggle", order = 1,
                        set = function(_, val) PH.db.profile.locked = val end,
                        get = function() return PH.db.profile.locked end,
                    },
                },
            },

            -------------------------------------------------------------------
            -- 2. DESIGN: SAMMEL-BALKEN
            -------------------------------------------------------------------
            barDesign = {
                type = "group",
                name = "Design: Sammel-Balken",
                order = 2,
                args = {
                    headerLook = { name = "Optik der Fortschrittsbalken", type = "header", order = 1 },
                    barTexture = {
                        name = "Balken-Textur", type = "select", order = 2, dialogControl = "LSM30_Statusbar",
                        values = AceGUIWidgetLSMlists.statusbar,
                        set = function(_, val) PH.db.global.barTexture = val; PH:GetModule("Visuals"):Init() end,
                        get = function() return PH.db.global.barTexture or "Cilo" end,
                    },
                    fontName = {
                        name = "Schriftart", type = "select", order = 3, dialogControl = "LSM30_Font",
                        values = AceGUIWidgetLSMlists.font,
                        set = function(_, val) PH.db.global.fontName = val; PH:GetModule("Visuals"):Init() end,
                        get = function() return PH.db.global.fontName or "Friz Quadrata TT" end,
                    },
                }
            },

            -------------------------------------------------------------------
            -- 3. MATERIAL-FILTER (Kategorie 2)
            -------------------------------------------------------------------
            matFilters = {
                name = "Material-Icons Filter (Kat 2)",
                type = "group", order = 3, childGroups = "tree",
                args = {}
            },

            -------------------------------------------------------------------
            -- 4. BERUFS-ICONS FILTER (Kategorie 3) - NEU
            -------------------------------------------------------------------
            profIcons = {
                name = "Berufs-Icons Filter (Kat 3)",
                type = "group", order = 4, childGroups = "tree",
                args = {}
            },

            -------------------------------------------------------------------
            -- 5. SPEZIAL-FENSTER (Skills, Angeln etc.)
            -------------------------------------------------------------------
            categories = {
                type = "group", name = "Spezial-Fenster", 
                order = 5, childGroups = "tab",
                args = {}
            },
        },
    }

    local profLabels = { ["Herbalism"] = "Kräuterkunde", ["Mining"] = "Bergbau", ["Skinning"] = "Kürschnerei", ["Wood"] = "Holzfällen", ["Other"] = "Sonstiges" }

    -- HELPER FUNKTION ZUR GRUPPENERSTELLUNG (Um Code-Duplikate für Kat 2 & 3 zu vermeiden)
        local function CreateDynamicGroup(targetMenu, catID, bucketName, bucketData, expName)
            local _, firstItem = next(bucketData)
            if not firstItem then return end

            local settingKey = ProfessionsHelper:GetGlobalBucketKey(firstItem, catID)
            local profKey = settingKey:gsub("_c%d+", "")
            local groupLabel = profLabels[profKey] or profKey

            if not targetMenu.args[settingKey] then
                    targetMenu.args[settingKey] = {
                        name = groupLabel,
                        type = "group",
                        args = {
                            headerSettings = { name = groupLabel .. " - Layout", type = "header", order = 1 },
                            enabled = {
                                name = "Anzeigen", type = "toggle", order = 2,
                                set = function(_, val) PH.db.profile.profSubSettings[settingKey] = PH.db.profile.profSubSettings[settingKey] or {}; PH.db.profile.profSubSettings[settingKey].enabled = val; PH:GetModule("Visuals"):Init() end,
                                get = function() return (PH.db.profile.profSubSettings[settingKey] and PH.db.profile.profSubSettings[settingKey].enabled ~= false) end,
                            },
                            maxColumns = {
                                name = "Spalten pro Block", hidden = (catID == 1),
                                type = "range", order = 2.5, min = 1, max = 15, step = 1,
                                set = function(_, val) PH.db.profile.profSubSettings[settingKey] = PH.db.profile.profSubSettings[settingKey] or {}; PH.db.profile.profSubSettings[settingKey].maxColumns = val; PH:GetModule("Visuals"):Init() end,
                                get = function() return PH.db.profile.profSubSettings[settingKey] and PH.db.profile.profSubSettings[settingKey].maxColumns or 5 end,
                            },
                            growthDirection = {
                                name = "Wuchsrichtung", hidden = (catID == 1), type = "select", order = 3,
                                values = { ["LEFT_RIGHT"] = "L -> R", ["RIGHT_LEFT"] = "R -> L", ["TOP_BOTTOM"] = "O -> U", ["BOTTOM_TOP"] = "U -> O" },
                                set = function(_, val) PH.db.profile.profSubSettings[settingKey] = PH.db.profile.profSubSettings[settingKey] or {}; PH.db.profile.profSubSettings[settingKey].growth = val; PH:GetModule("Visuals"):Init() end,
                                get = function() return PH.db.profile.profSubSettings[settingKey] and PH.db.profile.profSubSettings[settingKey].growth or "LEFT_RIGHT" end,
                            },
                            headerPos = { name = "Position", type = "header", order = 10 },
                            posX = {
                                name = "X", type = "range", order = 11, min = -2000, max = 2000, step = 1,
                                set = function(_, val) PH.db.profile.positions[settingKey] = PH.db.profile.positions[settingKey] or {x=0,y=0}; PH.db.profile.positions[settingKey].x = val; PH:GetModule("Visuals"):Init() end,
                                get = function() return PH.db.profile.positions[settingKey] and PH.db.profile.positions[settingKey].x or (catID == 1 and -450 or 0) end,
                            },
                            posY = {
                                name = "Y", type = "range", order = 12, min = -2000, max = 2000, step = 1,
                                set = function(_, val) PH.db.profile.positions[settingKey] = PH.db.profile.positions[settingKey] or {x=0,y=0}; PH.db.profile.positions[settingKey].y = val; PH:GetModule("Visuals"):Init() end,
                                get = function() return PH.db.profile.positions[settingKey] and PH.db.profile.positions[settingKey].y or (catID == 1 and 150 or 0) end,
                            },
                            width = {
                                name = "Breite",
                                hidden = (catID ~= 1), -- Nur für Balken anzeigen
                                type = "range", order = 4, min = 5, max = 100, step = 1,
                                set = function(_, val) 
                                    PH.db.profile.profSubSettings[settingKey] = PH.db.profile.profSubSettings[settingKey] or {}
                                    PH.db.profile.profSubSettings[settingKey].width = val
                                    PH:GetModule("Visuals"):Init() 
                                end,
                                get = function() return PH.db.profile.profSubSettings[settingKey] and PH.db.profile.profSubSettings[settingKey].width or 30 end,
                            },
                            height = {
                                name = "Höhe",
                                hidden = (catID ~= 1),
                                type = "range", order = 5, min = 10, max = 300, step = 1,
                                set = function(_, val) 
                                    PH.db.profile.profSubSettings[settingKey] = PH.db.profile.profSubSettings[settingKey] or {}
                                    PH.db.profile.profSubSettings[settingKey].height = val
                                    PH:GetModule("Visuals"):Init() 
                                end,
                                get = function() return PH.db.profile.profSubSettings[settingKey] and PH.db.profile.profSubSettings[settingKey].height or 100 end,
                            },
                            scale = {
                                name = "Skalierung",
                                hidden = (catID ~= 1),
                                type = "range", order = 6, min = 0.5, max = 2.0, step = 0.05,
                                set = function(_, val) 
                                    PH.db.profile.profSubSettings[settingKey] = PH.db.profile.profSubSettings[settingKey] or {}
                                    PH.db.profile.profSubSettings[settingKey].scale = val
                                    PH:GetModule("Visuals"):Init() 
                                end,
                                get = function() return PH.db.profile.profSubSettings[settingKey] and PH.db.profile.profSubSettings[settingKey].scale or 1.0 end,
                            },
                            barGrowth = {
                                name = "Wuchsrichtung",
                                hidden = (catID ~= 1), -- Nur für Kategorie 1 (Balken) einblenden
                                type = "select", order = 7,
                                values = {
                                    ["UP"] = "Balken wächst nach OBEN (Icon unten)",
                                    ["DOWN"] = "Balken wächst nach UNTEN (Icon oben)",
                                },
                                set = function(_, val) 
                                    PH.db.profile.profSubSettings[settingKey] = PH.db.profile.profSubSettings[settingKey] or {}
                                    PH.db.profile.profSubSettings[settingKey].growUp = (val == "UP") 
                                    PH:GetModule("Visuals"):Init() 
                                end,
                                get = function() 
                                    local val = PH.db.profile.profSubSettings[settingKey] and PH.db.profile.profSubSettings[settingKey].growUp
                                    if val == nil then return "UP" end -- Standardwert
                                    return val and "UP" or "DOWN"
                                end,
                            },
                    headerItems = { name = "Einzel-Filter (nach Erweiterung)", type = "header", order = 20 },
                    }
                }
            end

                -- 2. Items hinzufügen (nach Erweiterung gruppiert)
                for itemName, itemInfo in pairs(bucketData) do
                        if itemInfo.displayCategory == catID then
                            -- HIER DIE KORREKTUR:
                            -- Wenn itemInfo.expansion nil ist, nimm den expName aus der Schleife
                            local itemExp = itemInfo.expansion or expName or "Unbekannt"
                            local expKey = "group_" .. itemExp:gsub("%s+", "_")

                            if not targetMenu.args[settingKey].args[expKey] then
                                targetMenu.args[settingKey].args[expKey] = {
                                    name = "|cff00ff00" .. itemExp .. "|r",
                                    type = "group",
                                    inline = true,
                                    args = {}
                                }
                            end

                            targetMenu.args[settingKey].args[expKey].args[itemName] = {
                                name = itemName:gsub("_", " "),
                                type = "toggle",
                                order = 30,
                                set = function(_, val) 
                                    PH.db.profile.itemFilters[itemName] = val
                                    PH:GetModule("Visuals"):Init() 
                                end,
                                get = function() return PH.db.profile.itemFilters[itemName] ~= false end,
                            }
                        end
                    end
                end


-- DYNAMISCHE ERSTELLUNG FÜR KAT 1, 2 UND 3
for expName, expData in pairs(ProfessionsHelperData) do
    for bucketName, bucketData in pairs(expData) do
        if bucketName ~= "Config" and type(bucketData) == "table" then
            -- Hier fügen wir hinten 'expName' hinzu:
            CreateDynamicGroup(options.args.barDesign, 1, bucketName, bucketData, expName)
            CreateDynamicGroup(options.args.matFilters, 2, bucketName, bucketData, expName)
            CreateDynamicGroup(options.args.profIcons, 3, bucketName, bucketData, expName)
        end
    end
end

    -- SPEZIAL-FENSTER (Kat 4+)
    for id, data in pairs(PH.db.profile.catSettings) do
        if id > 3 then
            local catName = data.name or ("Kategorie " .. id)
            options.args.categories.args["cat"..id] = {
                name = catName, type = "group", order = id,
                args = {
                    enabled = { name = "Anzeigen", type = "toggle", order = 1, set = function(_, val) PH.db.profile.catSettings[id].enabled = val; PH:GetModule("Visuals"):Init() end, get = function() return PH.db.profile.catSettings[id].enabled end },
                    scale = { name = "Skalierung", type = "range", order = 2, min = 0.5, max = 2.0, step = 0.01, set = function(_, val) PH.db.profile.catSettings[id].scale = val; PH:GetModule("Visuals"):Init() end, get = function() return PH.db.profile.catSettings[id].scale or 1 end },
                    posX = { name = "X", type = "range", order = 3, min = -2000, max = 2000, step = 1, set = function(_, val) PH.db.profile.positions[id] = PH.db.profile.positions[id] or {x=0,y=0}; PH.db.profile.positions[id].x = val; PH:GetModule("Visuals"):Init() end, get = function() return PH.db.profile.positions[id] and PH.db.profile.positions[id].x or 0 end },
                    posY = { name = "Y", type = "range", order = 4, min = -2000, max = 2000, step = 1, set = function(_, val) PH.db.profile.positions[id] = PH.db.profile.positions[id] or {x=0,y=0}; PH.db.profile.positions[id].y = val; PH:GetModule("Visuals"):Init() end, get = function() return PH.db.profile.positions[id] and PH.db.profile.positions[id].y or 0 end },
                }
            }
        end
    end

    LibStub("AceConfig-3.0"):RegisterOptionsTable(ADDON_NAME, options)
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(ADDON_NAME, "Professions Helper")
end