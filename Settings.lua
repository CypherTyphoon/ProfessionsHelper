local ADDON_NAME, _ = ...
local PH = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)

function PH:SetupOptions()
    -- 1. Grundgerüst der Optionen
    local options = {
        name = "Professions Helper",
        type = "group",
        childGroups = "tree",
        args = {
            general = {
                type = "group",
                name = "Allgemein",
                order = 1,
                args = {
                    lockFrames = {
                        name = "Alle Frames fixieren",
                        desc = "Deaktiviert das Verschieben der Frames per Maus.",
                        type = "toggle",
                        set = function(info, val) PH.db.profile.locked = val end,
                        get = function(info) return PH.db.profile.locked end,
                        order = 1,
                    },
                },
            },
            categories = {
                type = "group",
                name = "Kategorien & Design",
                order = 2,
                childGroups = "tab",
                args = {}
            },
            matFilters = {
                name = "Material-Icons Filter",
                type = "group",
                order = 3,
                args = {}
            },
            barCustomization = {
                name = "Balken-Individualisierung",
                type = "group",
                order = 4,
                childGroups = "tab",
                args = {}
            },
        },
    }

    -- 2. Dynamische Erstellung der Kategorien (Hauptreiter)
    for id, data in pairs(PH.db.profile.catSettings) do
        local categoryName = data.name
        if not categoryName or categoryName == "" then
            categoryName = (id == 5) and "Berufs-Skills" or "Kategorie " .. id
        end

        options.args.categories.args["cat" .. id] = {
            type = "group",
            name = categoryName,
            order = id,
            args = {
                enabled = {
                    name = "Anzeigen",
                    type = "toggle",
                    order = 1,
                    set = function(info, val) 
                        PH.db.profile.catSettings[id].enabled = val 
                        PH:GetModule("Visuals"):Init() 
                    end,
                    get = function(info) return PH.db.profile.catSettings[id].enabled end,
                },
                scale = {
                    name = "Skalierung",
                    type = "range",
                    order = 2,
                    min = 0.5, max = 2.0, step = 0.01,
                    set = function(info, val) 
                        PH.db.profile.catSettings[id].scale = val 
                        local Visuals = PH:GetModule("Visuals")
                        for _, frame in ipairs(Visuals.ActiveFrames) do
                            if frame.catID == id then frame:SetScale(val) end
                        end
                    end,
                    get = function(info) return PH.db.profile.catSettings[id].scale or 1 end,
                },
                -- Spezifische Einstellung für Angeln (Kat 4)
                textAlign = (id == 4) and {
                    name = "Text Position",
                    type = "select",
                    order = 3,
                    values = { ["LEFT"] = "Links", ["RIGHT"] = "Rechts", ["TOP"] = "Oben", ["BOTTOM"] = "Unten" },
                    get = function() return PH.db.profile.catSettings[4].textAlign or "BOTTOM" end,
                    set = function(_, val) 
                        PH.db.profile.catSettings[4].textAlign = val
                        PH:GetModule("Visuals"):Init() 
                    end,
                } or nil,
                posHeader = (id ~= 2) and { name = "Positionierung", type = "header", order = 100 } or nil,
                posX = (id ~= 2) and {
                    name = "Position X", type = "range", order = 101, min = -2000, max = 2000, step = 1,
                    set = function(info, val) 
                        PH.db.profile.positions[id] = PH.db.profile.positions[id] or {x=0, y=0}
                        PH.db.profile.positions[id].x = val; PH:GetModule("Visuals"):Init() 
                    end,
                    get = function(info) return PH.db.profile.positions[id] and PH.db.profile.positions[id].x or 0 end,
                } or nil,
                posY = (id ~= 2) and {
                    name = "Position Y", type = "range", order = 102, min = -2000, max = 2000, step = 1,
                    set = function(info, val) 
                        PH.db.profile.positions[id] = PH.db.profile.positions[id] or {x=0, y=0}
                        PH.db.profile.positions[id].y = val; PH:GetModule("Visuals"):Init() 
                    end,
                    get = function(info) return PH.db.profile.positions[id] and PH.db.profile.positions[id].y or 0 end,
                } or nil,
            },
        }
    end

    -- 3. Material-Filter (Kat 2 Unterkategorien)
