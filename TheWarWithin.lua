-- TheWarWithin.lua 
-- ProfessionsHelper Item Data

local ADDON_NAME, _ = ...
ProfessionsHelperData = ProfessionsHelperData or {}
ProfessionsHelperData["The War Within"] = {
    Config = {
        ParentMapIDs = { 
            [2274] = true, -- Khaz Algar
            [2371] = true, -- K'aresh
        },
        CityMapIDs = { 
            [2339] = true, -- Dornogal
        },
    },
}

-- ==========================================
-- HERBS (Sortiert nach Drop -> Currency)
-- ==========================================
ProfessionsHelperData["The War Within"].Herbs = {
    Mycobloom = { IDs = { 210796, 210797, 210798 }, color = "#FFBC62", sources = { "Drop", "Vendor" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Inscription" }, displayCategory = 1 },
    Luredrop = { IDs = { 210799, 210800, 210801 }, color = "#BA6E70", sources = { "Drop", "Vendor" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Inscription" }, displayCategory = 1 },
    Orbinid = { IDs = { 210802, 210803, 210804 }, color = "#A65EBA", sources = { "Drop", "Vendor" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Inscription" }, displayCategory = 1 },
    BlessingBlossom = { IDs = { 210805, 210806, 210807 }, color = "#B5396C", sources = { "Drop", "Vendor" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Inscription" }, displayCategory = 1 },
    ArathorsSpear = { IDs = { 210808, 210809, 210810 }, color = "#B5A143", sources = { "Drop", "Vendor" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Inscription" }, displayCategory = 1 },
    NullLotus = { IDs = { 213197 }, color = "#A610B5", sources = { "Drop", "Vendor" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Tailoring" }, displayCategory = 1 },
    PhantomBloom = { IDs = { 239690, 239691, 239692 }, color = "#30F4FF", gradient_End_color = "#EC82FF", sources = { "Drop", "Currency" }, gatheringProf = "Herbalism", displayCategory = 1 },
    KareshiLotus = { IDs = { 240194 }, color = "#A610B5", gradient_End_color = "#C219FF", sources = { "Drop", "Currency" }, gatheringProf = "Herbalism", displayCategory = 1 },
}

-- ==========================================
-- ORES
-- ==========================================
ProfessionsHelperData["The War Within"].Ores = {
    Bismuth = { IDs = { 210930, 210931, 210932 }, color = "#80567A", sources = { "Drop", "Vendor" }, gatheringProf = "Mining", processingProfs = { "Blacksmithing", "Engineering", "Jewelcrafting", "Alchemy" }, displayCategory = 1 },
    Aqirite = { IDs = { 210933, 210934, 210935 }, color = "#CA4A35", sources = { "Drop", "Vendor" }, gatheringProf = "Mining", processingProfs = { "Blacksmithing", "Engineering", "Jewelcrafting", "Alchemy" }, displayCategory = 1 },
    Ironclaw_Ore = { IDs = { 210936, 210937, 210938 }, color = "#ACFCF8", sources = { "Drop", "Vendor" }, gatheringProf = "Mining", processingProfs = { "Blacksmithing", "Engineering", "Jewelcrafting", "Alchemy" }, displayCategory = 1 },
}

-- ==========================================
-- LEATHER (Prio 1: Gathering, Prio 2: Beast Parts, Prio 3: Crafted)
-- ==========================================
ProfessionsHelperData["The War Within"].Leather = {
    -- Priority 1: Drop (Gathering)
    StormChargedLeather = { IDs = { 212664, 212665, 212666 }, color = "#FF5900", sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Alchemy" }, displayCategory = 1 },
    GloomChitin = { IDs = { 212667, 212668, 212669 }, color = "#7E94FF", sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Alchemy" }, displayCategory = 1 },
    ThunderousHide = { IDs = { 212670, 212672, 212673 }, color = "#FF9F46", sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    SunlessCarapace = { IDs = { 212674, 212675, 212676 }, color = "#FF55EE", sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    -- Priority 2: Drop (Beast Parts)
    BottledStorm = { IDs = { 218338 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Enchanting" }, displayCategory = 2 },
    KahetiSwarmChitin = { IDs = { 218336 }, sources = { "Drop" }, gatheringProf = "Skinning", extraCategories = { "Beast Part" }, processingProfs = { "Leatherworking" }, displayCategory = 2 },
    HonedBoneShards = { IDs = { 218337 }, sources = { "Drop" }, gatheringProf = "Skinning", extraCategories = { "Beast Part" }, processingProfs = { "Leatherworking" }, displayCategory = 2 },
    BurningCinderbeeSetae = { IDs = { 218339 }, sources = { "Drop" }, gatheringProf = "Skinning", extraCategories = { "Beast Part" }, processingProfs = { "Leatherworking" }, displayCategory = 2 },
    SuperbBeastFang = { IDs = { 219013 }, sources = { "Drop" }, gatheringProf = "Skinning", extraCategories = { "Beast Part" }, processingProfs = { "Leatherworking", "Blacksmithing" }, displayCategory = 2 },
    -- Priority 3: Crafted
    CarapaceBackedHide = { IDs = { 219880, 219881, 219882 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Leatherworking" }, displayCategory = 3 },
    CrystalfusedHide = { IDs = { 219883, 219884, 219885 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Engineering", "Leatherworking" }, displayCategory = 3 },
    WrithingHide = { IDs = { 219886, 219887, 219888 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Engineering", "Leatherworking" }, displayCategory = 3 },
    SporecoatedHide = { IDs = { 219889, 219890, 219891 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Leatherworking" }, displayCategory = 3 },
    LeyfusedHide = { IDs = { 219892, 219893, 219894 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Leatherworking" }, displayCategory = 3 },
    ChitinArmorBanding = { IDs = { 219898, 219899, 219900 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Leatherworking" }, displayCategory = 3 },
    StormTouchedWeaponWrap = { IDs = { 219901, 219902, 219903 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Leatherworking" }, displayCategory = 3 },
}

-- ==========================================
-- METAL & STONE (Prio 1: Base, Prio 2: Reagents/Flux, Prio 3: Alloys)
-- ==========================================
ProfessionsHelperData["The War Within"].MetalAndStone = {
    -- Priority 1: Drop / Vendor (Base)
    Null_Stone = { IDs = { 210939 }, color = "#9F2264", sources = { "Drop", "Vendor" }, gatheringProf = "Mining", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Jewelcrafting", "Blacksmithing" }, displayCategory = 1 },
    Desolate_Talus = { IDs = { 238201, 238212, 238213 }, color = "#80336F", sources = { "Drop", "Currency" }, gatheringProf = "Mining", displayCategory = 1 },
    Kareshi_Resonating_Stone = { IDs = { 240216 }, color = "#2E349F", sources = { "Drop", "Currency" }, gatheringProf = "Mining", displayCategory = 1 },
    -- Priority 2: Reagents / Vendor
    Imperfect_Null_Stone = { IDs = { 217707 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
    Manaforged_Instrument = { IDs = { 249218 }, sources = { "Drop" }, processingProfs = { "Inscription", "Enchanting" }, displayCategory = 2 },
    Echoing_Flux = { IDs = { 226202 }, sources = { "Vendor" }, processingProfs = { "Blacksmithing" }, displayCategory = 2 },
    Crystalforged_Cauldron = { IDs = { 212754 }, sources = { "Vendor" }, processingProfs = { "Alchemy" }, displayCategory = 2 },
    -- Priority 3: Crafted (Alloys)
    Core_Alloy = { IDs = { 222417, 222418, 222419 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Blacksmithing" }, displayCategory = 3 },
    Charged_Alloy = { IDs = { 222420, 222421, 222422 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Blacksmithing", "Engineering" }, displayCategory = 3 },
    Sanctified_Alloy = { IDs = { 222423, 222424, 222425 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Blacksmithing", "Tailoring" }, displayCategory = 3 },
    Ironclaw_Alloy = { IDs = { 222426, 222427, 222428 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Blacksmithing" }, displayCategory = 3 },
}

-- ==========================================
-- CLOTH (Prio 1: Gathering, Prio 2: Spools, Prio 3: Bolts)
-- ==========================================
ProfessionsHelperData["The War Within"].Cloth = {
    -- Priority 1: Drop (Gathering)
    AlgariFowlfeather = { IDs = { 225570 }, sources = { "Drop" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 2 },
    Duskweave = { IDs = { 224824, 228233, 228234 }, color = "#7B12FF", gradient_End_color = "#8F85D1", sources = { "Drop" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 1 },
    Dawnweave = { IDs = { 224826, 228235, 228236 }, color = "#D1833F", gradient_End_color = "#FFFF00", sources = { "Drop" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 1 },
    Weavercloth = { IDs = { 224828, 228231, 228232 }, color = "#C69052", gradient_End_color = "#FFFF00", sources = { "Drop" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring", "Alchemy" }, displayCategory = 1 },
    -- Priority 2: Crafted (Spools)
    SpoolOfDuskthread = { IDs = { 222789, 222790, 222791 }, color = "#8F85D1", gradient_End_color = "#ED2EFF", sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 2 },
    SpoolOfDawnthread = { IDs = { 222792, 222793, 222794 }, color = "#6C77D1", gradient_End_color = "#D1833F", sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 2 },
    SpoolOfWeaverthread = { IDs = { 222795, 222796, 222797 }, color = "#FFB841", gradient_End_color = "#C64DA1", sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 2 },
    -- Priority 3: Crafted (Bolts)
    DuskweaveBolt = { IDs = { 222798, 222799, 222800 }, color = "#7250D1", gradient_End_color = "#A939FF", sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 3 },
    DawnweaveBolt = { IDs = { 222801, 222802, 222803 }, color = "#FFFF00", gradient_End_color = "#D1833F", sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 3 },
    WeaverclothBolt = { IDs = { 222804, 222805, 222806 }, color = "#7B12FF", gradient_End_color = "#8F85D1", sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 3 },
    ExquisiteWeaverclothBolt = { IDs = { 224832, 224833, 224834 }, sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 3 },
}

-- ==========================================
-- FINISHING REAGENTS
-- ==========================================
ProfessionsHelperData["The War Within"].FinishingReagents = {
    -- Priority 1: Drop / Special
    ApprenticesCraftingLicense = { IDs = { 225670 }, sources = { "Drop" }, gatheringProf = "AllProf", processingProfs = { "AllProf" }, displayCategory = 2 },
    StackOfPentagoldReviews = { IDs = { 225671 }, sources = { "Drop" }, gatheringProf = "AllProf", processingProfs = { "AllProf" }, displayCategory = 2 },
    UnraveledInstructions = { IDs = { 225672 }, sources = { "Drop" }, gatheringProf = "AllProf", processingProfs = { "AllProf" }, displayCategory = 2 },
    ArtisansConsortiumSealOfApproval = { IDs = { 225673 }, sources = { "Drop" }, gatheringProf = "AllProf", processingProfs = { "AllProf" }, displayCategory = 2 },
    HotHoneycomb = { IDs = { 225912 }, sources = { "Drop" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 2 },
    AssortedChokingHazards = { IDs = { 225984, 225985, 225986 }, sources = { "Unknown" }, gatheringProf = "Engineering", processingProfs = { "Engineering" }, displayCategory = 2 },
    -- Priority 2: Crafted
    BottledBrilliance = { IDs = { 225987, 225988, 225989 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "AllProf" }, displayCategory = 3 },
    ConcentrationConcentrate = { IDs = { 224173, 224174, 224175 }, sources = { "Crafted" }, gatheringProf = "Enchanting", processingProfs = { "AllProf" }, displayCategory = 3 },
    MirrorPowder = { IDs = { 224176, 224177, 224178 }, sources = { "Crafted" }, gatheringProf = "Enchanting", processingProfs = { "Jewelcrafting" }, displayCategory = 3 },
    ForgedFramework = { IDs = { 222499, 222500, 222501 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Blacksmithing", "Engineering" }, displayCategory = 3 },
    AdjustableFramework = { IDs = { 222511, 222512, 222513 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Blacksmithing", "Engineering", "Leatherworking", "Inscription" }, displayCategory = 3 },
    TemperedFramework = { IDs = { 222514, 222515, 222516 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Blacksmithing", "Engineering", "Leatherworking" }, displayCategory = 3 },
    GlitteringGemdust = { IDs = { 214043 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting" }, displayCategory = 2 },
    SiftedCaveSand = { IDs = { 213762, 213763, 213764 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Inscription" }, displayCategory = 3 },
    OminousEnergyCrystal = { IDs = { 213765, 213766, 213767 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting", "Engineering" }, displayCategory = 3 },
    GrittyPolishingCloth = { IDs = { 222876, 222877, 222878 }, sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Jewelcrafting" }, displayCategory = 3 },
    BrightPolishingCloth = { IDs = { 222879, 222880, 222881 }, sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Jewelcrafting" }, displayCategory = 3 },
    WeaverclothEmbroideryThread = { IDs = { 222882, 222883, 222884 }, sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 3 },
    PreservingEmbroideryThread = { IDs = { 222885, 222886, 222887 }, sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 3 },
    BubblingMycobloomCulture = { IDs = { 228401, 228402, 228403 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Alchemy" }, displayCategory = 3 },
    PetalPowder = { IDs = { 228404, 228405, 228406 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Alchemy" }, displayCategory = 3 },
}

-- ==========================================
-- INSCRIPTION (Prio 1: Base/Pigments, Prio 2: Inks)
-- ==========================================
ProfessionsHelperData["The War Within"].Inscription = {
    -- Priority 1: Vendor / Crafted (Pigments)
    Distilled_Algari_Freshwater = { IDs = { 226205 }, sources = { "Vendor" }, gatheringProf = "Inscription", processingProfs = { "Inscription" }, displayCategory = 2 },
    Blossom_Pigment = { IDs = { 224803, 224804, 224805 }, color = "#D53026", sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Inscription" }, displayCategory = 1 },
    Luredrop_Pigment = { IDs = { 222612, 222613, 222614 }, color = "#F29134", sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Inscription" }, displayCategory = 1 },
    Nacreous_Pigment = { IDs = { 222618, 222619, 222620 }, color = "#B84945", sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Inscription" }, displayCategory = 1 },
    Orbinid_Pigment = { IDs = { 224800, 224801, 224802 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Inscription" }, displayCategory = 1 },
    -- Priority 2: Crafted (Inks)
    Shadow_Ink = { IDs = { 222609, 222610, 222611 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Inscription" }, displayCategory = 3 },
    Apricate_Ink = { IDs = { 222615, 222616, 222617 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Inscription", "Tailoring" }, displayCategory = 3 },
}

-- ==========================================
-- JEWELCRAFTING (Prio 1: Base Reagents, Prio 2: Advanced)
-- ==========================================
ProfessionsHelperData["The War Within"].Jewelcrafting = {
    -- Priority 1: Crafted (Base Reagents)
    HandfulOfPebbles = { IDs = { 213398 }, sources = { "Crafted", "Vendor" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting" }, displayCategory = 0 },
    GlitteringGlass = { IDs = { 213399 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting" }, displayCategory = 2 },
    CrushedGemstones = { IDs = { 213219, 213220, 213221 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting" }, displayCategory = 3 },
    AmbivalentAmber = { IDs = { 212498 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting" }, displayCategory = 2 },
    ExtravagantEmerald = { IDs = { 212505 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting" }, displayCategory = 2 },
    StunningSapphire = { IDs = { 212508 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting" }, displayCategory = 2 },
    OstentatiousOnyx = { IDs = { 212511 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting" }, displayCategory = 2 },
    MarbledStone = { IDs = { 213756, 213757, 213758 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting" }, displayCategory = 3 },
    BlackBloodInfusedBar = { IDs = { 239107 }, sources = { "Drop" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting" }, displayCategory = 2 },
    -- Priority 2: Crafted (Advanced Reagents)
    EngravedGemcutter = { IDs = { 213750, 213751, 213752 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting" }, displayCategory = 3 },
    DecorativeLens = { IDs = { 213753, 213754, 213755 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting", "Engineering" }, displayCategory = 3 },
    InvertedPrism = { IDs = { 213759, 213760, 213761 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting", "Alchemy" }, displayCategory = 3 },
    Blasphemite = { IDs = { 212514 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Alchemy", "Jewelcrafting" }, displayCategory = 3 },
}

-- ==========================================
-- FISHING (Prio 1: Drop)
-- ==========================================
ProfessionsHelperData["The War Within"].Fishing = {
    Dilly_Dally_Dace = { IDs = { 220134 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Bloody_Perch = { IDs = { 220135 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Crystalline_Sturgeon = { IDs = { 220136 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Bismuth_Bitterling = { IDs = { 220137 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Nibbling_Minnow = { IDs = { 220138 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Whispering_Stargazer = { IDs = { 220139 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Specular_Rainbowfish = { IDs = { 220141 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Quiet_River_Bass = { IDs = { 220142 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Dornish_Pike = { IDs = { 220143 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Roaring_Anglerseeker = { IDs = { 220144 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Arathor_Hammerfish = { IDs = { 220145 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Regal_Dottyback = { IDs = { 220146 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Kaheti_Slum_Shark = { IDs = { 220147 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Pale_Huskfish = { IDs = { 220148 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Sanguine_Dogfish = { IDs = { 220149 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Spiked_Sea_Raven = { IDs = { 220150 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Queens_Lurefish = { IDs = { 220151 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Cursed_Ghoulfish = { IDs = { 220152 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Awoken_Coelacanth = { IDs = { 220153 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Goldengill_Trout = { IDs = { 222533 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
}

-- ==========================================
-- COOKING (Prio 1: Vendor, Prio 2: Drop, Prio 3: Crafted)
-- ==========================================
ProfessionsHelperData["The War Within"].Cooking = {
    -- Priority 1: Vendor
    Crunchy_Peppers = { IDs = { 222696 }, sources = { "Vendor" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 0 },
    Coreway_Dust = { IDs = { 222697 }, sources = { "Vendor" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 0 },
    Khaz_Algar_Tomato = { IDs = { 222699 }, sources = { "Vendor" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 0 },
    Granulated_Spices = { IDs = { 222700 }, sources = { "Vendor" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 0 },
    Clumped_Flour = { IDs = { 222701 }, sources = { "Vendor" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 0 },
    Twined_Herbs = { IDs = { 222695 }, sources = { "Vendor" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 0 },
    -- Priority 2: Drop
    Massive_Worm_Flank = { IDs = { 225565 }, sources = { "Drop" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 0 },
    Warped_Wing = { IDs = { 225566 }, sources = { "Drop" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 0 },
    Bug_Brisket = { IDs = { 225567 }, sources = { "Drop" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 0 },
    Slum_Shark_Scrap = { IDs = { 225568 }, sources = { "Drop" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 0 },
    Clipped_Bird_Wing = { IDs = { 225569 }, sources = { "Drop" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 0 },
    Basically_Beef = { IDs = { 223512 }, sources = { "Drop" }, gatheringProf = "Cooking", processingProfs = { "Cooking", "Leatherworking" }, displayCategory = 0 },
    Cinderbee_Belly = { IDs = { 225911 }, sources = { "Drop" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 0 },
    Undermine_Clam_Meat = { IDs = { 235845 }, sources = { "Drop" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 0 },
    -- Priority 3: Crafted
    Chopped_Mycobloom = { IDs = { 222737 }, sources = { "Crafted" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 0 },
    Spiced_Meat_Stock = { IDs = { 222739 }, sources = { "Crafted" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 0 },
    Fresh_Fillet = { IDs = { 222741 }, sources = { "Crafted" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 0 },
    Fine_Egg_Powder = { IDs = { 225876 }, sources = { "Crafted" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 0 },
    Prepared_Ghoulfish = { IDs = { 225883 }, sources = { "Crafted" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 0 },
    Hearty_Food = { IDs = { 222693 }, sources = { "Crafted" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 0, note = "Warband" },
    Hearty_Feast = { IDs = { 228721 }, sources = { "Crafted" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 0, note = "Warband" },
}

-- ==========================================
-- OPTIONAL REAGENTS (Missives & Crests)
-- ==========================================
ProfessionsHelperData["The War Within"].OptionalReagents = {
    Adjustable_Cogwheel = { IDs = { 221920, 221921, 221922 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering" }, displayCategory = 3 },
    Algari_Missive_of_Crafting_Speed = { IDs = { 222635, 222636, 222637 }, sources = { "Crafted" }, gatheringProf = "Enchanting", processingProfs = { "AllProf" }, displayCategory = 3 },
    Algari_Missive_of_Deftness = { IDs = { 222644, 222645, 222646 }, sources = { "Crafted" }, gatheringProf = "Enchanting", processingProfs = { "AllProf" }, displayCategory = 3 },
    Algari_Missive_of_Finesse = { IDs = { 222638, 222639, 222640 }, sources = { "Crafted" }, gatheringProf = "Enchanting", processingProfs = { "AllProf" }, displayCategory = 3 },
    Algari_Missive_of_Ingenuity = { IDs = { 222626, 222627, 222628 }, sources = { "Crafted" }, gatheringProf = "Enchanting", processingProfs = { "AllProf" }, displayCategory = 3 },
    Algari_Missive_of_Multicraft = { IDs = { 222632, 222633, 222634 }, sources = { "Crafted" }, gatheringProf = "Enchanting", processingProfs = { "AllProf" }, displayCategory = 3 },
    Algari_Missive_of_Perception = { IDs = { 222641, 222642, 222643 }, sources = { "Crafted" }, gatheringProf = "Enchanting", processingProfs = { "AllProf" }, displayCategory = 3 },
    Algari_Missive_of_Resourcefulness = { IDs = { 222629, 222630, 222631 }, sources = { "Crafted" }, gatheringProf = "Enchanting", processingProfs = { "AllProf" }, displayCategory = 3 },
    Algari_Missive_of_the_Aurora = { IDs = { 222579, 222580, 222581 }, sources = { "Crafted" }, gatheringProf = "Enchanting", processingProfs = { "AllProf" }, displayCategory = 3 },
    Algari_Missive_of_the_Feverflare = { IDs = { 222582, 222583, 222584 }, sources = { "Crafted" }, gatheringProf = "Enchanting", processingProfs = { "AllProf" }, displayCategory = 3 },
    Algari_Missive_of_the_Fireflash = { IDs = { 222585, 222586, 222587 }, sources = { "Crafted" }, gatheringProf = "Enchanting", processingProfs = { "AllProf" }, displayCategory = 3 },
    Algari_Missive_of_the_Harmonious = { IDs = { 222588, 222589, 222590 }, sources = { "Crafted" }, gatheringProf = "Enchanting", processingProfs = { "AllProf" }, displayCategory = 3 },
    Algari_Missive_of_the_Peerless = { IDs = { 222591, 222592, 222593 }, sources = { "Crafted" }, gatheringProf = "Enchanting", processingProfs = { "AllProf" }, displayCategory = 3 },
    Algari_Missive_of_the_Quickblade = { IDs = { 222594, 222595, 222596 }, sources = { "Crafted" }, gatheringProf = "Enchanting", processingProfs = { "AllProf" }, displayCategory = 3 },
    Blame_Redirection_Device = { IDs = { 221926, 221927, 221928 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    Blessed_Weapon_Grip = { IDs = { 219495, 219496, 219497 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Engineering", "Blacksmithing", "Inscription", "Enchanting" }, displayCategory = 3 },
    Captured_Starlight = { IDs = { 213774, 213775, 213776 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 3 },
    Complicated_Fuse_Box = { IDs = { 221932, 221933, 221934 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    Concealed_Chaos_Module = { IDs = { 221938, 221939, 221940 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    Darkmoon_Sigil_Ascension = { IDs = { 226022, 226023, 226024 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 3 },
    Darkmoon_Sigil_Radiance = { IDs = { 226025, 226026, 226027 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 3 },
    Darkmoon_Sigil_Symbiosis = { IDs = { 226028, 226029, 226030 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 3 },
    Darkmoon_Sigil_Vivacity = { IDs = { 226031, 226032, 226033 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 3 },
    Dawnthread_Lining = { IDs = { 222868, 222869, 222870 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 3 },
    Duskthread_Lining = { IDs = { 222871, 222872, 222873 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 3 },
    Elemental_Focusing_Lens = { IDs = { 213768, 213769, 213770 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 3 },
    Enchanted_Gilded_Harbinger_Crest = { IDs = { 224073 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 3 },
    Enchanted_Runed_Harbinger_Crest = { IDs = { 224072 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 3 },
    Enchanted_Weathered_Harbinger_Crest = { IDs = { 224069 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 3 },
    Writhing_Armor_Banding = { IDs = { 219504, 219505, 219506 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Leatherworking", "Tailoring", "Blacksmithing"  }, displayCategory = 3 },
}

-- ==========================================
-- PARTS (Engine Parts & Scrap)
-- ==========================================
ProfessionsHelperData["The War Within"].Part = {
    -- Priority 1: Vendor
    Assorted_Whirligigs = { IDs = { 227770 }, sources = { "Vendor" }, processingProfs = { "Engineering" }, displayCategory = 2 },
    Blinker_Fluid = { IDs = { 227771 }, sources = { "Vendor" }, processingProfs = { "Engineering" }, displayCategory = 2 },
    Cataclysmic_Converter = { IDs = { 227772 }, sources = { "Vendor" }, processingProfs = { "Engineering" }, displayCategory = 2 },
    -- Priority 2: Drop
    Pile_of_Rusted_Scrap = { IDs = { 219150 }, sources = { "Drop" }, gatheringProf = "Engineering", processingProfs = { "Engineering" }, displayCategory = 2 },
    Handful_of_Bismuth_Bolts = { IDs = { 221853, 221854, 221855 }, sources = { "Crafted", "Drop" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 3 },
    -- Priority 3: Crafted
    Bountiful_Bolts = { IDs = { 227769 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering" }, displayCategory = 3 },
    Chaos_Circuit = { IDs = { 221865, 221866, 221867 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Tailoring" }, displayCategory = 3 },
    Entropy_Enhancer = { IDs = { 221868, 221869, 221870 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering" }, displayCategory = 3 },
    Gyrating_Gear = { IDs = { 221859, 221860, 221861 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering" }, displayCategory = 3 },
    Safety_Switch = { IDs = { 221862, 221863, 221864 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Tailoring" }, displayCategory = 3 },
    Whimsical_Wiring = { IDs = { 221856, 221857, 221858 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Leatherworking", "Blacksmithing" }, displayCategory = 3 },
}

-- ==========================================
-- TRADE GOODS (General Reagents)
-- ==========================================
ProfessionsHelperData["The War Within"].TradeGood = {
    -- Priority 1: Vendor / Currency / Core Drops
    Artisans_Acuity = { IDs = { 210814 }, sources = { "Drop" }, gatheringProf = "AllProf", processingProfs = "AllProf" ,displayCategory = 2 },
    Mosswool_Thread = { IDs = { 224764 }, sources = { "Vendor" }, processingProfs = { "Leatherworking", "Tailoring" }, displayCategory = 2 },
    -- Priority 2: Drop / Quest / Quest Reagents
    Crystalline_Powder = { IDs = { 213610 }, sources = { "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Blacksmithing", "Inscription", "Engineering", "Alchemy", "Enchanting", "Leatherworking", "Skinning" }, displayCategory = 2 },
    Gloomfathom_Hide = { IDs = { 221757 }, sources = { "Drop" }, processingProfs = { "Blacksmithing", "Leatherworking" }, displayCategory = 2 },
    Leyline_Residue = { IDs = { 213613 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Inscription", "Tailoring", "Engineering", "Alchemy", "Herbalism"}, displayCategory = 2 },
    Profaned_Tinderbox = { IDs = { 221758 }, sources = { "Drop", "Vendor" }, processingProfs = { "Leatherworking", "Enchanting", "Alchemy", "Blacksmithing" }, displayCategory = 2 },
    Ringing_Deeps_Ingot = { IDs = { 221754 }, sources = { "Drop", "Currency" },processingProfs = { "Enchanting", "Blacksmithing", "Leatherworking", "Cooking" }, displayCategory = 2 },
    Viridescent_Spores = { IDs = { 213612 }, sources = { "Drop" }, gatheringProf = { "Skinning", "Herbalism"}, processingProfs = { "Inscription", "Alchemy", "Enchanting", "Leatherworking", "Herbalism", "Skinning"}, displayCategory = 2 },
    Writhing_Sample = { IDs = { 213611 }, sources = { "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining"}, processingProfs = { "Inscription", "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Skinning" }, displayCategory = 2 },
    Spark_of_Omens = { IDs = { 211296 }, sources = { "Drop", "Quest" }, displayCategory = 3 },
    -- Priority 3: Crafted
    Coreway_Catalyst = { IDs = { 210815 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = "Alchemy" , displayCategory = 2 },
    Gilded_Vial = { IDs = { 211806, 211807, 211808 }, sources = { "Crafted", "Vendor" }, gatheringProf = "Jewelcrafting",processingProfs = { "Alchemy", "Engineering" }, displayCategory = 3 },
    Ominous_Transmutagen = { IDs = { 211802 }, sources = { "Crafted", "Vendor" }, gatheringProf = "Alchemy", processingProfs = "Alchemy" , displayCategory = 3 },
    Mercurial_Transmutagen = { IDs = { 211803 }, sources = { "Crafted", "Vendor" }, gatheringProf = "Alchemy", processingProfs = "Alchemy" , displayCategory = 3 },
    Volatile_Transmutagen = { IDs = { 211804 }, sources = { "Crafted", "Vendor" }, gatheringProf = "Alchemy", processingProfs = "Alchemy" , displayCategory = 3 },
    Gleaming_Transmutagen = { IDs = { 211805 }, sources = { "Crafted", "Vendor" }, gatheringProf = "Alchemy", processingProfs = "Alchemy" , displayCategory = 3 },
}

-- ==========================================
-- Spells of professions
-- ==========================================

ProfessionsHelperData["The War Within"].Skills = {
    
    --Skinning
    Sharpen_Knife = {spellID = 440977, IDs = { 440977 }, gatheringProf = "Skinning", displayCategory = 5, sources = { "Spell" }},
    Carve_Meat = {spellID = 442615, IDs = { 442615 }, gatheringProf = "Skinning", displayCategory = 5, sources = { "Spell" }},
}