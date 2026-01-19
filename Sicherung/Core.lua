-- Core.lua
-- ProfessionsHelper Core

-- Addon Namespace
ProfessionsHelper = {}
ProfessionsHelper.modules = {}

-- Funktionsweise: Module können hier registriert werden
function ProfessionsHelper:RegisterModule(name, func)
    self.modules[name] = func
    if func.Init then
        func:Init()
    end
end

-- Event-Frame für Addon-Loaded
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addonName)
    if addonName == "ProfessionsHelper" then
        print("ProfessionsHelper loaded!")
        
        -- Optional: Module initialisieren, falls sie eine Init-Funktion haben
        for name, module in pairs(ProfessionsHelper.modules) do
            if module.Init then
                module:Init()
            end
        end
    end
end)

-- Hier wird Skinning.lua automatisch geladen, da es in der .toc steht
-- Optional könntest du es als Modul registrieren:
if Skinning then
    ProfessionsHelper:RegisterModule("Skinning", Skinning)
end