for addonName, addonData in pairs(ProfessionsHelperData) do
    options.args.matFilters.args[addonName] = {
        name = addonName,
        type = "group",
        childGroups = "tree",
        order = (addonName == "The War Within" and 1 or 2),
        args = {}
    }

    for bucketName, bucketData in pairs(addonData) do
        if bucketName ~= "Config" and type(bucketData) == "table" then
            options.args.matFilters.args[addonName].args[bucketName] = {
                name = bucketName,
                type = "group",
                order = 10,
                args = {
                    headerSettings = { name = "Kategorie-Einstellungen", type = "header", order = 1 },
                    enabled = {
                        name = "Ganze Gruppe anzeigen", type = "toggle", order = 2,
                        set = function(_, val) 
                            PH.db.profile.profSubSettings[bucketName] = PH.db.profile.profSubSettings[bucketName] or {enabled = true}
                            PH.db.profile.profSubSettings[bucketName].enabled = val
                            PH:GetModule("Visuals"):Init() 
                        end,
                        get = function() return (PH.db.profile.profSubSettings[bucketName] and PH.db.profile.profSubSettings[bucketName].enabled ~= false) end,
                    },
                    -- NEU: Wachstumsrichtung
                    growthDirection = {
                        name = "Anordnung", type = "select", order = 3,
                        values = { ["LEFT_RIGHT"] = "L -> R", ["RIGHT_LEFT"] = "R -> L", ["TOP_BOTTOM"] = "O -> U", ["BOTTOM_TOP"] = "U -> O" },
                        set = function(_, val) 
                            PH.db.profile.profSubSettings[bucketName] = PH.db.profile.profSubSettings[bucketName] or {}
                            PH.db.profile.profSubSettings[bucketName].growth = val
                            PH:GetModule("Visuals"):Init() 
                        end,
                        get = function() return PH.db.profile.profSubSettings[bucketName] and PH.db.profile.profSubSettings[bucketName].growth or "LEFT_RIGHT" end,
                    },
                    posX = {
                        name = "Position X", type = "range", order = 4, min = -2000, max = 2000, step = 1,
                        set = function(_, val) 
                            PH.db.profile.positions[bucketName] = PH.db.profile.positions[bucketName] or {x=0, y=0}
                            PH.db.profile.positions[bucketName].x = val; PH:GetModule("Visuals"):Init() 
                        end,
                        get = function() return PH.db.profile.positions[bucketName] and PH.db.profile.positions[bucketName].x or 0 end,
                    },
                    posY = {
                        name = "Position Y", type = "range", order = 5, min = -2000, max = 2000, step = 1,
                        set = function(_, val) 
                            PH.db.profile.positions[bucketName] = PH.db.profile.positions[bucketName] or {x=0, y=0}
                            PH.db.profile.positions[bucketName].y = val; PH:GetModule("Visuals"):Init() 
                        end,
                        get = function() return PH.db.profile.positions[bucketName] and PH.db.profile.positions[bucketName].y or 0 end,
                    },
                    -- NEU: Text-Optionen (Ausrichtung & Farbe)
                    headerText = { name = "Text-Design", type = "header", order = 10 },
                    textAlign = {
                        name = "Text Ausrichtung", type = "select", order = 11,
                        values = { ["TOP"] = "Oben", ["BOTTOM"] = "Unten", ["LEFT"] = "Links", ["RIGHT"] = "Rechts" },
                        set = function(_, val) 
                            PH.db.profile.profSubSettings[bucketName] = PH.db.profile.profSubSettings[bucketName] or {}
                            PH.db.profile.profSubSettings[bucketName].textAlign = val
                            PH:GetModule("Visuals"):Init() 
                        end,
                        get = function() return PH.db.profile.profSubSettings[bucketName] and PH.db.profile.profSubSettings[bucketName].textAlign or "BOTTOM" end,
                    },
                    textColor = {
                        name = "Text Farbe", type = "color", order = 12,
                        set = function(_, r, g, b) 
                            PH.db.profile.profSubSettings[bucketName] = PH.db.profile.profSubSettings[bucketName] or {}
                            PH.db.profile.profSubSettings[bucketName].color = {r=r, g=g, b=b}
                            PH:GetModule("Visuals"):Init() 
                        end,
                        get = function() 
                            local c = (PH.db.profile.profSubSettings[bucketName] and PH.db.profile.profSubSettings[bucketName].color) or {r=1, g=1, b=1}
                            return c.r, c.g, c.b
                        end,
                    },
                    headerItems = { name = "Einzelne Items filtern", type = "header", order = 20 },
                }
            }

            for itemName, itemInfo in pairs(bucketData) do
                if itemInfo.displayCategory == 2 then
                    options.args.matFilters.args[addonName].args[bucketName].args[itemName] = {
                        name = itemName:gsub("_", " "), type = "toggle", order = 30,
                        set = function(_, val) 
                            PH.db.profile.itemFilters[itemName] = val
                            PH:GetModule("Visuals"):Init() 
                        end,
                        get = function() 
                            if PH.db.profile.itemFilters[itemName] == nil then return true end
                            return PH.db.profile.itemFilters[itemName]
                        end,
                    }
                end
            end
        end
    end
