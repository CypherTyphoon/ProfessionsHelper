-- Icons.lua
local ADDON_NAME, _ = ...
local Icons = {}
local LSM = LibStub("LibSharedMedia-3.0")

-- ==========================
-- Hilfsfunktion: Texture + FontString
-- ==========================
local function CreateShadowedText(parent, size, anchor, x, y)
    local text = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    text:SetPoint(anchor, parent, anchor, x, y)
    text:SetTextColor(1,1,1)
    text:SetShadowColor(0,0,0,1)
    text:SetShadowOffset(1,-1)
    text:SetFont(text:GetFont(), size, "OUTLINE")
    return text
end

-- ==========================
-- Small Item Icon
-- ==========================
function Icons:CreateItemIcon(parent, itemID, size)
    local frame = CreateFrame("Frame", nil, parent)
    local icon = frame:CreateTexture(nil, "ARTWORK")
    icon:SetSize(size, size)
    icon:SetPoint("LEFT")
    icon:SetTexture(C_Item.GetItemIconByID(itemID))

    local countText = CreateShadowedText(frame, size * 0.8, "LEFT", size + 2, 0)

    frame:SetScript("OnEvent", function()
        local count = C_Item.GetItemCount(itemID, true, true, true, true)
        countText:SetText(count > 1 and count or "")
    end)
    frame:RegisterEvent("BAG_UPDATE")
    frame:RegisterEvent("PLAYER_ENTERING_WORLD")

    return frame
end

-- ==========================
-- Profession Icon (32x32 + overlays)
-- ==========================
function Icons:CreateProfessionIcon(parent, itemID)
    local frame = CreateFrame("Frame", nil, parent)
    frame:SetSize(32,32)

    local icon = frame:CreateTexture(nil, "ARTWORK")
    icon:SetAllPoints(true)
    icon:SetTexture(C_Item.GetItemIconByID(itemID))

    -- Overlay Text Layers
    local chargesText = CreateShadowedText(frame, 10, "TOPRIGHT", -1, -1)
    local craftableText = CreateShadowedText(frame, 12, "RIGHT", -1, 0)
    local countText = CreateShadowedText(frame, 10, "BOTTOMRIGHT", -1, 1)

    local function Update()
        -- Ladungen
        local charges = C_Item.GetItemCurrentCharges and C_Item.GetItemCurrentCharges(itemID)
        if charges and charges > 0 then
            chargesText:SetText(charges)
        else
            chargesText:SetText("")
        end

        -- Wieviele craftbar?
        -- → Wird später mit Rezept-Daten ersetzt
        craftableText:SetText("") -- Placeholder

        -- Total Count
        local count = C_Item.GetItemCount(itemID, true, true, true, true)
        countText:SetText(count > 1 and count or "")
    end

    frame:SetScript("OnEvent", Update)
    frame:RegisterEvent("BAG_UPDATE")
    frame:RegisterEvent("PLAYER_ENTERING_WORLD")
    Update()

    return frame
end

-- ==========================
-- Registrierung
-- ==========================
if ProfessionsHelper then
    ProfessionsHelper:RegisterModule("Icons", Icons)
else
    C_Timer.After(0.5, function()
        if ProfessionsHelper then
            ProfessionsHelper:RegisterModule("Icons", Icons)
        end
    end)
end