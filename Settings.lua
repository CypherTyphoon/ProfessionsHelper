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
        },
    }

    -- 2. Dynamische Erstellung der Kategorien
    for id, data in pairs(PH.db.profile.catSettings) do
        -- FIX: Sicherstellen, dass der Name niemals nil ist (verhindert den AceConfig-Fehler)
        local categoryName = data.name
        if not categoryName or categoryName == "" then
            if id == 5 then 
                categoryName = "Berufs-Skills" 
            else 
                categoryName = "Kategorie " .. id 
            end
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
                        -- Live-Skalierung für alle aktiven Frames dieser Kategorie
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
                
                -- BALKEN EINSTELLUNGEN (Nur Kat 1)
                barHeader = (id == 1) and { name = "Balken-Design", type = "header", order = 10 } or nil,
                growUp = (id == 1) and {
                    name = "Von unten nach oben füllen",
                    type = "toggle", order = 11,
                    set = function(_, val) PH.db.profile.catSettings[1].growUp = val; PH:GetModule("Visuals"):Init() end,
                    get = function() return PH.db.profile.catSettings[1].growUp end,
                } or nil,
                width = (id == 1) and {
                    name = "Breite",
                    type = "range", order = 12, min = 5, max = 100, step = 1,
                    set = function(_, val) PH.db.profile.catSettings[1].width = val; PH:GetModule("Visuals"):Init() end,
                    get = function() return PH.db.profile.catSettings[1].width end,
                } or nil,
                height = (id == 1) and {
                    name = "Höhe",
                    type = "range", order = 13, min = 20, max = 300, step = 1,
                    set = function(_, val) PH.db.profile.catSettings[1].height = val; PH:GetModule("Visuals"):Init() end,
                    get = function() return PH.db.profile.catSettings[1].height end,
                } or nil,
                fontSize = (id == 1) and {
                    name = "Schriftgröße",
                    type = "range", order = 14, min = 6, max = 24, step = 1,
                    set = function(_, val) PH.db.profile.catSettings[1].fontSize = val; PH:GetModule("Visuals"):Init() end,
                    get = function() return PH.db.profile.catSettings[1].fontSize end,
                } or nil,
                barTexture = (id == 1) and {
                    name = "Balken-Textur",
                    type = "select", order = 15, dialogControl = "LSM30_Statusbar",
                    values = AceGUIWidgetLSMlists.statusbar,
                    set = function(_, val) PH.db.profile.catSettings[1].barTexture = val; PH:GetModule("Visuals"):Init() end,
                    get = function() return PH.db.profile.catSettings[1].barTexture end,
                } or nil,
                fontName = (id == 1) and {
                    name = "Schriftart",
                    type = "select", order = 16, dialogControl = "LSM30_Font",
                    values = AceGUIWidgetLSMlists.font,
                    set = function(_, val) PH.db.profile.catSettings[1].fontName = val; PH:GetModule("Visuals"):Init() end,
                    get = function() return PH.db.profile.catSettings[1].fontName end,
                } or nil,

                -- QUALITÄTSFARBEN (Nur Kat 1)
                colorsHeader = (id == 1) and { name = "Textfarben (Qualität)", type = "header", order = 30 } or nil,
                colorQ1 = (id == 1) and {
                    name = "Farbe Q1", type = "color", order = 31,
                    set = function(_,r,g,b) PH.db.profile.catSettings[1].colorQ1={r=r,g=g,b=b} PH:GetModule("Visuals"):Init() end,
                    get = function() local c = PH.db.profile.catSettings[1].colorQ1; return c.r, c.g, c.b end,
                } or nil,
                colorQ2 = (id == 1) and {
                    name = "Farbe Q2", type = "color", order = 32,
                    set = function(_,r,g,b) PH.db.profile.catSettings[1].colorQ2={r=r,g=g,b=b} PH:GetModule("Visuals"):Init() end,
                    get = function() local c = PH.db.profile.catSettings[1].colorQ2; return c.r, c.g, c.b end,
                } or nil,
                colorQ3 = (id == 1) and {
                    name = "Farbe Q3", type = "color", order = 33,
                    set = function(_,r,g,b) PH.db.profile.catSettings[1].colorQ3={r=r,g=g,b=b} PH:GetModule("Visuals"):Init() end,
                    get = function() local c = PH.db.profile.catSettings[1].colorQ3; return c.r, c.g, c.b end,
                } or nil,

                -- HINTERGRUND (Nur Kat 1)
                bgHeader = (id == 1) and { name = "Hintergrund", type = "header", order = 40 } or nil,
                showBackground = (id == 1) and {
                    name = "Hintergrund anzeigen", type = "toggle", order = 41,
                    set = function(_, val) PH.db.profile.catSettings[1].showBackground = val; PH:GetModule("Visuals"):Init() end,
                    get = function() return PH.db.profile.catSettings[1].showBackground end,
                } or nil,
                backgroundColor = (id == 1) and {
                    name = "Hintergrundfarbe", type = "color", hasAlpha = true, order = 42,
                    set = function(_,r,g,b,a) PH.db.profile.catSettings[1].backgroundColor={r=r,g=g,b=b,a=a} PH:GetModule("Visuals"):Init() end,
                    get = function() local c = PH.db.profile.catSettings[1].backgroundColor; return c.r, c.g, c.b, c.a end,
                } or nil,

                -- POSITIONIERUNG (ENTFERNT FÜR KAT 2, da diese eigene Profile hat)
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
                group = {
                    name = "Sticky-Gruppe",
                    desc = "Kategorien in der gleichen Gruppe bewegen sich gemeinsam.",
                    type = "select", order = 103,
                    values = { [0] = "Keine", [1] = "Gruppe A", [2] = "Gruppe B", [3] = "Gruppe C" },
                    set = function(info, val) PH.db.profile.catSettings[id].groupID = val end,
                    get = function(info) return PH.db.profile.catSettings[id].groupID or 0 end,
                },
            },
        }
    end

    -- 3. Material-Filter (Kat 2 Unterkategorien)
    local filterProfs = {"Mining", "Herbalism", "Skinning", "Woodcutting", "Fishing", "Cooking", "Tailoring", "Jewelcrafting", "Other"}
    
    for i, prof in ipairs(filterProfs) do
        options.args.matFilters.args[prof] = {
            name = prof,
            type = "group",
            inline = true,
            order = i,
            args = {
                enabled = {
                    name = "Anzeigen", type = "toggle", order = 1,
                    get = function() 
                        PH.db.profile.profSubSettings[prof] = PH.db.profile.profSubSettings[prof] or {enabled = true}
                        return PH.db.profile.profSubSettings[prof].enabled 
                    end,
                    set = function(_, val) 
                        PH.db.profile.profSubSettings[prof] = PH.db.profile.profSubSettings[prof] or {enabled = true}
                        PH.db.profile.profSubSettings[prof].enabled = val; PH:GetModule("Visuals"):Init() 
                    end,
                },
                textAlign = {
                    name = "Text Position", type = "select", order = 2,
                    values = { ["LEFT"] = "Links", ["RIGHT"] = "Rechts", ["TOP"] = "Oben", ["BOTTOM"] = "Unten" },
                    get = function() 
                        PH.db.profile.profSubSettings[prof] = PH.db.profile.profSubSettings[prof] or {textAlign = "BOTTOM"}
                        return PH.db.profile.profSubSettings[prof].textAlign or "BOTTOM" 
                    end,
                    set = function(_, val) 
                        PH.db.profile.profSubSettings[prof] = PH.db.profile.profSubSettings[prof] or {}
                        PH.db.profile.profSubSettings[prof].textAlign = val; PH:GetModule("Visuals"):Init() 
                    end,
                },
                color = {
                    name = "Text Farbe", type = "color", order = 3,
                    get = function() 
                        PH.db.profile.profSubSettings[prof] = PH.db.profile.profSubSettings[prof] or {color = {r=0.3, g=0.9, b=0.25}}
                        local c = PH.db.profile.profSubSettings[prof].color or {r=0.3, g=0.9, b=0.25}
                        return c.r, c.g, c.b 
                    end,
                    set = function(_, r, g, b) 
                        PH.db.profile.profSubSettings[prof] = PH.db.profile.profSubSettings[prof] or {}
                        PH.db.profile.profSubSettings[prof].color = {r=r, g=g, b=b}
                        PH:GetModule("Visuals"):Init() 
                    end,
                },
                headerPos = { name = "Reihen-Position", type = "header", order = 10 },
                posX = {
                    name = "Position X", type = "range", order = 11, min = -2000, max = 2000, step = 1,
                    get = function() return PH.db.profile.positions[prof] and PH.db.profile.positions[prof].x or 0 end,
                    set = function(_, val) 
                        PH.db.profile.positions[prof] = PH.db.profile.positions[prof] or {x=0, y=0}
                        PH.db.profile.positions[prof].x = val; PH:GetModule("Visuals"):Init() 
                    end,
                },
                posY = {
                    name = "Position Y", type = "range", order = 12, min = -2000, max = 2000, step = 1,
                    get = function() return PH.db.profile.positions[prof] and PH.db.profile.positions[prof].y or 0 end,
                    set = function(_, val) 
                        PH.db.profile.positions[prof] = PH.db.profile.positions[prof] or {x=0, y=0}
                        PH.db.profile.positions[prof].y = val; PH:GetModule("Visuals"):Init() 
                    end,
                },
                resetColor = {
                    name = "Reset Farbe",
                    type = "execute",
                    order = 20,
                    func = function()
                        PH.db.profile.profSubSettings[prof].color = {r=0.3, g=0.9, b=0.25}
                        PH:GetModule("Visuals"):Init()
                    end,
                }
            }
        }
    end

    -- 4. Registrierung
    LibStub("AceConfig-3.0"):RegisterOptionsTable(ADDON_NAME, options)
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(ADDON_NAME, "Professions Helper")
end