end

    -- 4. Balken-Individualisierung (Die neuen Profi-Einstellungen)
    local gatheringProfs = {"Mining", "Herbalism", "Skinning", "Inscription", "Tailoring"}
    for _, prof in ipairs(gatheringProfs) do
        options.args.barCustomization.args[prof] = {
            name = prof,
            type = "group",
            args = {
                headerDesign = { name = "Maße & Verhalten", type = "header", order = 1 },
                enabled = {
                    name = "Aktivieren", type = "toggle", order = 2,
                    set = function(_, val) PH.db.profile.barSettings[prof].enabled = val; PH:GetModule("Visuals"):Init() end,
                    get = function() return PH.db.profile.barSettings[prof].enabled end,
                },
                width = {
                    name = "Breite", type = "range", order = 3, min = 5, max = 150, step = 1,
                    set = function(_, val) PH.db.profile.barSettings[prof].width = val; PH:GetModule("Visuals"):Init() end,
                    get = function() return PH.db.profile.barSettings[prof].width or 30 end,
                },
                height = {
                    name = "Höhe", type = "range", order = 4, min = 10, max = 400, step = 1,
                    set = function(_, val) PH.db.profile.barSettings[prof].height = val; PH:GetModule("Visuals"):Init() end,
                    get = function() return PH.db.profile.barSettings[prof].height or 100 end,
                },
                growUp = {
                    name = "Nach oben füllen", type = "toggle", order = 5,
                    set = function(_, val) PH.db.profile.barSettings[prof].growUp = val; PH:GetModule("Visuals"):Init() end,
                    get = function() return PH.db.profile.barSettings[prof].growUp end,
                },

                headerLook = { name = "Optik & Schrift", type = "header", order = 10 },
                barTexture = {
                    name = "Balken-Textur",
                    type = "select", order = 11, dialogControl = "LSM30_Statusbar",
                    values = AceGUIWidgetLSMlists.statusbar,
                    set = function(_, val) PH.db.profile.barSettings[prof].barTexture = val; PH:GetModule("Visuals"):Init() end,
                    get = function() return PH.db.profile.barSettings[prof].barTexture or "Cilo" end,
                },
                fontName = {
                    name = "Schriftart",
                    type = "select", order = 12, dialogControl = "LSM30_Font",
                    values = AceGUIWidgetLSMlists.font,
                    set = function(_, val) PH.db.profile.barSettings[prof].fontName = val; PH:GetModule("Visuals"):Init() end,
                    get = function() return PH.db.profile.barSettings[prof].fontName or "Friz Quadrata TT" end,
                },
                fontSize = {
                    name = "Schriftgröße", type = "range", order = 13, min = 6, max = 30, step = 1,
                    set = function(_, val) PH.db.profile.barSettings[prof].fontSize = val; PH:GetModule("Visuals"):Init() end,
                    get = function() return PH.db.profile.barSettings[prof].fontSize or 10 end,
                },

                headerColors = { name = "Textfarben (Qualität)", type = "header", order = 20 },
                colorQ1 = {
                    name = "Farbe Q1 (Bronze)", type = "color", order = 21,
                    set = function(_, r, g, b) PH.db.profile.barSettings[prof].colorQ1 = {r=r, g=g, b=b} PH:GetModule("Visuals"):Init() end,
                    get = function() 
                        local c = PH.db.profile.barSettings[prof].colorQ1 or {r=1, g=0.5, b=0}
                        return c.r, c.g, c.b 
                    end,
                },
                colorQ2 = {
                    name = "Farbe Q2 (Silber)", type = "color", order = 22,
                    set = function(_, r, g, b) PH.db.profile.barSettings[prof].colorQ2 = {r=r, g=g, b=b} PH:GetModule("Visuals"):Init() end,
                    get = function() 
                        local c = PH.db.profile.barSettings[prof].colorQ2 or {r=0.8, g=0.8, b=0.8}
                        return c.r, c.g, c.b 
                    end,
                },
                colorQ3 = {
                    name = "Farbe Q3 (Gold)", type = "color", order = 23,
                    set = function(_, r, g, b) PH.db.profile.barSettings[prof].colorQ3 = {r=r, g=g, b=b} PH:GetModule("Visuals"):Init() end,
                    get = function() 
                        local c = PH.db.profile.barSettings[prof].colorQ3 or {r=1, g=0.85, b=0}
                        return c.r, c.g, c.b 
                    end,
                },

                headerBG = { name = "Hintergrund", type = "header", order = 30 },
                showBackground = {
                    name = "Hintergrund anzeigen", type = "toggle", order = 31,
                    set = function(_, val) PH.db.profile.barSettings[prof].showBackground = val; PH:GetModule("Visuals"):Init() end,
                    get = function() return PH.db.profile.barSettings[prof].showBackground end,
                },
                backgroundColor = {
                    name = "Hintergrundfarbe", type = "color", hasAlpha = true, order = 32,
                    set = function(_, r, g, b, a) PH.db.profile.barSettings[prof].backgroundColor = {r=r, g=g, b=b, a=a} PH:GetModule("Visuals"):Init() end,
                    get = function() 
                        local c = PH.db.profile.barSettings[prof].backgroundColor or {r=0, g=0, b=0, a=0.5}
                        return c.r, c.g, c.b, c.a 
                    end,
                },

                headerPos = { name = "Manuelle Position", type = "header", order = 40 },
                posX = {
                    name = "Position X", type = "range", order = 41, min = -2000, max = 2000, step = 1,
                    set = function(_, val) 
                        PH.db.profile.positions[prof .. "_Bar"] = PH.db.profile.positions[prof .. "_Bar"] or {x=0, y=0}
                        PH.db.profile.positions[prof .. "_Bar"].x = val; PH:GetModule("Visuals"):Init() 
                    end,
                    get = function() return PH.db.profile.positions[prof .. "_Bar"] and PH.db.profile.positions[prof .. "_Bar"].x or 0 end,
                },
                posY = {
                    name = "Position Y", type = "range", order = 42, min = -2000, max = 2000, step = 1,
                    set = function(_, val) 
                        PH.db.profile.positions[prof .. "_Bar"] = PH.db.profile.positions[prof .. "_Bar"] or {x=0, y=0}
                        PH.db.profile.positions[prof .. "_Bar"].y = val; PH:GetModule("Visuals"):Init() 
                    end,
                    get = function() return PH.db.profile.positions[prof .. "_Bar"] and PH.db.profile.positions[prof .. "_Bar"].y or 0 end,
                },
            }
        }
    end

    -- 5. Registrierung
    LibStub("AceConfig-3.0"):RegisterOptionsTable(ADDON_NAME, options)
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(ADDON_NAME, "Professions Helper")
end