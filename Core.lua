-- Core.lua
local ADDON_NAME, addonTable = ...

-- 1. Ace3 Addon-Objekt erstellen
-- Wir binden AceConsole (für Chat-Befehle) und AceEvent (für WoW-Events) direkt ein
ProfessionsHelper = LibStub("AceAddon-3.0"):NewAddon(ADDON_NAME, "AceConsole-3.0", "AceEvent-3.0")
ProfessionsHelper.modules = ProfessionsHelper.modules or {}

-- 2. Standardwerte für die Datenbank (Defaults)
local defaults = {
    profile = {
        locked = false,
        growUp = false,
        catSettings = {
            [1] = { 
                scale = 1.0, enabled = true, growUp = true, name = "Balken (Erze/Kräuter)", 
                width = 30, height = 100, fontSize = 10, barTexture = "Cilo", fontName = "Friz Quadrata TT",
                colorQ1 = {r=1, g=0.5, b=0},
                colorQ2 = {r=0.8, g=0.8, b=0.8},
                colorQ3 = {r=1, g=0.85, b=0},
                showBackground = true,
                backgroundColor = {r=0, g=0, b=0, a=0.5}
            },
            [2] = { scale = 1.0, enabled = true, name = "Icons (Materialien)" }, -- Text kommt aus profSubSettings
            [3] = { scale = 1.0, enabled = true, name = "Berufs-Icons" },        -- KEIN Text vorgesehen
            [4] = { scale = 1.0, enabled = true, name = "Angeln", textAlign = "BOTTOM" }, -- Nur Position für Angeln
            [5] = { scale = 1.0, enabled = true, name = "Berufs-Sklills"},
        },
        enabledExpansions = {
            ["TWW"] = true,
            ["Midnight"] = true,
        },
        enabledResources = {
            ["Ore"] = true,
            ["Herbs"] = true,
        },
        positions = {
            [1] = { x = -450, y = 150 },
            [2] = { x = -450, y = 100 },
            [3] = { x = -450, y = 50 },
            [4] = { x = -300, y = 400 },
            [5] = { x = 0, y = -100 },
        },
        -- Diese Settings gelten NUR für die Materialien (Kat 2)
        profSubSettings = {
            ["Mining"] = { enabled = true, textAlign = "LEFT", color = {r=0.3, g=0.9, b=0.25} },
            ["Herbalism"] = { enabled = true, textAlign = "LEFT", color = {r=0.3, g=0.9, b=0.25} },
            ["Skinning"] = { enabled = true, textAlign = "LEFT", color = {r=0.3, g=0.9, b=0.25} },
            ["Fishing"] = { enabled = true, textAlign = "LEFT", color = {r=0.3, g=0.9, b=0.25} },
            ["Cooking"] = { enabled = true, textAlign = "LEFT", color = {r=0.3, g=0.9, b=0.25} },
            ["Other"] = { enabled = true, textAlign = "LEFT", color = {r=0.3, g=0.9, b=0.25} },
        },
        itemSettings = {},
    }
}

------------------------------------------------------------
-- Initialisierung (Wird beim Laden des Addons aufgerufen)
------------------------------------------------------------
function ProfessionsHelper:OnInitialize()
    -- Datenbank-Setup mit AceDB
    -- "ProfessionsHelperDB" ist der Name in der .toc unter ## SavedVariables
    self.db = LibStub("AceDB-3.0"):New("ProfessionsHelperDB", defaults, true)

    -- Slash-Befehle registrieren
    self:RegisterChatCommand("ph", "OpenMenu")
    self:RegisterChatCommand("phmenu", "OpenMenu")

    -- Menü initialisieren (Funktion kommt aus der Settings.lua)
    if type(self.SetupOptions) == "function" then
        self:SetupOptions()
    end

    -- Initialisierungs-Nachricht
    self:Print("|cff33ff99geladen!|r Nutze /ph für die Einstellungen.")

    -- Bestehende Module initialisieren
    for name, module in pairs(self.modules) do
        if type(module.Init) == "function" then
            module:Init()
        end
    end
end

------------------------------------------------------------
-- Menü-Funktionen
------------------------------------------------------------
function ProfessionsHelper:OpenMenu()
    -- Öffnet das offizielle Blizzard-Optionsmenü direkt bei deinem Addon
    if self.optionsFrame then
        Settings.OpenToCategory(self.optionsFrame.name)
    end
end

------------------------------------------------------------
-- Modul-System (Beibehalten deiner Struktur)
------------------------------------------------------------
function ProfessionsHelper:RegisterModule(name, module)
    self.modules[name] = module
    
    -- Falls das Modul erst später geladen wird (nach OnInitialize),
    -- initialisieren wir es sofort.
    if self.db and type(module.Init) == "function" then
        module:Init()
    end
end

function ProfessionsHelper:GetModule(name)
    return self.modules[name]
end

-- Globaler Daten-Pointer für externe Daten-Dateien (z.B. db.lua)
ProfessionsHelper.Data = ProfessionsHelper.Data or {}