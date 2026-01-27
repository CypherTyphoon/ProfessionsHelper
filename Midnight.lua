-- TheWarWithin.lua 
-- ProfessionsHelper Item Data

local ADDON_NAME, _ = ...
ProfessionsHelperData = ProfessionsHelperData or {}
ProfessionsHelperData["Midnight"] = {    Config = {
ParentMapIDs = { 
            [2274] = true, -- Khaz Algar (Beinhaltet Insel von Dorn, Schallende Tiefen, Undermine etc.)
            [2371] = true, -- K'aresh (Neuer Kontinent)
        },
        CityMapIDs = { 
            [2339] = true, -- Dornogal
        },
    },
}

-- ==========================================
-- LEATHER
-- ==========================================
ProfessionsHelperData["Midnight"].Leather = {

}

-- ==========================================
-- HERBS
-- ==========================================
ProfessionsHelperData["Midnight"].Herbs = {

}

-- ==========================================
-- ORES & METALS
-- ==========================================
ProfessionsHelperData["Midnight"].Ores = {

}

ProfessionsHelperData["Midnight"].MetalAndStone = {

}

-- ==========================================
-- CLOTH
-- ==========================================
ProfessionsHelperData["Midnight"].Cloth = {

}

-- ==========================================
-- FINISHING REAGENTS
-- ==========================================
ProfessionsHelperData["Midnight"].FinishingReagents = {

}

-- ==========================================
-- INSCRIPTION
-- ==========================================
ProfessionsHelperData["Midnight"].Inscription = {

}

-- ==========================================
-- JEWELCRAFTING (Gems & Glass)
-- ==========================================
ProfessionsHelperData["Midnight"].Jewelcrafting = {

}

-- ==========================================
-- FISHING (DisplayCategory 4)
-- ==========================================
ProfessionsHelperData["Midnight"].Fishing = {

}

-- ==========================================
-- COOKING (Zutaten)
-- ==========================================
ProfessionsHelperData["Midnight"].Cooking = {

}

-- ==========================================
-- OPTIONAL REAGENTS (Missives & Crests)
-- ==========================================
local opt = { sources = { "Crafted" }, displayCategory = 3 }
ProfessionsHelperData["Midnight"].OptionalReagents = {

}

-- ==========================================
-- PARTS (Engine Parts & Scrap)
-- ==========================================
ProfessionsHelperData["Midnight"].Part = {

}

-- ==========================================
-- TRADE GOODS (General Reagents)
-- ==========================================
ProfessionsHelperData["Midnight"].TradeGood = {

}

-- Wood
ProfessionsHelperData["Midnight"].Wood = {
    -- expID Mapping: 0=Classic, 1=BC, 2=WotLK, 3=Cata, 4=MoP, 5=WoD, 6=Legion, 7=BfA, 8=SL, 9=DF, 10=TWW, 11=Midnight
    Olemba_Lumber = { IDs = { 242691 }, expID = 1, sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2 },
    Arden_Lumber = { IDs = { 251772 }, expID = 8, sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2 },
    Ashwood_Lumber = { IDs = { 251764 }, expID = 3, sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2 },
    Coldwind_Lumber = { IDs = { 251762 }, expID = 2, sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2 },
    Ironwood_Lumber = { IDs = { 245586 }, expID = 0, sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2 },
    Dornic_Fir_Lumber = { IDs = { 248012 }, expID = 10, sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2 },
    Shadowmoon_Lumber = { IDs = { 251766 }, expID = 5, sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2 },
    Fel_Touched_Lumber = { IDs = { 251767 }, expID = 6, sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2 },
    Bamboo_Lumber = { IDs = { 251763 }, expID = 4, sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2 },
    Darkpine_Lumber = { IDs = { 251768 }, expID = 7, sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2 },
    Dragonpine_Lumber = { IDs = { 251773 }, expID = 9, sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2 },
    Thalassian_Lumber = { IDs = { 256963 }, expID = 11, sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2 },
}

