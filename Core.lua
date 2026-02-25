-- ==========================================
-- Core.lua - ProfessionsHelper (Charakter-Fix)
-- ==========================================
local ADDON_NAME, addonTable = ...

-- 1. Ace3 Addon-Objekt erstellen
ProfessionsHelper = LibStub("AceAddon-3.0"):NewAddon(ADDON_NAME, "AceConsole-3.0", "AceEvent-3.0")
ProfessionsHelper.modules = ProfessionsHelper.modules or {}

-- 2. Standardwerte (Defaults)
-- Wir packen alles in 'profile', da AceDB bei SavedVariablesPerCharacter 
-- technisch gesehen nur ein "Profil" pro Datei sieht.
local defaults = {
    profile = {
        locked = false,
        learnedProfessions = {},
        fontSize = 10,
        
        -- Design (hier im Profil, damit pro Char anpassbar)
        barTexture = "Cilo",
        fontName = "Friz Quadrata TT",
        backgroundColor = {r=0, g=0, b=0, a=0.5},
        
        enabledExpansions = { ["TWW"] = true, ["Midnight"] = true },
        enabledResources = { ["Ore"] = true, ["Herbs"] = true },
        itemFilters = {}, 
        
        catSettings = {
            [1] = { scale = 1.0, enabled = true, name = "Balken", fontSize = 10 },
            [2] = { scale = 1.0, enabled = true, name = "Material-Icons", fontSize = 12, textAlign = "BOTTOM" },
            [3] = { scale = 1.0, enabled = true, name = "Berufs-Icons", fontSize = 12 },
            [4] = { scale = 1.0, enabled = true, name = "Angeln", textAlign = "BOTTOM", fontSize = 12 },
            [5] = { scale = 1.0, enabled = true, name = "Berufs-Skills", fontSize = 12 },
        },
        
        barSettings = {
            ["Mining"]      = { enabled = true, width = 30, height = 100, growUp = true, fontSize = 10 },
            ["Herbalism"]   = { enabled = true, width = 30, height = 100, growUp = true, fontSize = 10 },
            ["Skinning"]    = { enabled = true, width = 30, height = 100, growUp = true, fontSize = 10 },
            ["Inscription"] = { enabled = true, width = 30, height = 100, growUp = true, fontSize = 10 },
            ["Tailoring"]   = { enabled = true, width = 30, height = 100, growUp = true, fontSize = 10 },
            ["Other"]       = { enabled = true, width = 30, height = 100, growUp = true, fontSize = 10 },
        },

        positions = {
            ["Mining_Bar"]      = { x = -450, y = 150 },
            ["Herbalism_Bar"]   = { x = -400, y = 150 },
            ["Skinning_Bar"]    = { x = -350, y = 150 },
            ["Inscription_Bar"] = { x = -300, y = 150 },
            ["Tailoring_Bar"]   = { x = -250, y = 150 },
        },
        profSubSettings = {}, 
        itemSortOrder = {},
    }
}

------------------------------------------------------------
-- Initialisierung
------------------------------------------------------------
function ProfessionsHelper:OnInitialize()
    -- WICHTIG: Wir nutzen hier den Namen aus der .toc (SavedVariablesPerCharacter)
    -- Da diese Variable pro Charakter existiert, sind die Daten physisch getrennt.
    self.db = LibStub("AceDB-3.0"):New("ProfessionsHelperDB_Char", defaults, "Default")

    -- Slash-Befehle
    self:RegisterChatCommand("ph", "OpenMenu")
    self:RegisterChatCommand("phmenu", "OpenMenu")

    -- Menü initialisieren
    if type(self.SetupOptions) == "function" then
        self:SetupOptions()
    end

    -- Anzeige zur Kontrolle
    self:Print("|cff33ff99geladen!|r (Charakter-Speichermodus aktiv)")

    -- Module starten
    for name, module in pairs(self.modules) do
        if type(module.Init) == "function" then
            module:Init()
        end
    end
end

function ProfessionsHelper:OpenMenu()
    if self.optionsFrame then
        if Settings and Settings.OpenToCategory then
            Settings.OpenToCategory(self.optionsFrame.name)
        else
            InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
        end
    end
end

function ProfessionsHelper:RegisterModule(name, module)
    self.modules[name] = module
    if self.db and type(module.Init) == "function" then
        module:Init()
    end
end

function ProfessionsHelper:GetModule(name)
    return self.modules[name]
end

ProfessionsHelper.Data = ProfessionsHelper.Data or {}