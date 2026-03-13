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
    self.db = LibStub("AceDB-3.0"):New("ProfessionsHelperDB_Char", defaults, "Default")

    -- Slash-Befehle (nur einmal pro Kommando!)
    self:RegisterChatCommand("ph", "ChatCommand")
    self:RegisterChatCommand("phmenu", "OpenMenu")

    -- Menü initialisieren
    if type(self.SetupOptions) == "function" then
        self:SetupOptions()
    end

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

function ProfessionsHelper:ChatCommand(input)
    input = input:trim():lower()

    if input == "lock" or input == "unlock" then
        -- Gezieltes Setzen statt bloßem Toggle erhöht die Nutzerfreundlichkeit
        local newState = (input == "lock")
        self.db.profile.locked = newState
        
        local status = newState and "|cff00ff00fixiert (locked)|r" or "|cffff0000gelöst (unlocked)|r"
        self:Print("Alle Frames sind nun " .. status)
        
        -- 1. Visuals updaten (damit die grünen Flächen verschwinden/erscheinen)
        self:GetModule("Visuals"):Init()
        
        -- 2. Ace-Optionen zwingen, die Checkbox zu aktualisieren
        LibStub("AceConfigRegistry-3.0"):NotifyChange(ADDON_NAME)

    elseif input == "config" or input == "" then
        -- Wenn nur /ph oder /ph config eingegeben wird, öffne das Menü
        self:OpenMenu()
    else
        self:Print("|cffffff00Befehle:|r")
        self:Print("|cff66bbff/ph lock|r - Fixiert die Frames.")
        self:Print("|cff66bbff/ph unlock|r - Macht Frames beweglich.")
        self:Print("|cff66bbff/ph config|r - Öffnet die Einstellungen.")
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