local ADDON_NAME, _ = ...
local PH = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)

function PH:SetupOptions()
    local options = {
        name = "Professions Helper",
        type = "group",
        childGroups = "tree",
        args = {
            -- 1. ALLGEMEIN
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
            -- 2. DESIGN: SAMMEL-BALKEN
            barDesign = {
                type = "group", name = "Design: Sammel-Balken", order = 2,
                args = {
                    headerLook = { name = "Optik der Fortschrittsbalken", type = "header", order = 1 },
                    barTexture = {
                        name = "Balken-Textur", type = "select", order = 2, dialogControl = "LSM30_Statusbar",
                        values = AceGUIWidgetLSMlists.statusbar,
                        set = function(_, val) PH.db.global.barTexture = val; PH:GetModule("Visuals"):Init() end,
                        get = function() return PH.db.global.barTexture or "Cilo" end,
                    },
                }
            },
            matFilters = { name = "Material-Icons Filter (Kat 2)", type = "group", order = 3, childGroups = "tree", args = {} },
            profIcons = { name = "Berufs-Icons (Kat 3)", type = "group", order = 4, childGroups = "tree", args = {} },
            fishingMenu = { name = "4. Angeln (Matrix)", type = "group", order = 40, childGroups = "tree", args = {} },
            skillsMenu = { name = "5. Berufs-Skills", type = "group", order = 50, childGroups = "tree", args = {} },
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
                enabled = { name = "Anzeigen", type = "toggle", order = 1, set = function(_, val) PH.db.profile.profSubSettings[settingKey] = PH.db.profile.profSubSettings[settingKey] or {}; PH.db.profile.profSubSettings[settingKey].enabled = val; PH:GetModule("Visuals"):Init() end, get = function() return (PH.db.profile.profSubSettings[settingKey] == nil or PH.db.profile.profSubSettings[settingKey].enabled ~= false) end },
                sortMode = {
                    name = "Sortierung", type = "select", order = 2,
                    values = { ["EXP_DESC"] = "Neu -> Alt", ["EXP_ASC"] = "Alt -> Neu", ["COUNT_DESC"] = "Menge (Viel)", ["COUNT_ASC"] = "Menge (Wenig)", ["NAME_ASC"] = "Alphabetisch", ["CUSTOM"] = "Eigene Prio" },
                    set = function(_, val) PH.db.profile.profSubSettings[settingKey] = PH.db.profile.profSubSettings[settingKey] or {}; PH.db.profile.profSubSettings[settingKey].sortMode = val; PH:GetModule("Visuals"):Init() end,
                    get = function() return PH.db.profile.profSubSettings[settingKey] and PH.db.profile.profSubSettings[settingKey].sortMode or "EXP_ASC" end,
                },
                headerPos = { name = "Position", type = "header", order = 10 },
                posX = { name = "X", type = "range", order = 11, min = -2000, max = 2000, step = 1, set = function(_, val) PH.db.profile.positions[settingKey] = PH.db.profile.positions[settingKey] or {x=0,y=0}; PH.db.profile.positions[settingKey].x = val; PH:GetModule("Visuals"):Init() end, get = function() return PH.db.profile.positions[settingKey] and PH.db.profile.positions[settingKey].x or 0 end },
                posY = { name = "Y", type = "range", order = 12, min = -2000, max = 2000, step = 1, set = function(_, val) PH.db.profile.positions[settingKey] = PH.db.profile.positions[settingKey] or {x=0,y=0}; PH.db.profile.positions[settingKey].y = val; PH:GetModule("Visuals"):Init() end, get = function() return PH.db.profile.positions[settingKey] and PH.db.profile.positions[settingKey].y or 0 end },
                items = { name = "Einzel-Filter & Priorität", type = "group", inline = true, order = 20, args = {} }
            }
        }
        end

        for itemName, itemInfo in pairs(bucketData) do
            if itemInfo.displayCategory == catID then
                local itemExp = itemInfo.expansion or expName or "Unbekannt"
                local expKey = "exp_" .. itemExp:gsub("%s+", "_")

                -- Der "Expansion-Kasten"
                if not targetMenu.args[settingKey].args.items.args[expKey] then
                    targetMenu.args[settingKey].args.items.args[expKey] = {
                        name = "|cff00ff00" .. itemExp .. "|r",
                        type = "group", inline = true, order = (itemExp == "The War Within") and 1 or 50,
                        args = {}
                    }
                end

                -- DER "EXTRA-KASTEN" PRO ITEM (Inline-Untergruppe)
                -- Das sorgt dafür, dass Name und Prio untrennbar zusammenbleiben
                local itemGroupKey = "group_" .. itemName
                targetMenu.args[settingKey].args.items.args[expKey].args[itemGroupKey] = {
                    name = "", -- Kein sichtbarer Name für den Kasten
                    type = "group",
                    inline = true, -- Lässt es flach im Menü erscheinen
                    width = "full", -- Nimmt die ganze Zeile ein
                    args = {
                        check = {
                            name = itemName:gsub("_", " "),
                            type = "toggle", order = 1, width = 1.4,
                            set = function(_, val) PH.db.profile.itemFilters[itemName] = val; PH:GetModule("Visuals"):Init() end,
                            get = function() return PH.db.profile.itemFilters[itemName] ~= false end,
                        },
                        prio = {
                            name = "Prio",
                            type = "input", order = 2, width = 0.4,
                            set = function(_, val) 
                                PH.db.profile.itemSortOrder[itemName] = tonumber(val) or 99
                                PH:GetModule("Visuals"):Init() 
                            end,
                            get = function() return tostring(PH.db.profile.itemSortOrder[itemName] or 99) end,
                        }
                    }
                }
            end
        end
    end

    -- Haupt-Schleife über alle Daten
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