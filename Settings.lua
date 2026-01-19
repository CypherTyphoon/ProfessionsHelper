local ADDON_NAME, _ = ...
local PH = LibStub("AceAddon-3.0"):GetAddon(ADDON_NAME)

function PH:SetupOptions()
    -- 1. Grundgerüst der Optionen
    local options = {
        name = "Professions Helper",
        type = "group",
        args = {
            general = {
                type = "group",
                name = "Allgemein",
                order = 1,
                args = {
                    lockFrames = {
                        name = "Alle Frames fixieren",
                        type = "toggle",
                        set = function(info, val) PH.db.profile.locked = val end,
                        get = function(info) return PH.db.profile.locked end,
                        order = 1,
                    },
                },
            },
        },
    }

    -- 2. Kategorien (Balken, Icons etc.) automatisch hinzufügen
    for id, data in pairs(PH.db.profile.catSettings) do
        options.args["cat" .. id] = {
            type = "group",
            name = data.name,
            order = id + 1,
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
                    get = function(info) return PH.db.profile.catSettings[id].scale end,
                },
                -- Spezifische Einstellungen für Balken (Kat 1)
                direction = (id == 1) and {
                    name = "Von unten nach oben füllen",
                    type = "toggle",
                    order = 3,
                    set = function(info, val) PH.db.profile.catSettings[1].growUp = val; PH:GetModule("Visuals"):Init() end,
                    get = function(info) return PH.db.profile.catSettings[1].growUp end,
                } or nil,
                barWidth = (id == 1) and {
                    name = "Breite",
                    type = "range", order = 10, min = 5, max = 100, step = 1,
                    set = function(info, val) PH.db.profile.catSettings[1].width = val; PH:GetModule("Visuals"):Init() end,
                    get = function(info) return PH.db.profile.catSettings[1].width end,
                } or nil,
                barHeight = (id == 1) and {
                    name = "Höhe",
                    type = "range", order = 11, min = 20, max = 300, step = 1,
                    set = function(info, val) PH.db.profile.catSettings[1].height = val; PH:GetModule("Visuals"):Init() end,
                    get = function(info) return PH.db.profile.catSettings[1].height end,
                } or nil,
                fontSize = (id == 1) and {
                    name = "Schriftgröße",
                    type = "range", order = 12, min = 6, max = 20, step = 1,
                    set = function(info, val) PH.db.profile.catSettings[1].fontSize = val; PH:GetModule("Visuals"):Init() end,
                    get = function(info) return PH.db.profile.catSettings[1].fontSize end,
                } or nil,
                barTexture = (id == 1) and {
                    name = "Balken-Textur",
                    type = "select", order = 13, dialogControl = "LSM30_Statusbar",
                    values = AceGUIWidgetLSMlists.statusbar,
                    set = function(info, val) PH.db.profile.catSettings[1].barTexture = val; PH:GetModule("Visuals"):Init() end,
                    get = function(info) return PH.db.profile.catSettings[1].barTexture end,
                } or nil,
                fontName = (id == 1) and {
                    name = "Schriftart",
                    type = "select", order = 14, dialogControl = "LSM30_Font",
                    values = AceGUIWidgetLSMlists.font,
                    set = function(info, val) PH.db.profile.catSettings[1].fontName = val; PH:GetModule("Visuals"):Init() end,
                    get = function(info) return PH.db.profile.catSettings[1].fontName end,
                } or nil,
            },
        }
    end

    -- 3. Material-Filter (Kat 2 Unterkategorien) hinzufügen
    options.args.matFilters = {
        name = "Material-Icons Filter (Kat 2)",
        type = "group",
        order = 25,
        args = {}
    }

    local filterProfs = {"Mining", "Herbalism", "Skinning", "Fishing", "Cooking", "Other"}
    for i, prof in ipairs(filterProfs) do
        options.args.matFilters.args[prof] = {
            name = prof,
            type = "group",
            inline = true,
            order = i,
            args = {
                enabled = {
                    name = "Anzeigen",
                    type = "toggle",
                    order = 1,
                    get = function() return PH.db.profile.profSubSettings[prof].enabled end,
                    set = function(_, val) 
                        PH.db.profile.profSubSettings[prof].enabled = val
                        PH:GetModule("Visuals"):Init() 
                    end,
                },
                textAlign = {
                    name = "Text Position",
                    type = "select",
                    order = 2,
                    values = { ["LEFT"] = "Links", ["RIGHT"] = "Rechts", ["TOP"] = "Oben", ["BOTTOM"] = "Unten" },
                    get = function() return PH.db.profile.profSubSettings[prof].textAlign end,
                    set = function(_, val) 
                        PH.db.profile.profSubSettings[prof].textAlign = val
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