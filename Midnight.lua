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
        Olemba_Lumber = { 
            IDs = {242691}, 
            displayCategory = 2, -- Normales Icon
            gatheringProf = "Woodcutting" 
        },
        Arden_Lumber = { 
            IDs = {251772}, 
            displayCategory = 2, 
            gatheringProf = "Woodcutting" 
        },
        Ashwood_Lumber = { 
            IDs = {251764}, 
            displayCategory = 2, 
            gatheringProf = "Woodcutting" 
        },
        Coldwind_Lumber = { 
            IDs = {251762}, 
            displayCategory = 2, 
            gatheringProf = "Woodcutting" 
        },
        Ironwood_Lumber = { 
            IDs = {245586}, 
            displayCategory = 2, 
            gatheringProf = "Woodcutting" 
        },
        Dornic_Fir_Lumber = { 
            IDs = {248012}, 
            displayCategory = 2, 
            gatheringProf = "Woodcutting" 
        },
        Shadowmoon_Lumber = { 
            IDs = {251766}, 
            displayCategory = 2, 
            gatheringProf = "Woodcutting" 
        },
        Fel_Touched_Lumber = { 
            IDs = {251767}, 
            displayCategory = 2, 
            gatheringProf = "Woodcutting" 
        },
        Bamboo_Lumber = { 
            IDs = {251763}, 
            displayCategory = 2, 
            gatheringProf = "Woodcutting" 
        },
        Darkpine_Lumber = { 
            IDs = {251768}, 
            displayCategory = 2, 
            gatheringProf = "Woodcutting" 
        },
        Dragonpine_Lumber = { 
            IDs = {251773}, 
            displayCategory = 2, 
            gatheringProf = "Woodcutting" 
        },
        Thalassian_Lumber = { 
            IDs = {256963}, 
            displayCategory = 2, 
            gatheringProf = "Woodcutting" 
        },
    }

