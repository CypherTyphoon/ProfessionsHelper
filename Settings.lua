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
            -- 2. DESIGN: SAMMEL-BALKEN (Kat 1)
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
            -- 3. MATERIAL-FILTER (Kat 2)
            -------------------------------------------------------------------
            matFilters = {
                name = "Material-Icons Filter (Kat 2)",
                type = "group", order = 3, childGroups = "tree",
                args = {}
            },

            -------------------------------------------------------------------
            -- 4. BERUFS-LOGIK (Kat 3) - Icons & Skills
            -------------------------------------------------------------------
            profIcons = {
                name = "Berufs-Icons & Skills (Kat 3)",
                type = "group", order = 4, childGroups = "tree",
                args = {}
            },

            -------------------------------------------------------------------
            -- 5. SPEZIAL-FENSTER (Kat 4+)
            -------------------------------------------------------------------
            categories = {
                type = "group", name = "Spezial-Fenster", 
                order = 5, childGroups = "tab",
                args = {}
            },
        },
    }

    local profLabels = { 
        ["Herbalism"] = "Kräuterkunde", 
        ["Mining"] = "Bergbau", 
        ["Skinning"] = "Kürschnerei", 
        ["Wood"] = "Holzfällen", 
        ["Other"] = "Sonstiges",
        ["Fishing"] = "Angeln"
    }

    -------------------------------------------------------------------
    -- HELPER: Dynamische Gruppen (Tabelle mit Prio-Feld)
    -------------------------------------------------------------------
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
                    sortMode = {
                        name = "Sortierung", type = "select", order = 3,
                        values = { ["EXP_ASC"] = "Erweiterung", ["COUNT_DESC"] = "Menge", ["NAME_ASC"] = "Alphabetisch", ["CUSTOM"] = "Prio-Zahl" },
                        set = function(_, val) PH.db.profile.profSubSettings[settingKey] = PH.db.profile.profSubSettings[settingKey] or {}; PH.db.profile.profSubSettings[settingKey].sortMode = val; PH:GetModule("Visuals"):Init() end,
                        get = function() return PH.db.profile.profSubSettings[settingKey] and PH.db.profile.profSubSettings[settingKey].sortMode or "EXP_ASC" end,
                    },
                    headerPos = { name = "Position & Größe", type = "header", order = 10 },
                    posX = { name = "X", type = "range", order = 11, min = -2000, max = 2000, step = 1, set = function(_, val) PH.db.profile.positions[settingKey] = PH.db.profile.positions[settingKey] or {x=0,y=0}; PH.db.profile.positions[settingKey].x = val; PH:GetModule("Visuals"):Init() end, get = function() return PH.db.profile.positions[settingKey] and PH.db.profile.positions[settingKey].x or 0 end },
                    posY = { name = "Y", type = "range", order = 12, min = -2000, max = 2000, step = 1, set = function(_, val) PH.db.profile.positions[settingKey] = PH.db.profile.positions[settingKey] or {x=0,y=0}; PH.db.profile.positions[settingKey].y = val; PH:GetModule("Visuals"):Init() end, get = function() return PH.db.profile.positions[settingKey] and PH.db.profile.positions[settingKey].y or 0 end },
                    headerItems = { name = "Einzel-Filter & Priorität", type = "header", order = 20 },
                }
            }
        end

            for itemName, itemInfo in pairs(bucketData) do
                if itemInfo.displayCategory == catID then
                    local itemExp = itemInfo.expansion or expName or "Unbekannt"
                    local expKey = "group_" .. itemExp:gsub("%s+", "_")

                    if not targetMenu.args[settingKey].args[expKey] then
                        targetMenu.args[settingKey].args[expKey] = {
                            name = "|cff00ff00" .. itemExp .. "|r",
                            type = "group", inline = true, args = {}
                        }
                    end

                    local rowKey = "row_" .. itemName
                    targetMenu.args[settingKey].args[expKey].args[rowKey] = {
                        name = "", type = "group", inline = true, order = 30,
                        args = {
                            enabled = {
                                name = itemName:gsub("_", " "), type = "toggle", order = 1, width = 1.2,
                                set = function(_, val) PH.db.profile.itemFilters[itemName] = val; PH:GetModule("Visuals"):Init() end,
                                get = function() return PH.db.profile.itemFilters[itemName] ~= false end,
                            },
                            sort = {
                                name = "Prio", type = "input", order = 2, width = 0.3,
                                set = function(_, val) 
                                    local num = tonumber(val)
                                    if num then PH.db.profile.itemSortOrder = PH.db.profile.itemSortOrder or {}; PH.db.profile.itemSortOrder[itemName] = num; PH:GetModule("Visuals"):Init() end
                                end,
                                get = function() PH.db.profile.itemSortOrder = PH.db.profile.itemSortOrder or {}; return tostring(PH.db.profile.itemSortOrder[itemName] or 99) end,
                            },
                        }
                    }
                end
            end
    end

    local function BucketHasCatItems(bucketData, catID)
        for _, itemInfo in pairs(bucketData) do
            if type(itemInfo) == "table" and itemInfo.displayCategory == catID then return true end
        end
        return false
    end

    -------------------------------------------------------------------
    -- 1. SCHLEIFE: Haupt-Kategorien (1, 2, 3)
    -------------------------------------------------------------------
    for expName, expData in pairs(ProfessionsHelperData) do
        for bucketName, bucketData in pairs(expData) do
            if bucketName ~= "Config" and type(bucketData) == "table" then
                if BucketHasCatItems(bucketData, 1) then CreateDynamicGroup(options.args.barDesign, 1, bucketName, bucketData, expName) end
                if BucketHasCatItems(bucketData, 2) then CreateDynamicGroup(options.args.matFilters, 2, bucketName, bucketData, expName) end
                if BucketHasCatItems(bucketData, 3) then CreateDynamicGroup(options.args.profIcons, 3, bucketName, bucketData, expName) end
            end
        end
    end

    -------------------------------------------------------------------
    -- 2. SCHLEIFE: Spezial-Fenster (Kat 4+) & Angeln
    -------------------------------------------------------------------
    for id, data in pairs(PH.db.profile.catSettings) do
        if id > 3 then
            local catKey = "cat"..id
            local catName = (id == 4) and "Angeln" or (data.name or "Kategorie "..id)
            
            options.args.categories.args[catKey] = {
                name = catName, type = "group", order = id,
                args = {
                    headerSettings = { name = catName .. " Layout", type = "header", order = 1 },
                    enabled = { name = "Anzeigen", type = "toggle", order = 2, set = function(_, val) PH.db.profile.catSettings[id].enabled = val; PH:GetModule("Visuals"):Init() end, get = function() return PH.db.profile.catSettings[id].enabled end },
                    scale = { name = "Skalierung", type = "range", order = 3, min = 0.5, max = 2.0, step = 0.01, set = function(_, val) PH.db.profile.catSettings[id].scale = val; PH:GetModule("Visuals"):Init() end, get = function() return PH.db.profile.catSettings[id].scale or 1 end },
                    posX = { name = "X", type = "range", order = 4, min = -2000, max = 2000, step = 1, set = function(_, val) PH.db.profile.positions[id] = PH.db.profile.positions[id] or {x=0,y=0}; PH.db.profile.positions[id].x = val; PH:GetModule("Visuals"):Init() end, get = function() return PH.db.profile.positions[id] and PH.db.profile.positions[id].x or 0 end },
                    posY = { name = "Y", type = "range", order = 5, min = -2000, max = 2000, step = 1, set = function(_, val) PH.db.profile.positions[id] = PH.db.profile.positions[id] or {x=0,y=0}; PH.db.profile.positions[id].y = val; PH:GetModule("Visuals"):Init() end, get = function() return PH.db.profile.positions[id] and PH.db.profile.positions[id].y or 0 end },
                    itemHeader = { name = "Einzel-Filter", type = "header", order = 10 },
                }
            }

            -- Spezielle Item-Liste für Angeln (Kat 4)
            if id == 4 then
                for expName, expData in pairs(ProfessionsHelperData) do
                    if expData.Fishing then
                        local expKey = "fishing_" .. expName:gsub("%s+", "_")
                        options.args.categories.args.cat4.args[expKey] = { name = "|cff00ff00"..expName.."|r", type = "group", inline = true, args = {} }
                        for itemName, _ in pairs(expData.Fishing) do
                            options.args.categories.args.cat4.args[expKey].args["row_"..itemName] = {
                                name = "", type = "group", inline = true, args = {
                                    enabled = { name = itemName:gsub("_", " "), type = "toggle", order = 1, width = 1.2, set = function(_, val) PH.db.profile.itemFilters[itemName] = val; PH:GetModule("Visuals"):Init() end, get = function() return PH.db.profile.itemFilters[itemName] ~= false end },
                                    sort = { name = "Prio", type = "input", order = 2, width = 0.3, set = function(_, val) local n = tonumber(val); if n then PH.db.profile.itemSortOrder[itemName] = n; PH:GetModule("Visuals"):Init() end end, get = function() return (PH.db.profile.itemSortOrder[itemName] or 99) end }
                                }
                            }
                        end
                    end
                end
            end
        end
    end

    LibStub("AceConfig-3.0"):RegisterOptionsTable(ADDON_NAME, options)
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(ADDON_NAME, "Professions Helper")
end