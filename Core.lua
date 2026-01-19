-- Core.lua
-- ProfessionsHelper Core

local ADDON_NAME, _ = ...

-- Hauptobjekt
ProfessionsHelper = ProfessionsHelper or {}
ProfessionsHelper.modules = ProfessionsHelper.modules or {}

-- Hilfsfunktion um sicherzustellen, dass die DB existiert
local function EnsureDatabase()
    ProfessionsHelperDB = ProfessionsHelperDB or {}
    ProfessionsHelperDB.enabledExpansions = ProfessionsHelperDB.enabledExpansions or {}
    ProfessionsHelperDB.enabledResources = ProfessionsHelperDB.enabledResources or {}
    ProfessionsHelperDB.positions = ProfessionsHelperDB.positions or {}
    ProfessionsHelperDB.itemSettings = ProfessionsHelperDB.itemSettings or {}
end

------------------------------------------------------------
-- Modulregistrierung mit Absicherung
------------------------------------------------------------
function ProfessionsHelper:RegisterModule(name, module)
    self.modules[name] = module
    
    -- Wenn das Addon schon geladen ist, initialisieren wir sofort
    if C_AddOns.IsAddOnLoaded(ADDON_NAME) then
        EnsureDatabase() -- Zuerst DB sichern!
        if type(module.Init) == "function" then
            module:Init()
        end
    end
end

------------------------------------------------------------
-- Hilfsfunktion zum Abrufen von Modulen
------------------------------------------------------------
function ProfessionsHelper:GetModule(name)
    return self.modules[name]
end

------------------------------------------------------------
-- ADDON_LOADED Event
------------------------------------------------------------
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:SetScript("OnEvent", function(self, event, addonName)
    if addonName == ADDON_NAME then
        -- Datenbank-Initialisierung via Hilfsfunktion
        EnsureDatabase()

        print("|cff33ff99ProfessionsHelper geladen!|r /phmenu zum Öffnen.")

        -- Alle Module initialisieren, die sich bis jetzt schon registriert haben
        for _, module in pairs(ProfessionsHelper.modules) do
            if type(module.Init) == "function" then
                module:Init()
            end
        end

        self:UnregisterEvent("ADDON_LOADED")
    end
end)

-- Globaler Daten-Pointer
ProfessionsHelper.Data = ProfessionsHelper.Data or ProfessionsHelperData