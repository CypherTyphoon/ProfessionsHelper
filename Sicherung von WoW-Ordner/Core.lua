-- Core.lua
-- ProfessionsHelper Core

local ADDON_NAME, _ = ...

-- Hauptobjekt
ProfessionsHelper = ProfessionsHelper or {}
ProfessionsHelper.modules = ProfessionsHelper.modules or {}

------------------------------------------------------------
-- Modulregistrierung
------------------------------------------------------------
function ProfessionsHelper:RegisterModule(name, module)
    self.modules[name] = module
    if type(module.Init) == "function" then
        module:Init()
    end
end

------------------------------------------------------------
-- ADDON_LOADED Event
------------------------------------------------------------
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:SetScript("OnEvent", function(self, event, addonName)
    if addonName == ADDON_NAME then
        ProfessionsHelperDB = ProfessionsHelperDB or {
            enabledExpansions = {},
            enabledResources = {}
        }

        print("|cff33ff99ProfessionsHelper loaded!|r /phmenu to open.")

        -- Module initialisieren
        for _, module in pairs(ProfessionsHelper.modules) do
            if type(module.Init) == "function" then
                module:Init()
            end
        end

        self:UnregisterEvent("ADDON_LOADED")
    end
end)

ProfessionsHelper.Data = ProfessionsHelper.Data or ProfessionsHelperData