-- House Decor Items
-- ==========================================
-- HOUSE DECOR (Midnight Edition)
-- ==========================================
ProfessionsHelperData["Midnight"].HouseDecor = {
    -- ------------------------------------------
    -- ALCHEMY
    -- ------------------------------------------
    Shadow_Council_Torch = { IDs = { 264706 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Glazed_Sindorei_Vial = { IDs = { 264705 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Nerubian_Alchemists_Retort = { IDs = { 257102 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Stranglekelp_Sack = { IDs = { 264709 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Apothecarys_Worktable = { IDs = { 257100 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Arcandor_Cutting_Fountain = { IDs = { 256680 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Starry_Scrying_Pool = { IDs = { 257045 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Verdant_Valdrakken_Vase = { IDs = { 248111 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Boulder_Springs_Hot_Tub = { IDs = { 252758 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Icecrown_Plague_Canister = { IDs = { 258213 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Gilnean_Cauldron = { IDs = { 245517 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Boralus_Bottle_Lamp = { IDs = { 257046 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Zandalari_Bottle_Shipment = { IDs = { 257047 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Sanlayn_Blood_Orb = { IDs = { 258212 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Orcish_Felblood_Cauldron = { IDs = { 257044 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Sintallow_Candles = { IDs = { 257051 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Pandaren_Alchemists_Kit = { IDs = { 258214 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Stoppered_Black_Potion = { IDs = { 257041 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Pandaren_Alchemists_Retort = { IDs = { 257043 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Veil_Secured_Animacone = { IDs = { 257050 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Dragons_Elixir_Bottle = { IDs = { 257052 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Wine_Barrel = { IDs = { 244318 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Gilnean_Green_Potion = { IDs = { 257694 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },
    Silvermoon_Spire_Fountain = { IDs = { 257420 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 0 },

    -- ------------------------------------------
    -- BLACKSMITHING
    -- ------------------------------------------
    Dalaran_Sun_Sconce = { IDs = { 264710 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Dalaran_Sewer_Gate = { IDs = { 264676 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Pandaren_Fireplace = { IDs = { 247752 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Suramar_Fencepost = { IDs = { 247909 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Suramar_Fence = { IDs = { 247922 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Draenei_Crystal_Forge = { IDs = { 257039 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Stormsong_Stove = { IDs = { 252399 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Aspirants_Meditation_Pool = { IDs = { 257048 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Shadowforge_Sconce = { IDs = { 246111 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Brennadam_Grinder = { IDs = { 252397 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Tauren_Soup_Pot = { IDs = { 245408 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Bejeweled_Venthyr_Chalice = { IDs = { 257049 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Standing_Smoke_Lamp = { IDs = { 257409 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Dalaran_Runic_Anvil = { IDs = { 257040 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Shredderwheel_Storage_Chest = { IDs = { 245323 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Valdrakken_Hanging_Cauldron = { IDs = { 256430 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Blackrock_Weapon_Rack = { IDs = { 245436 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Steel_Ironforge_Emblem = { IDs = { 246489 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Gilnean_Pitchfork = { IDs = { 257042 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Frostwall_Forge = { IDs = { 245600 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Draenei_Smiths_Anvil = { IDs = { 257036 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Rusting_Bolted_Bench = { IDs = { 245312 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Pandaren_Signal_Brazier = { IDs = { 247661 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Bronze_Banner_of_the_Exiled = { IDs = { 257035 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },
    Wingrest_Signal_Brazier = { IDs = { 256427 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 0 },

    -- ------------------------------------------
    -- ENCHANTING
    -- ------------------------------------------
    Dornogal_Hanging_Sconce = { IDs = { 253039 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },
    Ardenweald_Lamppost = { IDs = { 258237 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },
    Nightspire_Fountain = { IDs = { 256681 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },
    Five_Flights_Grimoire = { IDs = { 256171 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },
    Darkmasters_Mystical_Brazier = { IDs = { 263027 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },
    Tirisfal_Hollow_Campfire = { IDs = { 253250 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },
    Suramar_Containment_Cell = { IDs = { 247923 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },
    Aldor_Stellar_Console = { IDs = { 257093 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },
    Replica_Awakening_Machine_Stasis_Pod = { IDs = { 253171 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },
    Mark_of_the_Mages_Eye = { IDs = { 257094 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },
    Tidesages_Totem = { IDs = { 258559 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },
    Ancestral_Signal_Brazier = { IDs = { 245601 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },
    Draenethyst_String_Lights = { IDs = { 251655 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },
    Venthyr_Anima_Bottle = { IDs = { 257098 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },
    Draconic_Scribes_Basin = { IDs = { 256170 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },
    Draenei_Holo_Path = { IDs = { 257038 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },
    Stampwhistles_Postal_Portal = { IDs = { 257101 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },
    Intense_Mogu_Brazier = { IDs = { 257097 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },
    Twilight_Fire_Canister = { IDs = { 257095 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },
    Drust_Enchanters_Rod = { IDs = { 258560 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },
    Pandaren_Table_Lamp = { IDs = { 257096 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },
    Draenei_Holo_Dais = { IDs = { 257037 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },
    Pyrewood_Glass_Bottle = { IDs = { 257404 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 0 },

    -- ------------------------------------------
    -- ENGINEERING
    -- ------------------------------------------
    Home_Defense_Gadget = { IDs = { 264708 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Joybuzzs_Joyful_Wall_of_Trains = { IDs = { 264711 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Resizable_All_Purpose_Gear = { IDs = { 264707 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Gilnean_Problem_Solver = { IDs = { 245602 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Dalaran_Auto_Hammer = { IDs = { 258226 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Failed_Failure_Detection_Pylon = { IDs = { 258225 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Schmancy_Goblin_String_Lights = { IDs = { 246066 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Mechagon_Miniature_Artificial_Sun = { IDs = { 246500 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Titanic_Tyrhold_Fountain = { IDs = { 258253 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Gnomish_Tesla_Mega_Coil = { IDs = { 246486 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Thaldraszus_Telescope = { IDs = { 248113 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Deactivated_Atomic_Recalibrator = { IDs = { 246604 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Halfhill_Cookpot = { IDs = { 247733 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Tempest_Keep_Cryo_Pod = { IDs = { 258194 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Small_Gilnean_Windmill = { IDs = { 257689 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Kyrian_Anima_Barrel = { IDs = { 258240 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Frostwall_Architects_Table = { IDs = { 244314 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Draenei_Stargazers_Telescope = { IDs = { 251482 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Reconstructed_Mogu_Lightning_Drill = { IDs = { 258216 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Dark_Iron_Table_Saw = { IDs = { 246410 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Draenei_Transmitter = { IDs = { 258196 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Cartel_Xy_Capture_Crate = { IDs = { 258252 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Gnomish_Steam_Powered_Bed = { IDs = { 246700 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Draenei_Holo_Projector_Pedestal = { IDs = { 258193 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },
    Replica_Rumbling_Wastes_Drill_Pod = { IDs = { 253252 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 0 },

    -- ------------------------------------------
    -- INSCRIPTION
    -- ------------------------------------------
    Valdrakken_Wall_Shelf = { IDs = { 264679 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Suramar_Dresser = { IDs = { 245396 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Brill_Coffin_Lid = { IDs = { 245503 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Nightborne_Jewelers_Table = { IDs = { 247918 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Algari_Fence = { IDs = { 253164 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Brill_Coffin = { IDs = { 245502 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Zuldazar_Fencepost = { IDs = { 245416 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Literature_of_the_Blue_Dragonflight = { IDs = { 248118 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Valdrakken_Storage_Crate = { IDs = { 248107 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Literature_of_the_Green_Dragonflight = { IDs = { 248119 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Lorewalkers_Bookcase = { IDs = { 247669 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Literature_of_the_Red_Dragonflight = { IDs = { 248120 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Cartel_Ta_Bookcase = { IDs = { 258250 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Dalaran_Street_Sign = { IDs = { 258210 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Dalaran_Display_Shelves = { IDs = { 258224 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Orcish_Fence = { IDs = { 244313 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Orcish_Banded_Barrel = { IDs = { 244317 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Zuldazar_Fence = { IDs = { 245415 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Lucky_Travelers_Bench = { IDs = { 247735 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Covered_Square_Suramar_Table = { IDs = { 247916 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Algari_Fencepost = { IDs = { 253165 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Ardenweald_Hanging_Baskets = { IDs = { 258245 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Thunder_Bluff_Totem = { IDs = { 258289 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Pandaren_Wooden_Table = { IDs = { 245514 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Frostwall_Elevated_Brazier = { IDs = { 245534 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Aldor_Bookcase = { IDs = { 258199 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Silver_Dalaran_Bench = { IDs = { 258203 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Brokers_Hex_Table = { IDs = { 258244 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Freywold_Table = { IDs = { 253036 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Dalaran_Post = { IDs = { 258204 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Tome_of_Maldraxxian_Rituals = { IDs = { 258239 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Orcish_Fencepost = { IDs = { 245441 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Dornogal_Bookcase = { IDs = { 253022 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Kirin_Tor_Crate = { IDs = { 258209 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Large_Revendreth_Storage_Crate = { IDs = { 258247 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Tauren_Storage_Chest = { IDs = { 245459 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Gilded_Zandalari_Table = { IDs = { 245499 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Meadery_Storage_Chest = { IDs = { 253169 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Dalaran_Scholars_Bookcase = { IDs = { 258207 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Gilnean_Wooden_Table = { IDs = { 245621 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Wooden_Ironforge_Table = { IDs = { 246423 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Suramar_Storage_Crate = { IDs = { 247925 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Forgeground_Market_Bins = { IDs = { 253167 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Gilded_Draenei_Round_Table = { IDs = { 258198 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Halaa_Bench = { IDs = { 258215 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Valdrakken_Banded_Barrel = { IDs = { 248106 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Long_Valdrakken_Storage_Crate = { IDs = { 248108 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Boralus_Barrel = { IDs = { 252035 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Proudmoore_Shipping_Crate = { IDs = { 252389 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Gilnean_Postbox = { IDs = { 257695 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Talon_Kings_Totem = { IDs = { 258192 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Crystal_Signpost = { IDs = { 258197 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Hollow_Night_Fae_Shrine = { IDs = { 258242 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Wooden_Shipping_Crate = { IDs = { 244319 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Gilnean_Wall_Shelf = { IDs = { 245622 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Kharanos_Bookcase = { IDs = { 246420 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Boralus_Bookshelf = { IDs = { 252401 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Gilnean_Map = { IDs = { 257696 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Hanging_Paper_Lanterns = { IDs = { 247731 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Aspiring_Souls_Chair = { IDs = { 258235 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Gilnean_Rocking_Chair = { IDs = { 245623 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },
    Wild_Hanging_Scroll = { IDs = { 262601 }, sources = { "Crafted" }, gatheringProf = "Inscription", displayCategory = 0 },

    -- ------------------------------------------
    -- JEWELCRAFTING
    -- ------------------------------------------
    Jade_Temple_Dragon_Fountain = { IDs = { 247736 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Octagonal_Ochre_Window = { IDs = { 245559 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Kyrian_Floating_Lamp = { IDs = { 262663 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Shaded_Suramar_Window = { IDs = { 245557 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Valdrakken_Fencepost = { IDs = { 248110 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Draenethyst_Sconce = { IDs = { 251550 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Small_Mask_of_Bwonsamdi_Loa_of_Graves = { IDs = { 245496 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Draenic_Basin = { IDs = { 251495 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Pandaren_Stone_Wall = { IDs = { 245509 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Blackrock_Lamppost = { IDs = { 246413 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Valdrakken_Fence = { IDs = { 248109 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Smoke_Lamp = { IDs = { 257406 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Zandalari_Skullfire_Lamp = { IDs = { 245414 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Ironforge_Chandelier = { IDs = { 246488 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Kirin_Tor_Sun_Chandelier = { IDs = { 258208 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Suramar_Jewelers_Assortment = { IDs = { 258227 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Shattrath_Lamppost = { IDs = { 258201 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Kirin_Tor_Glass_Table = { IDs = { 258211 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Maldraxxian_Runic_Tablet = { IDs = { 260699 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Pandaren_Stone_Post = { IDs = { 247728 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Gundargaz_Candelabra = { IDs = { 253253 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Smoke_Sconce = { IDs = { 249143 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Valdrakken_Gilded_Throne = { IDs = { 248654 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Shattrath_Sconce = { IDs = { 258200 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },
    Draenei_Crystal_Chandelier = { IDs = { 262347 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", displayCategory = 0 },

    -- ------------------------------------------
    -- LEATHERWORKING
    -- ------------------------------------------
    Gilnean_Spare_Saddle = { IDs = { 264712 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Rolled_Scarab_Rug = { IDs = { 264677 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Camp_Narache_Rug = { IDs = { 257725 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Sandfury_Diplomats_Banner = { IDs = { 258558 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Tauren_Fencepost = { IDs = { 245407 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Blackrock_Bunkbed = { IDs = { 245432 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Tauren_Leather_Fence = { IDs = { 245406 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Highmountain_Tanners_Frame = { IDs = { 257400 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Scaled_Twilight_Mosaic = { IDs = { 257806 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Outland_Maghar_Banner = { IDs = { 258190 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Well_Lit_Incontinental_Couch = { IDs = { 239214 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Wolvar_Postbag = { IDs = { 258205 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Arakkoa_Decoy_Scarecrow = { IDs = { 258191 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Maldraxxian_Crate = { IDs = { 258238 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Serenity_Peak_Tent = { IDs = { 247856 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Valdrakken_Market_Tent = { IDs = { 248657 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Margraves_Stitched_Leather_Rug = { IDs = { 258248 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Loch_Modan_Bearskin_Rug = { IDs = { 242948 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Orcish_Sleeping_Cot = { IDs = { 244323 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Snowfall_Tribe_Scare_Totem = { IDs = { 257693 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Zandalari_Ritual_Drum = { IDs = { 245412 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Draconic_Nesting_Bed = { IDs = { 248114 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Wise_Pandarens_Bed = { IDs = { 247767 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Zhevra_Stripe_Rug = { IDs = { 243327 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },
    Haranir_Canopy_Bed = { IDs = { 263038 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 0 },

    -- ------------------------------------------
    -- TAILORING
    -- ------------------------------------------
    Heart_of_the_Forest_Banner = { IDs = { 264713 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Aspirants_Ringed_Banner = { IDs = { 264678 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Dornogal_Framed_Rug = { IDs = { 252755 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Undermine_Bean_Bag_Chair = { IDs = { 245305 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Draconic_Circular_Rug = { IDs = { 248121 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Dawnthread_Lining = { IDs = { 222868 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Duskthread_Lining = { IDs = { 222871 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Shaldorei_Open_Air_Tent = { IDs = { 248010 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Zanchuli_Tapestry = { IDs = { 245418 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Unity_of_Thorns_Tapestry = { IDs = { 257402 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Beloved_Raptor_Plushie = { IDs = { 258557 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Circular_Shaldorei_Rug = { IDs = { 247920 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Karabor_Bed = { IDs = { 245421 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Tapestry_of_the_Five_Flights = { IDs = { 257053 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Elder_Rise_Rug = { IDs = { 243336 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Pandaren_Meander_Rug = { IDs = { 247738 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Beloved_Elekk_Plushie = { IDs = { 258303 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Gilded_Dalaran_Banner = { IDs = { 258206 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Draenei_Weavers_Loom = { IDs = { 258195 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Kirin_Tor_Skyline_Banner = { IDs = { 258298 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Red_Dazaralor_Rug = { IDs = { 243101 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Kyrian_Aspirants_Rolled_Cushion = { IDs = { 258561 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Argussian_Circular_Rug = { IDs = { 251546 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Grand_Drape_of_the_Exiles = { IDs = { 258202 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Surwich_Expedition_Tent = { IDs = { 245618 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Dwarven_District_Banner = { IDs = { 246685 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },
    Pandaren_Fishing_Net = { IDs = { 258302 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 0 },

    -- ------------------------------------------
    -- COOKING
    -- ------------------------------------------
    Caramel_Mint_Noodle_Dish = { IDs = { 246705 }, sources = { "Crafted" }, gatheringProf = "Cooking", displayCategory = 0 },
    Kaheti_Predators_Assortment = { IDs = { 245326 }, sources = { "Crafted" }, gatheringProf = "Cooking", displayCategory = 0 },
    Dornic_Sliced_Mineloaf = { IDs = { 246708 }, sources = { "Crafted" }, gatheringProf = "Cooking", displayCategory = 0 },
    Hungry_Humans_Platter = { IDs = { 245428 }, sources = { "Crafted" }, gatheringProf = "Cooking", displayCategory = 0 },
    Dornic_Mine_and_Cheese_Platter = { IDs = { 239170 }, sources = { "Crafted" }, gatheringProf = "Cooking", displayCategory = 0 },
    Mushan_Dumpling_Stack = { IDs = { 247220 }, sources = { "Crafted" }, gatheringProf = "Cooking", displayCategory = 0 },
    Boralus_Style_Lobster_Platter = { IDs = { 245484 }, sources = { "Crafted" }, gatheringProf = "Cooking", displayCategory = 0 },
    Drake_Kebab_Platter = { IDs = { 247222 }, sources = { "Crafted" }, gatheringProf = "Cooking", displayCategory = 0 },
    Valdrakken_Blossomfruit_Platter = { IDs = { 247224 }, sources = { "Crafted" }, gatheringProf = "Cooking", displayCategory = 0 },
    Earthen_Hospitality_Cheese_Like_Brick = { IDs = { 246709 }, sources = { "Crafted" }, gatheringProf = "Cooking", displayCategory = 0 },
    Bruffalon_Rib_Platter = { IDs = { 247225 }, sources = { "Crafted" }, gatheringProf = "Cooking", displayCategory = 0 },
}

-- ==========================================
-- Spells of professions
-- ==========================================

ProfessionsHelperData["Midnight"].Skills = {
    --Skinning
    Sharpen_Knife = {spellID = 440977, IDs = { 440977 }, gatheringProf = "Skinning", displayCategory = 5, sources = { "Spell" }},
    Carve_Meat = {spellID = 442615, IDs = { 442615 }, gatheringProf = "Skinning", displayCategory = 5, sources = { "Spell" }},
}