-- House Decor Items
ProfessionsHelperData["Midnight"].HouseDecor = {
        Shadow_Council_Torch = {IDs = {264706} },           -- Crafted, Alchemy, 3
        Dalaran_Sun_Sconce = {IDs = {264710} },             -- Crafted, Blacksmithing, 3
        Glazed_Sindorei_Vial = {IDs = {264705} },           -- Crafted, Alchemy, 3
        Dalaran_Sewer_Gate = {IDs = {264676} },             -- Crafted, Blacksmithing, 3
        Dornogal_Hanging_Sconce = {IDs = {253039} },        -- Crafted, Enchanting, 3
        Home_Defense_Gadget = {IDs = {264708} },            -- Crafted, Engineering, 3
        Joybuzzs_Joyful_Wall_of_Trains = {IDs = {264711} }, -- Crafted, Engineering, 3
        Resizable_All_Purpose_Gear = {IDs = {264707} },     -- Crafted, Engineering, 3
        Gilnean_Spare_Saddle = {IDs = {264712} },           -- Crafted, Leatherworking, 3
        Nerubian_Alchemists_Retort = {IDs = {257102} },     -- Crafted, Alchemy, 3
        Heart_of_the_Forest_Banner = {IDs = {264713} },     -- Crafted, Tailoring, 3
        Aspirants_Ringed_Banner = {IDs = {264678} },        -- Crafted, Tailoring, 3
        Stranglekelp_Sack = {IDs = {264709} },              -- Crafted, Alchemy, 3
        Rolled_Scarab_Rug = {IDs = {264677} },              -- Crafted, Leatherworking, 3
        Dornogal_Framed_Rug = {IDs = {252755} },            -- Crafted, Tailoring, 3
        Undermine_Bean_Bag_Chair = {IDs = {245305} },       -- Crafted, Tailoring, 3
        Apothecarys_Worktable = {IDs = {257100} },          -- Crafted, Alchemy, 3
        Ardenweald_Lamppost = {IDs = {258237} },            -- Crafted, Enchanting, 3
        Valdrakken_Wall_Shelf = {IDs = {264679} },          -- Crafted, Inscription, 3
        Arcandor_Cutting_Fountain = {IDs = {256680} },      -- Crafted, Alchemy, 3
        Pandaren_Fireplace = {IDs = {247752} },             -- Crafted, Blacksmithing, 3
        Nightspire_Fountain = {IDs = {256681} },            -- Crafted, Enchanting, 3
        Five_Flights_Grimoire = {IDs = {256171} },          -- Crafted, Enchanting, 3
        Starry_Scrying_Pool = {IDs = {257045} },            -- Crafted, Alchemy, 3
        Jade_Temple_Dragon_Fountain = {IDs = {247736} },    -- Crafted, Jewelcrafting, 3
        Darkmasters_Mystical_Brazier = {IDs = {263027} },   -- Crafted, Enchanting, 3
        Gilnean_Problem_Solver = {IDs = {245602} },         -- Crafted, Engineering, 3
        Shaldorei_Open_Air_Tent = {IDs = {248010} },        -- Crafted, Tailoring, 3
        Dalaran_Auto_Hammer = {IDs = {258226} },            -- Crafted, Engineering, 3
        Tirisfal_Hollow_Campfire = {IDs = {253250} },       -- Crafted, Enchanting, 3
        Suramar_Containment_Cell = {IDs = {247923} },       -- Crafted, Enchanting, 3
        Suramar_Dresser = {IDs = {245396} },                -- Crafted, Inscription, 3
        Zanchuli_Tapestry = {IDs = {245418} },              -- Crafted, Tailoring, 3
        Octagonal_Ochre_Window = {IDs = {245559} },         -- Crafted, Jewelcrafting, 3
        Caramel_Mint_Noodle_Dish = {IDs = {246705} },       -- Crafted, Cooking, 3
        Brill_Coffin_Lid = {IDs = {245503} },               -- Crafted, Inscription, 3
        Nightborne_Jewelers_Table = {IDs = {247918} },      -- Crafted, Inscription, 3
        Algari_Fence = {IDs = {253164} },                   -- Crafted, Inscription, 3
        Unity_of_Thorns_Tapestry = {IDs = {257402} },       -- Crafted, Tailoring, 3
        Small_Gilnean_Windmill = {IDs = {257689} },         -- Crafted, Engineering, 3
        Kaheti_Predators_Assortment = {IDs = {245326} },    -- Crafted, Cooking, 3
        Brill_Coffin = {IDs = {245502} },                   -- Crafted, Inscription, 3
        Verdant_Valdrakken_Vase = {IDs = {248111} },        -- Crafted, Alchemy, 3
        Draconic_Circular_Rug = {IDs = {248121} },          -- Crafted, Tailoring, 3
        Failed_Failure_Detection_Pylon = {IDs = {258225} }, -- Crafted, Engineering, 3
        Zuldazar_Fencepost = {IDs = {245416} },             -- Crafted, Inscription, 3
        Dornic_Sliced_Mineloaf = {IDs = {246708} },         -- Crafted, Cooking, 3
        Suramar_Fencepost = {IDs = {247909} },              -- Crafted, Blacksmithing, 3
        Suramar_Fence = {IDs = {247922} },                  -- Crafted, Blacksmithing, 3
        Boulder_Springs_Hot_Tub = {IDs = {252758} },        -- Crafted, Alchemy, 3
        Draenei_Crystal_Forge = {IDs = {257039} },          -- Crafted, Blacksmithing, 3
        Beloved_Raptor_Plushie = {IDs = {258557} },         -- Crafted, Tailoring, 3
        Schmancy_Goblin_String_Lights = {IDs = {246066} },  -- Crafted, Engineering, 3
        Mechagon_Miniature_Artificial_Sun = {IDs = {246500} }, -- Crafted, Engineering, 3
        Stormsong_Stove = {IDs = {252399} },                -- Crafted, Blacksmithing, 3
        Kyrian_Floating_Lamp = {IDs = {262663} },           -- Crafted, Jewelcrafting, 3
        Hungry_Humans_Platter = {IDs = {245428} },          -- Crafted, Cooking, 3
        Shaded_Suramar_Window = {IDs = {245557} },          -- Crafted, Jewelcrafting, 3
        Circular_Shaldorei_Rug = {IDs = {247920} },         -- Crafted, Tailoring, 3
        Literature_of_the_Blue_Dragonflight = {IDs = {248118} }, -- Crafted, Inscription, 3
        Aspirants_Meditation_Pool = {IDs = {257048} },      -- Crafted, Blacksmithing, 3
        Titanic_Tyrhold_Fountain = {IDs = {258253} },       -- Crafted, Engineering, 3
        Dornic_Mine_and_Cheese_Platter = {IDs = {239170} }, -- Crafted, Cooking, 3
        Karabor_Bed = {IDs = {245421} },                    -- Crafted, Tailoring, 3
        Shadowforge_Sconce = {IDs = {246111} },             -- Crafted, Blacksmithing, 3
        Gnomish_Tesla_Mega_Coil = {IDs = {246486} },        -- Crafted, Engineering, 3
        Thaldraszus_Telescope = {IDs = {248113} },          -- Crafted, Engineering, 3
        Brennadam_Grinder = {IDs = {252397} },              -- Crafted, Blacksmithing, 3
        Camp_Narache_Rug = {IDs = {257725} },               -- Crafted, Leatherworking, 3
        Tauren_Soup_Pot = {IDs = {245408} },                -- Crafted, Blacksmithing, 3
        Gilnean_Rocking_Chair = {IDs = {245623} },          -- Crafted, Inscription, 3
        Valdrakken_Storage_Crate = {IDs = {248107} },       -- Crafted, Inscription, 3
        Valdrakken_Fencepost = {IDs = {248110} },           -- Crafted, Jewelcrafting, 3
        Literature_of_the_Green_Dragonflight = {IDs = {248119} }, -- Crafted, Inscription, 3
        Pandaren_Alchemists_Kit = {IDs = {258214} },        -- Crafted, Alchemy, 3
        Sandfury_Diplomats_Banner = {IDs = {258558} },      -- Crafted, Leatherworking, 3
        Lorewalkers_Bookcase = {IDs = {247669} },           -- Crafted, Inscription, 3
        Literature_of_the_Red_Dragonflight = {IDs = {248120} }, -- Crafted, Inscription, 3
        Aldor_Stellar_Console = {IDs = {257093} },          -- Crafted, Enchanting, 3
        Cartel_Ta_Bookcase = {IDs = {258250} },             -- Crafted, Inscription, 3
        Tauren_Fencepost = {IDs = {245407} },               -- Crafted, Leatherworking, 3
        Blackrock_Bunkbed = {IDs = {245432} },              -- Crafted, Leatherworking, 3
        Deactivated_Atomic_Recalibrator = {IDs = {246604} }, -- Crafted, Engineering, 3
        Halfhill_Cookpot = {IDs = {247733} },               -- Crafted, Engineering, 3
        Draenethyst_Sconce = {IDs = {251550} },             -- Crafted, Jewelcrafting, 3
        Dalaran_Street_Sign = {IDs = {258210} },            -- Crafted, Inscription, 3
        Icecrown_Plague_Canister = {IDs = {258213} },       -- Crafted, Alchemy, 3
        Dalaran_Display_Shelves = {IDs = {258224} },        -- Crafted, Inscription, 3
        Orcish_Fence = {IDs = {244313} },                   -- Crafted, Inscription, 3
        Orcish_Banded_Barrel = {IDs = {244317} },           -- Crafted, Inscription, 3
        Tauren_Leather_Fence = {IDs = {245406} },           -- Crafted, Leatherworking, 3
        Zuldazar_Fence = {IDs = {245415} },                 -- Crafted, Inscription, 3
        Small_Mask_of_Bwonsamdi_Loa_of_Graves = {IDs = {245496} }, -- Crafted, Jewelcrafting, 3
        Gilnean_Cauldron = {IDs = {245517} }, -- Crafted, Alchemy, 3
        Lucky_Travelers_Bench = {IDs = {247735} }, -- Crafted, Inscription, 3
        Covered_Square_Suramar_Table = {IDs = {247916} }, -- Crafted, Inscription, 3
        Draenic_Basin = {IDs = {251495} }, -- Crafted, Jewelcrafting, 3
        Replica_Awakening_Machine_Stasis_Pod = {IDs = {253171} }, -- Crafted, Enchanting, 3
        Boralus_Bottle_Lamp = {IDs = {257046} }, -- Crafted, Alchemy, 3
        Mark_of_the_Mages_Eye = {IDs = {257094} }, -- Crafted, Enchanting, 3
        Tempest_Keep_Cryo_Pod = {IDs = {258194} }, -- Crafted, Engineering, 3
        Pandaren_Stone_Wall = {IDs = {245509} }, -- Crafted, Jewelcrafting, 3
        Blackrock_Lamppost = {IDs = {246413} }, -- Crafted, Jewelcrafting, 3
        Mushan_Dumpling_Stack = {IDs = {247220} }, -- Crafted, Cooking, 3
        Valdrakken_Fence = {IDs = {248109} }, -- Crafted, Jewelcrafting, 3
        Algari_Fencepost = {IDs = {253165} }, -- Crafted, Inscription, 3
        Bejeweled_Venthyr_Chalice = {IDs = {257049} }, -- Crafted, Blacksmithing, 3
        Highmountain_Tanners_Frame = {IDs = {257400} }, -- Crafted, Leatherworking, 3
        Scaled_Twilight_Mosaic = {IDs = {257806} }, -- Crafted, Leatherworking, 3
        Kyrian_Anima_Barrel = {IDs = {258240} }, -- Crafted, Engineering, 3
        Ardenweald_Hanging_Baskets = {IDs = {258245} }, -- Crafted, Inscription, 3
        Thunder_Bluff_Totem = {IDs = {258289} }, -- Crafted, Inscription, 3
        Boralus_Style_Lobster_Platter = {IDs = {245484} }, -- Crafted, Cooking, 3
        Pandaren_Wooden_Table = {IDs = {245514} }, -- Crafted, Inscription, 3
        Frostwall_Elevated_Brazier = {IDs = {245534} }, -- Crafted, Inscription, 3
        Ancestral_Signal_Brazier = {IDs = {245601} }, -- Crafted, Enchanting, 3
        Pandaren_Meander_Rug = {IDs = {247738} }, -- Crafted, Tailoring, 3
        Draenethyst_String_Lights = {IDs = {251655} }, -- Crafted, Enchanting, 3
        Venthyr_Anima_Bottle = {IDs = {257098} }, -- Crafted, Enchanting, 3
        Aldor_Bookcase = {IDs = {258199} }, -- Crafted, Inscription, 3
        Silver_Dalaran_Bench = {IDs = {258203} }, -- Crafted, Inscription, 3
        Brokers_Hex_Table = {IDs = {258244} }, -- Crafted, Inscription, 3
        Beloved_Elekk_Plushie = {IDs = {258303} }, -- Crafted, Tailoring, 3
        Well_Lit_Incontinental_Couch = {IDs = {239214} }, -- Crafted, Leatherworking, 3
        Frostwall_Architects_Table = {IDs = {244314} }, -- Crafted, Engineering, 3
        Shredderwheel_Storage_Chest = {IDs = {245323} }, -- Crafted, Blacksmithing, 3
        Drake_Kebab_Platter = {IDs = {247222} }, -- Crafted, Cooking, 3
        Valdrakken_Blossomfruit_Platter = {IDs = {247224} }, -- Crafted, Cooking, 3
        Draenei_Stargazers_Telescope = {IDs = {251482} }, -- Crafted, Engineering, 3
        Freywold_Table = {IDs = {253036} }, -- Crafted, Inscription, 3
        Zandalari_Bottle_Shipment = {IDs = {257047} }, -- Crafted, Alchemy, 3
        Dalaran_Post = {IDs = {258204} }, -- Crafted, Inscription, 3
        Wolvar_Postbag = {IDs = {258205} }, -- Crafted, Leatherworking, 3
        Gilded_Dalaran_Banner = {IDs = {258206} }, -- Crafted, Tailoring, 3
        Sanlayn_Blood_Orb = {IDs = {258212} }, -- Crafted, Alchemy, 3
        Tome_of_Maldraxxian_Rituals = {IDs = {258239} }, -- Crafted, Inscription, 3
        Orcish_Fencepost = {IDs = {245441} }, -- Crafted, Inscription, 3
        Earthen_Hospitality_Cheese_Like_Brick = {IDs = {246709} }, -- Crafted, Cooking, 3
        Dornogal_Bookcase = {IDs = {253022} }, -- Crafted, Inscription, 3
        Valdrakken_Hanging_Cauldron = {IDs = {256430} }, -- Crafted, Blacksmithing, 3
        Orcish_Felblood_Cauldron = {IDs = {257044} }, -- Crafted, Alchemy, 3
        Sintallow_Candles = {IDs = {257051} }, -- Crafted, Alchemy, 3
        Tapestry_of_the_Five_Flights = {IDs = {257053} }, -- Crafted, Tailoring, 3
        Arakkoa_Decoy_Scarecrow = {IDs = {258191} }, -- Crafted, Leatherworking, 3
        Kirin_Tor_Crate = {IDs = {258209} }, -- Crafted, Inscription, 3
        Reconstructed_Mogu_Lightning_Drill = {IDs = {258216} }, -- Crafted, Engineering, 3
        Maldraxxian_Crate = {IDs = {258238} }, -- Crafted, Leatherworking, 3
        Large_Revendreth_Storage_Crate = {IDs = {258247} }, -- Crafted, Inscription, 3
        Tidesages_Totem = {IDs = {258559} }, -- Crafted, Enchanting, 3
        Elder_Rise_Rug = {IDs = {243336} }, -- Crafted, Tailoring, 3
        Zandalari_Skullfire_Lamp = {IDs = {245414} }, -- Crafted, Jewelcrafting, 3
        Blackrock_Weapon_Rack = {IDs = {245436} }, -- Crafted, Blacksmithing, 3
        Tauren_Storage_Chest = {IDs = {245459} }, -- Crafted, Inscription, 3
        Gilded_Zandalari_Table = {IDs = {245499} }, -- Crafted, Inscription, 3
        Dark_Iron_Table_Saw = {IDs = {246410} }, -- Crafted, Engineering, 3
        Steel_Ironforge_Emblem = {IDs = {246489} }, -- Crafted, Blacksmithing, 3
        Serenity_Peak_Tent = {IDs = {247856} }, -- Crafted, Leatherworking, 3
        Valdrakken_Market_Tent = {IDs = {248657} }, -- Crafted, Leatherworking, 3
        Meadery_Storage_Chest = {IDs = {253169} }, -- Crafted, Inscription, 3
        Draconic_Scribes_Basin = {IDs = {256170} }, -- Crafted, Enchanting, 3
        Draenei_Holo_Path = {IDs = {257038} }, -- Crafted, Enchanting, 3
        Stoppered_Black_Potion = {IDs = {257041} }, -- Crafted, Alchemy, 3
        Gilnean_Pitchfork = {IDs = {257042} }, -- Crafted, Blacksmithing, 3
        Pandaren_Alchemists_Retort = {IDs = {257043} }, -- Crafted, Alchemy, 3
        Veil_Secured_Animacone = {IDs = {257050} }, -- Crafted, Alchemy, 3
        Intense_Mogu_Brazier = {IDs = {257097} }, -- Crafted, Enchanting, 3
        Smoke_Lamp = {IDs = {257406} }, -- Crafted, Jewelcrafting, 3
        Standing_Smoke_Lamp = {IDs = {257409} }, -- Crafted, Blacksmithing, 3
        Draenei_Transmitter = {IDs = {258196} }, -- Crafted, Engineering, 3
        Dalaran_Scholars_Bookcase = {IDs = {258207} }, -- Crafted, Inscription, 3
        Margraves_Stitched_Leather_Rug = {IDs = {258248} }, -- Crafted, Leatherworking, 3
        Cartel_Xy_Capture_Crate = {IDs = {258252} }, -- Crafted, Engineering, 3
        Loch_Modan_Bearskin_Rug = {IDs = {242948} }, -- Crafted, Leatherworking, 3
        Orcish_Sleeping_Cot = {IDs = {244323} }, -- Crafted, Leatherworking, 3
        Frostwall_Forge = {IDs = {245600} }, -- Crafted, Blacksmithing, 3
        Gilnean_Wooden_Table = {IDs = {245621} }, -- Crafted, Inscription, 3
        Wooden_Ironforge_Table = {IDs = {246423} }, -- Crafted, Inscription, 3
        Gnomish_Steam_Powered_Bed = {IDs = {246700} }, -- Crafted, Engineering, 3
        Pandaren_Stone_Post = {IDs = {247728} }, -- Crafted, Jewelcrafting, 3
        Suramar_Storage_Crate = {IDs = {247925} }, -- Crafted, Inscription, 3
        Forgeground_Market_Bins = {IDs = {253167} }, -- Crafted, Inscription, 3
        Dragons_Elixir_Bottle = {IDs = {257052} }, -- Crafted, Alchemy, 3
        Stampwhistles_Postal_Portal = {IDs = {257101} }, -- Crafted, Enchanting, 3
        Draenei_Holo_Projector_Pedestal = {IDs = {258193} }, -- Crafted, Engineering, 3
        Draenei_Weavers_Loom = {IDs = {258195} }, -- Crafted, Tailoring, 3
        Gilded_Draenei_Round_Table = {IDs = {258198} }, -- Crafted, Inscription, 3
        Halaa_Bench = {IDs = {258215} }, -- Crafted, Inscription, 3
        Maldraxxian_Runic_Tablet = {IDs = {260699} }, -- Crafted, Jewelcrafting, 3
        Rusting_Bolted_Bench = {IDs = {245312} }, -- Crafted, Blacksmithing, 3
        Square_Pandaren_Table = {IDs = {245513} }, -- Crafted, Inscription, 3
        Valdrakken_Banded_Barrel = {IDs = {248106} }, -- Crafted, Inscription, 3
        Long_Valdrakken_Storage_Crate = {IDs = {248108} }, -- Crafted, Inscription, 3
        Smoke_Sconce = {IDs = {249143} }, -- Crafted, Jewelcrafting, 3
        Boralus_Barrel = {IDs = {252035} }, -- Crafted, Inscription, 3
        Proudmoore_Shipping_Crate = {IDs = {252389} }, -- Crafted, Inscription, 3
        Gundargaz_Candelabra = {IDs = {253253} }, -- Crafted, Jewelcrafting, 3
        Pyrewood_Glass_Bottle = {IDs = {257404} }, -- Crafted, Enchanting, 3
        Snowfall_Tribe_Scare_Totem = {IDs = {257693} }, -- Crafted, Leatherworking, 3
        Gilnean_Green_Potion = {IDs = {257694} }, -- Crafted, Alchemy, 3
        Gilnean_Postbox = {IDs = {257695} }, -- Crafted, Inscription, 3
        Talon_Kings_Totem = {IDs = {258192} }, -- Crafted, Inscription, 3
        Crystal_Signpost = {IDs = {258197} }, -- Crafted, Inscription, 3
        Hollow_Night_Fae_Shrine = {IDs = {258242} }, -- Crafted, Inscription, 3
        Kirin_Tor_Skyline_Banner = {IDs = {258298} }, -- Crafted, Tailoring, 3
        Red_Dazaralor_Rug = {IDs = {243101} }, -- Crafted, Tailoring, 3
        Wooden_Shipping_Crate = {IDs = {244319} }, -- Crafted, Inscription, 3
        Zandalari_Ritual_Drum = {IDs = {245412} }, -- Crafted, Leatherworking, 3
        Gilnean_Wall_Shelf = {IDs = {245622} }, -- Crafted, Inscription, 3
        Kharanos_Bookcase = {IDs = {246420} }, -- Crafted, Inscription, 3
        Ironforge_Chandelier = {IDs = {246488} }, -- Crafted, Jewelcrafting, 3
        Pandaren_Signal_Brazier = {IDs = {247661} }, -- Crafted, Blacksmithing, 3
        Draconic_Nesting_Bed = {IDs = {248114} }, -- Crafted, Leatherworking, 3
        Boralus_Bookshelf = {IDs = {252401} }, -- Crafted, Inscription, 3
        Replica_Rumbling_Wastes_Drill_Pod = {IDs = {253252} }, -- Crafted, Engineering, 3
        Dalaran_Runic_Anvil = {IDs = {257040} }, -- Crafted, Blacksmithing, 3
        Twilight_Fire_Canister = {IDs = {257095} }, -- Crafted, Enchanting, 3
        Gilnean_Map = {IDs = {257696} }, -- Crafted, Inscription, 3
        Outland_Maghar_Banner = {IDs = {258190} }, -- Crafted, Leatherworking, 3
        Kirin_Tor_Sun_Chandelier = {IDs = {258208} }, -- Crafted, Jewelcrafting, 3
        Suramar_Jewelers_Assortment = {IDs = {258227} }, -- Crafted, Jewelcrafting, 3
        Kyrian_Aspirants_Rolled_Cushion = {IDs = {258561} }, -- Crafted, Tailoring, 3
        Hanging_Paper_Lanterns = {IDs = {247731} }, -- Crafted, Inscription, 3
        Wise_Pandarens_Bed = {IDs = {247767} }, -- Crafted, Leatherworking, 3
        Argussian_Circular_Rug = {IDs = {251546} }, -- Crafted, Tailoring, 3
        Bronze_Banner_of_the_Exiled = {IDs = {257035} }, -- Crafted, Blacksmithing, 3
        Pandaren_Table_Lamp = {IDs = {257096} }, -- Crafted, Enchanting, 3
        Shattrath_Lamppost = {IDs = {258201} }, -- Crafted, Jewelcrafting, 3
        Grand_Drape_of_the_Exiles = {IDs = {258202} }, -- Crafted, Tailoring, 3
        Kirin_Tor_Glass_Table = {IDs = {258211} }, -- Crafted, Jewelcrafting, 3
        Drust_Enchanters_Rod = {IDs = {258560} }, -- Crafted, Enchanting, 3
        Wine_Barrel = {IDs = {244318} }, -- Crafted, Alchemy, 3
        Bruffalon_Rib_Platter = {IDs = {247225} }, -- Crafted, Cooking, 3
        Valdrakken_Gilded_Throne = {IDs = {248654} }, -- Crafted, Jewelcrafting, 3
        Draenei_Smiths_Anvil = {IDs = {257036} }, -- Crafted, Blacksmithing, 3
        Draenei_Holo_Dais = {IDs = {257037} }, -- Crafted, Enchanting, 3
        Silvermoon_Spire_Fountain = {IDs = {257420} }, -- Crafted, Alchemy, 3
        Shattrath_Sconce = {IDs = {258200} }, -- Crafted, Jewelcrafting, 3
        Surwich_Expedition_Tent = {IDs = {245618} }, -- Crafted, Tailoring, 3
        Dwarven_District_Banner = {IDs = {246685} }, -- Crafted, Tailoring, 3
        Wingrest_Signal_Brazier = {IDs = {256427} }, -- Crafted, Blacksmithing, 3
        Aspiring_Souls_Chair = {IDs = {258235} }, -- Crafted, Inscription, 3
        Pandaren_Fishing_Net = {IDs = {258302} }, -- Crafted, Tailoring, 3
        Draenei_Crystal_Chandelier = {IDs = {262347} }, -- Crafted, Jewelcrafting, 3
        Zhevra_Stripe_Rug = {IDs = {243327} }, -- Crafted, Leatherworking, 3
        Haranir_Canopy_Bed = {IDs = {263038} }, -- Crafted, Leatherworking, 3
        Wild_Hanging_Scroll = {IDs = {262601} }, -- Crafted, Inscription, 3
}