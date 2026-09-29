-- Midnight.lua 
-- ProfessionsHelper Item Data

local ADDON_NAME, _ = ...
ProfessionsHelperData = ProfessionsHelperData or {}
ProfessionsHelperData["Midnight"] = {    
    Config = {
        ParentMapIDs = { 
            [2537] = true, -- Quel'Thalas 
            [2395] = false, -- Immersangwald
            [2405] = false, -- Leerensturm
            [2413] = false, -- Harandar
        },
        CityMapIDs = { 
            [2393] = true, -- "Neu"-Silbermond
        },
    },
}

-- ========================================
-- Ressources
-- ==========================================
-- Gathered + Vendor (sources = Drop, Vendor, gatheringProf= Mining, Skinning, Herbalism, Fishing, Cooking)

ProfessionsHelperData["Midnight"].Herbs = {
    Tranquility_Bloom = { IDs = { 236761, 236767 }, color = "#C0C0C0", sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Herbalism", "Leatherworking" }, displayCategory = 1 },
    Sanguithorn = { IDs = { 236770, 236771 }, color = "#8B0000", sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Cooking", "Alchemy" }, displayCategory = 1 },
    Azeroot = { IDs = { 236774, 236775 }, color = "#0070DE", sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Cooking", "Inscription", "Enchanting", "Alchemy" }, displayCategory = 1 },
    Argentleaf = { IDs = { 236776, 236777 }, color = "#E6E6E6", sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Cooking", "Alchemy" }, canExperiment = true, displayCategory = 1 },
    Mana_Lily = { IDs = { 236778, 236779 }, color = "#A335EE", sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Cooking", "Alchemy" }, canExperiment = true, displayCategory = 1 },
    Nocturnal_Lotus = { IDs = { 236780 }, color = "#4B0082", sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Leatherworking" }, canExperiment = true, displayCategory = 1 },
}

ProfessionsHelperData["Midnight"].Ores = {
    Refulgent_Copper_Ore = { IDs = { 237359, 237361 }, color = "#B87333", sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Jewelcrafting", "Blacksmithing", "Engineering" }, displayCategory = 1 },
    Umbral_Tin_Ore = { IDs = { 237362, 237363 }, color = "#7F7F7F", sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Jewelcrafting", "Blacksmithing", "Engineering" }, displayCategory = 1 },
    Brilliant_Silver_Ore = { IDs = { 237364, 237365 }, color = "#C0C0C0", sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Blacksmithing" }, displayCategory = 1 },
    Dazzling_Thorium = { IDs = { 237366 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 2 },
}

ProfessionsHelperData["Midnight"].Leather = {
    VoidTempered_Leather = { IDs = { 238511, 238512 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    VoidTempered_Scales = { IDs = { 238513, 238514 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    VoidTempered_Hide = { IDs = { 238518, 238519 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Engineering", "Leatherworking", "Alchemy", "Jewelcrafting" }, displayCategory = 1 },
    VoidTempered_Plating = { IDs = { 238520, 238521 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Engineering", "Leatherworking" }, displayCategory = 1 },

    -- Beast-Parts
    Majestic_Claw = { IDs = { 238528 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Inscription", "Enchanting", "Leatherworking", "Engineering", "Blacksmithing" }, displayCategory = 2 },
    Majestic_Hide = { IDs = { 238529 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Inscription", "Leatherworking", "Enchanting", "Engineering", "Jewelcrafting", "Blacksmithing" }, displayCategory = 2 },
    Majestic_Fin = { IDs = { 238530 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Inscription", "Enchanting", "Engineering", "Leatherworking", "Blacksmithing" }, displayCategory = 2 },
    Peerless_Plumage = { IDs = { 238522 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Enchanting", "Tailoring" }, displayCategory = 2 },
    Carving_Canine = { IDs = { 238523 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Enchanting", "Tailoring" }, displayCategory = 2 },
    Fantastic_Fur = { IDs = { 238525 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Tailoring", "Alchemy", "Leatherworking", "Enchanting" }, displayCategory = 2 },
}

ProfessionsHelperData["Midnight"].Cloth = {
    -- Category 2: Material-Icons (Vendor / Hilfsmittel)
    Embroidery_Floss = { IDs = { 251691 }, sources = { "Vendor" }, processingProfs = { "Tailoring" }, displayCategory = 2 },
    Silverleaf_Thread = { IDs = { 251665 }, sources = { "Vendor" }, processingProfs = { "Tailoring", "Leatherworking", "Jewelcrafting", "Enchanting" }, displayCategory = 2 },

    -- Category 1: Sammel-Balken
    Sunfire_Silk = { IDs = { 237015, 237016 }, color = "#FFD700", sources = { "Drop" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 1 },
    Arcanoweave = { IDs = { 237017, 237018 }, color = "#3F00FF", sources = { "Drop" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 1 },
    Bright_Linen = { IDs = { 236963, 236965 }, color = "#F5F5DC", sources = { "Drop" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 1 },
}

ProfessionsHelperData["Midnight"].Fishing = {
    Sin_dorei_Swarmer = { IDs = { 238365 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Fishing", "Cooking", "Alchemy" }, displayCategory = 4 },
    Lynxfish = { IDs = { 238366 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Skinning", "Cooking" }, displayCategory = 4 },
    Root_Crab = { IDs = { 238367 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Skinning", "Cooking" }, displayCategory = 4 },
    Twisted_Tetra = { IDs = { 238368 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Bloomtail_Minnow = { IDs = { 238369 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking", "Alchemy" }, displayCategory = 4 },
    Shimmer_Spinefish = { IDs = { 238370 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Arcane_Wyrmfish = { IDs = { 238371 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Fishing", "Skinning" }, displayCategory = 4 },
    Restored_Songfish = { IDs = { 238372 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Ominous_Octopus = { IDs = { 238373 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking", "Skinning" }, displayCategory = 4 },
    Fungalskin_Pike = { IDs = { 238375 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Skinning", "Alchemy" }, canExperiment = true, displayCategory = 4 },
    Lucky_Loa = { IDs = { 238376 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Blood_Hunter = { IDs = { 238377 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking", "Fishing" }, displayCategory = 4 },
    Shimmersiren = { IDs = { 238378 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Warping_Wise = { IDs = { 238379 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Null_Voidfish = { IDs = { 238380 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Skinning", "Fishing", "Alchemy" }, canExperiment = true, displayCategory = 4 },
    Hollow_Grouper = { IDs = { 238381 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Gore_Guppy = { IDs = { 238382 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Fishing", "Skinning" }, displayCategory = 4 },
    Eversong_Trout = { IDs = { 238383 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking", "Alchemy" }, displayCategory = 4 },
    Sunwell_Fish = { IDs = { 238384 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },

    Spotted_Killifish = { IDs = { 274587 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Toxic_Tlhapi = { IDs = { 274588 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Ula_tek_Snakehead = { IDs = { 274589 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking", "Leatherworking" }, displayCategory = 4 },
    Sulfurous_Sludgefish = { IDs = { 274590 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Fishing", "Cooking" }, displayCategory = 4 },
    Dirty_Darter = { IDs = { 274592 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Fishing", "Cooking" }, displayCategory = 4 },
    Polluted_Puffer = { IDs = { 274594 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Pristine_Polygon = { IDs = { 274595 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Fishing" }, displayCategory = 4 },
    Beached_Asteroid = { IDs = { 274596 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Fishing" }, displayCategory = 4 },
    Bulbous_Benthos = { IDs = { 274597 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Fishing" }, displayCategory = 4 },
    Oozing_Goby = { IDs = { 279091 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Giggling_Skull = { IDs = { 279093 }, sources = { "Drop" }, gatheringProf = "Fishing", displayCategory = 4 },
    Grotesque_Sturgeon = { IDs = { 279094 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Many_Eyed_Flounder = { IDs = { 279100 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Twin_Headed_Snipefish = { IDs = { 279105 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Loathsome_Anglerfish = { IDs = { 279106 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Blackened_Sludgefish = { IDs = { 279207 }, sources = { "Drop" }, gatheringProf = "Fishing", displayCategory = 4 },
}

ProfessionsHelperData["Midnight"].Wood = {
    -- expID Mapping: 0=Classic, 1=BC, 2=WotLK, 3=Cata, 4=MoP, 5=WoD, 6=Legion, 7=BfA, 8=SL, 9=DF, 10=TWW, 11=Midnight
    Ironwood_Lumber      = { IDs = { 245586 }, expID = 0,  sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2, achievementID = 62357 },
    Olemba_Lumber        = { IDs = { 242691 }, expID = 1,  sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2, achievementID = 62358 },
    Coldwind_Lumber      = { IDs = { 251762 }, expID = 2,  sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2, achievementID = 62359 },
    Ashwood_Lumber       = { IDs = { 251764 }, expID = 3,  sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2, achievementID = 62360 },
    Bamboo_Lumber        = { IDs = { 251763 }, expID = 4,  sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2, achievementID = 62361 },
    Shadowmoon_Lumber    = { IDs = { 251766 }, expID = 5,  sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2, achievementID = 62362 },
    Fel_Touched_Lumber   = { IDs = { 251767 }, expID = 6,  sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2, achievementID = 62363 },
    Darkpine_Lumber      = { IDs = { 251768 }, expID = 7,  sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2, achievementID = 62364 },
    Arden_Lumber         = { IDs = { 251772 }, expID = 8,  sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2, achievementID = 62365 },
    Dragonpine_Lumber    = { IDs = { 251773 }, expID = 9,  sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2, achievementID = 62366 },
    Dornic_Fir_Lumber    = { IDs = { 248012 }, expID = 10, sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2, achievementID = 62369 },
    Thalassian_Lumber    = { IDs = { 256963 }, expID = 11, sources = { "Drop" }, gatheringProf = "Woodcutting", displayCategory = 2, achievementID = 62370 },
}

ProfessionsHelperData["Midnight"].VendorDrop = {
    -- Vendor Materials
    Luminant_Flux = { IDs = { 243060 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Blacksmithing" }, displayCategory = 2 },
    Fused_Vitality = { IDs = { 245345 }, sources = { "Vendor" }, processingProfs = { "Jewelcrafting", "Engineering", "Inscription", "Blacksmithing", "Leatherworking", "Tailoring" }, displayCategory = 2 },
    Lexicologists_Vellum = { IDs = { 245881 }, sources = { "Vendor" }, processingProfs = { "Inscription", "Enchanting" }, displayCategory = 2 },
    Thalassian_Songwater = { IDs = { 245882 }, sources = { "Vendor" }, processingProfs = { "Inscription", "Enchanting" }, displayCategory = 2 },
    Oil_of_Heartwood = { IDs = { 247811 }, sources = { "Vendor" }, processingProfs = { "Alchemy" }, displayCategory = 2 },
    Malleable_Wireframe = { IDs = { 253302 }, sources = { "Vendor" }, processingProfs = { "Engineering" }, displayCategory = 2 },
    Pile_of_Junk = { IDs = { 253303 }, sources = { "Vendor" }, processingProfs = { "Engineering" }, displayCategory = 2 },

    -- Drop & Craft Materials
    Artisans_Moxie = { IDs = { 237505 }, sources = { "Drop" }, gatheringProf = "AllProf", processingProfs = { "AllProf" }, displayCategory = 2 },
    Pure_Loanite = { IDs = { 239611 }, sources = { "Drop" }, displayCategory = 2 },
    Apprentices_Scribbles = { IDs = { 246447 }, sources = { "Drop" }, gatheringProf = "AllProf", processingProfs = { "AllProf" }, displayCategory = 2 },
    Artisans_Ledger = { IDs = { 246448 }, sources = { "Drop", "Crafted" }, gatheringProf = "AllProf", processingProfs = { "AllProf" }, displayCategory = 2 },
    Mentors_Helpful_Handiwork = { IDs = { 246449 }, sources = { "Drop", "Crafted" }, gatheringProf = "AllProf", processingProfs = { "AllProf" }, displayCategory = 2 },
    Artisans_Consortium_Gold_Star = { IDs = { 246450 }, sources = { "Drop", "Crafted" }, gatheringProf = "AllProf", processingProfs = { "AllProf" }, displayCategory = 2 },
    Petrified_Root = { IDs = { 251285 }, sources = { "Drop" }, processingProfs = { "Tailoring", "Leatherworking", "Alchemy" }, displayCategory = 2 },
    Tormented_Tantalum = { IDs = { 251283 }, sources = { "Drop" }, processingProfs = { "Tailoring", "Leatherworking", "Blacksmithing", "Jewelcrafting" }, displayCategory = 2 },
    Thalassian_Essence_of_the_Faire = { IDs = { 251923 }, sources = { "Drop" }, processingProfs = { "Inscription" }, displayCategory = 2 },

    -- PvP Materials
    Infused_Heliotrope = { IDs = { 253307 }, sources = { "Drop", "Vendor" }, processingProfs = { "Jewelcrafting" }, displayCategory = 2 },
    Galactic_Combatants_Heraldry = { IDs = { 256559 }, sources = { "Drop", "Vendor" }, processingProfs = { "Jewelcrafting", "Inscription", "Blacksmithing", "Leatherworking", "Tailoring", "Engineering" }, displayCategory = 2 },
    Galactic_Aspirants_Heraldry = { IDs = { 256607 }, sources = { "Drop", "Vendor" }, processingProfs = { "Jewelcrafting", "Inscription", "Blacksmithing", "Leatherworking", "Tailoring", "Engineering" }, displayCategory = 2 },
}


-- ==========================================
-- Materials
-- ==========================================
-- Crafted - Items (sources = Crafted; gatheringProf = <Category> (Herbalism, Skinning, Cooking, Leatherworking, Blacksmithing, Engineering, Enchanting, Inscription, Tailoring, Jewelcrafting))

ProfessionsHelperData["Midnight"].Herbalism = {
    -- Mulch
    Magical_Mulch = { IDs = { 238387 }, sources = { "Crafted" }, gatheringProf = "Herbalism", processingProfs = { "Herbalism" }, displayCategory = 3 },
    Imbued_Mulch = { IDs = { 238388 }, sources = { "Crafted" }, gatheringProf = "Herbalism", processingProfs = { "Herbalism" }, displayCategory = 3 },
    Empowered_Mulch = { IDs = { 238389 }, sources = { "Crafted" }, gatheringProf = "Herbalism", processingProfs = { "Herbalism" }, displayCategory = 3 },
}

ProfessionsHelperData["Midnight"].Skinning = {
    Neutralized_Venom_Clot = { IDs = { 274777 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Cooking", "Alchemy", "Leatherworking", "Engineering", "Blacksmithing", "Jewelcrafting", "Fishing", "Tailoring", "Enchanting", "Inscription" }, displayCategory = 2 },
}

ProfessionsHelperData["Midnight"].Cooking = {
    -- Drop
    Practically_Pork = { IDs = { 242639 }, sources = { "Drop" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 2 },
    Plant_Protein = { IDs = { 242640 }, sources = { "Drop" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 2 },
    Earthy_Garnish = { IDs = { 265800 }, sources = { "Drop" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 2 },
    Savory_Anomaly = { IDs = { 265801 }, sources = { "Drop" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 2 },
    Bazaar_Bites = { IDs = { 265803 }, sources = { "Drop" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 2 },

    -- Vendor
    Cooking_Spirits = { IDs = { 242641 }, sources = { "Vendor" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 2 },
    Thalassian_Herbs = { IDs = { 242642 }, sources = { "Vendor" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 2 },
    A_Big_Ol_Stick_of_Butter = { IDs = { 242643 }, sources = { "Vendor" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 2 },
    Mana_Wyrm_Essence = { IDs = { 242644 }, sources = { "Vendor" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 2 },
    Ripened_Vegetable_Assortment = { IDs = { 242645 }, sources = { "Vendor" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 2 },
    Pouch_of_Spices = { IDs = { 242646 }, sources = { "Vendor" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 2 },

    -- Crafted
    Thalassian_Filet = { IDs = { 253403 }, color = "#FA8072", sources = { "Crafted" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 2 },

    -- House Decor
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

ProfessionsHelperData["Midnight"].Leatherworking = {
-- Crafting Materials
    Scalewoven_Hide = { IDs = { 244631, 244632 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Leatherworking" }, displayCategory = 3 },
    Infused_Scalewoven_Hide = { IDs = { 244633, 244634 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Leatherworking", "Jewelcrafting" }, displayCategory = 3 },
    Sin_dorei_Armor_Banding = { IDs = { 244635, 244636 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Leatherworking", "Blacksmithing" }, displayCategory = 3 },

    -- Optional Reagents
    Blessed_Pango_Charm = { IDs = { 244603, 244604 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Tailoring", "Inscription", "Blacksmithing", "Leatherworking", "Enchanting", "Jewelcrafting" }, displayCategory = 3 },
    Primal_Spore_Binding = { IDs = { 244607, 244608 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Tailoring", "Inscription", "Blacksmithing", "Leatherworking", "Enchanting" }, displayCategory = 3 },
    Silvermoon_Weapon_Wrap = { IDs = { 244637, 244638 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Jewelcrafting", "Blacksmithing", "Enchanting" }, displayCategory = 3 },
    Devouring_Banding = { IDs = { 244674, 244675 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Tailoring", "Inscription", "Blacksmithing", "Leatherworking", "Enchanting" }, displayCategory = 3 },

    -- Endproduct (Armor Kits)
    Forest_Hunters_Armor_Kit = { IDs = { 244640, 244641 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },
    Blood_Knights_Armor_Kit = { IDs = { 244642, 244643 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },

}

ProfessionsHelperData["Midnight"].Blacksmithing = {
    -- Alloys
    Refulgent_Copper_Ingot = { IDs = { 238197, 238198 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Blacksmithing", "Enchanting" }, displayCategory = 3 },
    Gloaming_Alloy = { IDs = { 238202, 238203 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Blacksmithing", "Enchanting", "Leatherworking" }, displayCategory = 3 },
    Sterling_Alloy = { IDs = { 238204, 238205 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Blacksmithing", "Enchanting" }, displayCategory = 3 },

    -- Frameworks
}

ProfessionsHelperData["Midnight"].Engineering = {
-- Category 2: Icons (Drop / Vendor)
    Aetherlume = { IDs = { 243578, 243579 }, sources = { "Drop" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Leatherworking" }, displayCategory = 2 },
    Evercore = { IDs = { 243581, 243582 }, sources = { "Drop" }, gatheringProf = "Engineering", processingProfs = { "Engineering" }, displayCategory = 2 },
    Malleable_Wireframe = { IDs = { 253302 }, sources = { "Vendor" }, gatheringProf = "Engineering", processingProfs = { "Engineering" }, displayCategory = 2 },

    -- Category 3: Crafting Materials
    Song_Gear = { IDs = { 243574, 243575 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering" }, displayCategory = 3 },
    Soul_Sprocket = { IDs = { 243576, 243577 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering" }, displayCategory = 3 },

    -- Optional Reagents
    Flux_Cogwheel = { IDs = { 244697, 244698 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering" }, displayCategory = 3 },
    Greased_Cogwheel = { IDs = { 244699, 244700 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering" }, displayCategory = 3 },
    Perfected_Cogwheel = { IDs = { 244701, 244702 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering" }, displayCategory = 3 },
    Consistent_Cogwheel = { IDs = { 244703, 244704 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering" }, displayCategory = 3 },
    Mini_Medical_Team = { IDs = { 244705, 244706 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering" }, displayCategory = 3 },
    Lucky_Keychain = { IDs = { 248130 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Tailoring", "Engineering", "Inscription", "Blacksmithing", "Leatherworking", "Enchanting", "Jewelcrafting" }, displayCategory = 3 },
    Kinetic_Ankle_Primers = { IDs = { 248132, 248133 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering" }, displayCategory = 3 },
    B1P_Scorcher_of_Souls = { IDs = { 248135, 248592 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering" }, displayCategory = 3 },
    M3DDY_Travel_Sized = { IDs = { 248136 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering" }, displayCategory = 3 },
    HU5H_Nonchalant_Pup = { IDs = { 255843, 255844 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering" }, displayCategory = 3 },
    M0LL1_Atomic_Anomaly = { IDs = { 257733, 257734 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering" }, displayCategory = 3 },
    B0P_Curator_of_Booms = { IDs = { 257735, 257741 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering" }, displayCategory = 3 },
}

ProfessionsHelperData["Midnight"].Tailoring = {
-- Bolts (Category 1 - Balkenanzeige mit Farben)
    Arcanoweave_Bolt = { IDs = { 239198, 239200 }, color = "#3F00FF", sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring", "Enchanting" }, displayCategory = 1 },
    Sunfire_Silk_Bolt = { IDs = { 239201, 239202 }, color = "#FFD700", sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring", "Enchanting" }, displayCategory = 1 },
    Bright_Linen_Bolt = { IDs = { 239700, 239701 }, color = "#F5F5DC", sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 1 },
    Imbued_Bright_Linen_Bolt = { IDs = { 239702, 239703 }, color = "#E0FFFF", sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring", "Engineering" }, displayCategory = 1 },

    -- Optional Reagents (Category 3 - Icons)
    Sunfire_Silk_Lining = { IDs = { 240164, 240165 }, sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring", "Blacksmithing", "Leatherworking" }, displayCategory = 3 },
    Arcanoweave_Lining = { IDs = { 240166, 240167 }, sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring", "Blacksmithing", "Leatherworking" }, displayCategory = 3 },
}

ProfessionsHelperData["Midnight"].Alchemy = {
    -- Crafting Materials
    Mote_of_Light = { IDs = { 236949 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Tailoring", "Leatherworking", "Engineering", "Inscription", "Enchanting", "Alchemy", "Jewelcrafting" }, displayCategory = 3 },
    Mote_of_Primal_Energy = { IDs = { 236950 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Tailoring", "Cooking", "Inscription", "Alchemy", "Enchanting", "Jewelcrafting", "Leatherworking" }, canExperiment = true, displayCategory = 3 },
    Mote_of_Wild_Magic = { IDs = { 236951 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Tailoring", "Leatherworking", "Inscription", "Alchemy", "Enchanting", "Cooking", "Skinning" }, displayCategory = 3 },
    Mote_of_Pure_Void = { IDs = { 236952 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Tailoring", "Engineering", "Leatherworking", "Enchanting", "Alchemy", "Jewelcrafting", "Inscription", "Skinning" }, canExperiment = true, displayCategory = 3 },
    
    Stabilized_Derivate = { IDs = { 242651 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Alchemy" }, canExperiment = true, displayCategory = 3 },

    -- Finishing Reagents / Intermediate
    Composite_Flora = { IDs = { 241280, 241281 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Alchemy", "Leatherworking" }, displayCategory = 3 },
    Wondrous_Synergist = { IDs = { 241282, 241283 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Alchemy" }, displayCategory = 3 },

    -- Endproduct or Others (Platzhalter für Elixiere/Tränke/Experimente)
}

ProfessionsHelperData["Midnight"].Enchanting = {
    -- Basic Materials (Category 1 - Balkenanzeige)
    Eversinging_Dust = { IDs = { 243599, 243600 }, color = "#FFD700", sources = { "Drop" }, gatheringProf = "Enchanting", processingProfs = { "Alchemy", "Tailoring", "Enchanting" }, canExperiment = true, displayCategory = 1 },
    Radiant_Shard = { IDs = { 243602, 243603 }, color = "#00BFFF", sources = { "Drop" }, gatheringProf = "Enchanting", processingProfs = { "Enchanting", "Tailoring" }, displayCategory = 1 },
    Dawn_Crystal = { IDs = { 243605, 243606 }, color = "#FF8C00", sources = { "Drop" }, gatheringProf = "Enchanting", processingProfs = { "Enchanting", "Jewelcrafting" }, displayCategory = 1 },

    -- Optional Reagents
    -- Finishing Reagents
}

ProfessionsHelperData["Midnight"].Inscription = {
    -- Pigments (Category 1 - Balkenanzeige mit Farben)
    Argentleaf_Pigment = { IDs = { 245803, 245804 }, color = "#E6E6E6", sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Inscription" }, displayCategory = 1 },
    Powder_Pigment = { IDs = { 245807, 245808 }, color = "#F5F5F5", sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Inscription" }, displayCategory = 1 },
    Sanguithorn_Pigment = { IDs = { 245864, 245865 }, color = "#8B0000", sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Inscription" }, displayCategory = 1 },
    Mana_Lily_Pigment = { IDs = { 245866, 245867 }, color = "#A335EE", sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Inscription" }, displayCategory = 1 },

    -- Inks (Category 3 - Icons)
    Munsell_Ink = { IDs = { 245801, 245802 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Inscription" }, displayCategory = 3 },
    Sienna_Ink = { IDs = { 245805, 245806 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Inscription" }, displayCategory = 3 },

    -- Inscribed Items
    Codified_Azeroot = { IDs = { 245764, 245765 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Inscription" }, displayCategory = 3 },
    Soul_Cipher = { IDs = { 245766, 245767 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Inscription" }, displayCategory = 3 },

    -- Missives (Optional Reagents)
    Thalassian_Missive_of_the_Aurora = { IDs = { 245781, 245782 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Tailoring", "Inscription", "Blacksmithing", "Leatherworking", "Enchanting", "Jewelcrafting" }, displayCategory = 3 },
    Thalassian_Missive_of_the_Feverflare = { IDs = { 245783, 245784 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Tailoring", "Inscription", "Blacksmithing", "Leatherworking", "Enchanting", "Jewelcrafting" }, displayCategory = 3 },
    Thalassian_Missive_of_the_Fireflash = { IDs = { 245785, 245786 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Tailoring", "Inscription", "Blacksmithing", "Leatherworking", "Enchanting", "Jewelcrafting" }, displayCategory = 3 },
    Thalassian_Missive_of_the_Harmonious = { IDs = { 245787, 245788 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Tailoring", "Inscription", "Blacksmithing", "Leatherworking", "Enchanting", "Jewelcrafting" }, displayCategory = 3 },
    Thalassian_Missive_of_the_Peerless = { IDs = { 245789, 245790 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Tailoring", "Inscription", "Blacksmithing", "Leatherworking", "Enchanting", "Jewelcrafting" }, displayCategory = 3 },
    Thalassian_Missive_of_the_Quickblade = { IDs = { 245791, 245792 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Tailoring", "Inscription", "Blacksmithing", "Leatherworking", "Enchanting", "Jewelcrafting" }, displayCategory = 3 },
    Thalassian_Missive_of_Ingenuity = { IDs = { 245814, 245815 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Engineering", "Inscription", "Enchanting", "Blacksmithing" }, displayCategory = 3 },
    Thalassian_Missive_of_Resourcefulness = { IDs = { 245816, 245817 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Engineering", "Inscription", "Enchanting", "Blacksmithing" }, displayCategory = 3 },
    Thalassian_Missive_of_Multicraft = { IDs = { 245818, 245819 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Engineering", "Inscription", "Enchanting", "Blacksmithing" }, displayCategory = 3 },
    Thalassian_Missive_of_Crafting_Speed = { IDs = { 245820, 245821 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Engineering", "Inscription", "Enchanting", "Blacksmithing" }, displayCategory = 3 },
    Thalassian_Missive_of_Finesse = { IDs = { 245822, 245823 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Tailoring", "Blacksmithing" }, displayCategory = 3 },
    Thalassian_Missive_of_Perception = { IDs = { 245824, 245825 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Tailoring", "Blacksmithing" }, displayCategory = 3 },
    Thalassian_Missive_of_Deftness = { IDs = { 245826, 245827 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Tailoring", "Blacksmithing" }, displayCategory = 3 },

    -- Darkmoon Sigils
    Darkmoon_Sigil_Blood = { IDs = { 245871, 245872 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Inscription", "Blacksmithing", "Engineering" }, displayCategory = 3 },
    Darkmoon_Sigil_Void = { IDs = { 245873, 245874 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Inscription", "Blacksmithing", "Engineering" }, displayCategory = 3 },
    Darkmoon_Sigil_Hunt = { IDs = { 245875, 245876 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Inscription", "Blacksmithing", "Engineering", "Enchanting" }, displayCategory = 3 },
    Darkmoon_Sigil_Rot = { IDs = { 245877, 245878 }, sources = { "Crafted" }, gatheringProf = "Inscription", processingProfs = { "Inscription", "Blacksmithing", "Engineering" }, displayCategory = 3 },
}

ProfessionsHelperData["Midnight"].Jewelcrafting = {
    -- Base Reagents (Category 2 - Icons für Drops & Edelsteine)
    Harandar_Peridot = { IDs = { 242607, 242720 }, sources = { "Drop" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting", "Alchemy" }, canExperiment = true, displayCategory = 2 },
    Eversong_Diamond = { IDs = { 242608, 242712 }, sources = { "Drop" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting" }, displayCategory = 2 },
    Tenebrous_Amethyst = { IDs = { 242606, 242721 }, sources = { "Drop" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting" }, displayCategory = 2 },
    Amani_Lapis = { IDs = { 242554, 242722 }, sources = { "Drop" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting", "Alchemy" }, canExperiment = true, displayCategory = 2 },
    Sanguine_Garnet = { IDs = { 242553, 242723 }, sources = { "Drop" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting" }, displayCategory = 2 },
    
    Flawless_Sanguine_Garnet = { IDs = { 242613, 242724 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting" }, displayCategory = 2 },
    Flawless_Tenebrous_Amethyst = { IDs = { 242611, 242725 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Enchanting", "Jewelcrafting" }, displayCategory = 2 },
    Flawless_Harandar_Peridot = { IDs = { 242610, 242726 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Enchanting", "Jewelcrafting" }, displayCategory = 2 },
    Flawless_Amani_Lapis = { IDs = { 242612, 242727 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Enchanting", "Jewelcrafting" }, displayCategory = 2 },
    
    Glimmering_Gemdust = { IDs = { 242620, 242621 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting", "Leatherworking" }, displayCategory = 2 },
    Crystalline_Glass = { IDs = { 242786, 242787 }, sources = { "Drop" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting", "Enchanting" }, displayCategory = 2 },
    Duskshrouded_Stone = { IDs = { 242788, 242789 }, sources = { "Drop" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting", "Leatherworking", "Enchanting", "Blacksmithing", "Inscription" }, displayCategory = 2 },

    -- Optional Reagents (Category 3)
    Prismatic_Focusing_Iris = { IDs = { 251487, 251488 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting" }, displayCategory = 3 },
    Stabilizing_Gemstone_Bandolier = { IDs = { 251489, 251490 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Tailoring", "Blacksmithing", "Leatherworking", "Jewelcrafting" }, displayCategory = 3 },

    -- Advanced Reagents (Category 3)
    Sin_dorei_Lens = { IDs = { 240972, 240973 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting" }, displayCategory = 3 },
    Kaleidoscopic_Prism = { IDs = { 240974, 240975 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Jewelcrafting" }, displayCategory = 3 },

    -- Endproduct
    Vial = { IDs = { 240990, 240991 }, sources = { "Crafted" }, gatheringProf = "Jewelcrafting", processingProfs = { "Alchemy", "Enchanting" }, displayCategory = 3 },
}

ProfessionsHelperData["Midnight"].Other = {}

-- ==========================================
-- Spells of professions
-- ==========================================

ProfessionsHelperData["Midnight"].Skills = {
    
    --Skinning
    Sharpen_Knife = {spellID = 1223388, IDs = { 1223388 }, gatheringProf = "Skinning", displayCategory = 5, sources = { "Spell" }, time = "Reload"},
    Carve_Meat = {spellID = 1226037, IDs = { 1226037 }, gatheringProf = "Skinning", displayCategory = 5, sources = { "Spell" }, time = "Reload"},
    Find_High_Value_Beasts = {spellID = 1250491, IDs = {1250491}, gatheringProf = "Skinning", displayCategory = 0, sources = { "Spell"}, time = "CD"},

    --Herbalism
    Overload_Herb = {spellID = 1223014, IDs = { 1223014 }, gatheringProf = "Herbalism", displayCategory = 5, sources = { "Spell" }, time = "Reload"},

    --Mining
    Overlord_Ore = {spellID = 1225392, IDs = { 1225392 }, gatheringProf = "Mining", displayCategory = 5, sources = { "Spell" }, time = "Reload"},
}


-- ==========================================
-- Recipes of professions
-- ==========================================


-- Herbalism
local recipe_magicalMulch = {
yield = 1,
{ ids = {236761, 236767}, amount = 5 },
}
local recipe_imbuedMulch = {
yield = 1,
{ ids = {236761, 236767}, amount = 10 },
}
local recipe_empoweredMulch = {
yield = 1,
{ ids = {236761, 236767}, amount = 20 },
}


-- Blacksmithing
local recipe_RefulgentCopperIngot = {
yield = 1,
{ ids = { 243060 }, amount = 2},
{ ids = { 237359, 237361 }, amount = 5},
}

local recipe_GloamingAlloy = {
yield = 1,
{ ids = { 243060 }, amount = 4},
{ ids = { 238197, 238198 }, amount = 3},
{ ids = { 237362, 237363 }, amount = 6},
}

local recipe_SterlingAlloy = {
yield = 1,
{ ids = { 243060 }, amount = 4},
{ ids = { 238197, 238198 }, amount = 3},
{ ids = { 237364, 237365 }, amount = 6},
}


-- Jewelcrafting
local recipe_KaleidoPrism = {
yield = 1,
{ ids = { 242610, 242726 }, amount = 1},
{ ids = { 242611, 242725 }, amount = 1},
{ ids = { 242612, 242727 }, amount = 1},
{ ids = { 242613, 242728 }, amount = 1},
{ ids = { 242620, 242621 }, amount = 10},
}

local recipe_SunglassVial = {
yield = 1,
{ ids = { 242786, 242787 }, amount = 5},
{ ids = { 242788, 242789 }, amount = 1},
}

local recipe_PrismaFocusIris = {
yield = 1,
{ ids = { 240972, 240973 }, amount = 2},
{ ids = { 242620, 242621 }, amount = 2},
}

local recipe_StabGemBandolier = {
yield = 1,
{ ids = { 242553, 242723 }, amount = 1},
{ ids = { 242554, 242722 }, amount = 1},
{ ids = { 242606, 242721 }, amount = 1},
{ ids = { 242607, 242720 }, amount = 1},
{ ids = { 242620, 242621 }, amount = 3},
}

local recipe_SindoreiLens = {
yield = 1,
{ ids = { 242786, 242787 }, amount = 3},
{ ids = { 242620, 242621 }, amount = 1},
}


-- Leatherworking
local recipe_BlessedPangoCharm = {
yield = 1,
{ ids = { 236951 }, amount = 10},
{ ids = { 238523 }, amount = 1},
{ ids = { 244622 }, amount = 1},
{ ids = { 238518, 238519 }, amount = 1},
{ ids = { 242788, 242789 }, amount = 2},
}

local recipe_PrimalSporeBinding = {
yield = 1,
{ ids = { 236950 }, amount = 10},
{ ids = { 238525 }, amount = 1},
{ ids = { 244631, 244632 }, amount = 1},
}

local recipe_ScalewovenHide = {
yield = 1,
{ ids = { 238518, 238519 }, amount = 1},
{ ids = { 238520, 238521 }, amount = 1},
}

local recipe_InfusedScalewovenHide = {
yield = 1,
{ ids = { 236949 }, amount = 2},
{ ids = { 236950 }, amount = 2},
{ ids = { 236951 }, amount = 2},
{ ids = { 236952 }, amount = 2},
{ ids = { 238529 }, amount = 1},
{ ids = { 244631, 244632 }, amount = 1},
}


local recipe_SinArmorBanding = {
yield = 1,
{ ids = { 236949 }, amount = 2},
{ ids = { 238525 }, amount = 1},
{ ids = { 238520, 238521 }, amount = 1},
}

local recipe_SilverWeaponWrap = {
yield = 1,
{ ids = { 236949 }, amount = 2},
{ ids = { 238523 }, amount = 1},
{ ids = { 238518, 238519 }, amount = 1},
}

local recipe_DevourBanding = {
yield = 1,
{ ids = { 236852 }, amount = 10},
{ ids = { 244635, 244636 }, amount = 1},
}

local recipe_ForestHunterArmorKit = {
yield = 1,
{ ids = { 251285 }, amount = 3},
{ ids = { 251665 }, amount = 10},
{ ids = { 236951 }, amount = 10},
{ ids = { 244633, 244634 }, amount = 1},
{ ids = { 244635, 244636 }, amount = 2},
}

local recipe_BloodKnightArmorKit = {
yield = 1,
{ ids = { 251285 }, amount = 3},
{ ids = { 251665 }, amount = 10},
{ ids = { 236949 }, amount = 10},
{ ids = { 244633, 244634 }, amount = 1},
{ ids = { 244635, 244636 }, amount = 2},
}


-- Tailoring
local recipe_BriLinenBolt = {
yield = 1,
{ ids = { 251665 }, amount = 4},
{ ids = { 236963, 236965 }, amount = 1},
}

local recipe_ImbBriLinenBolt = {
yield = 1,
{ ids = { 251665 }, amount = 4},
{ ids = { 239700, 239701 }, amount = 2},
}

local recipe_SunSilkBolt = {
yield = 1,
{ ids = { 236949 }, amount = 4},
{ ids = { 237015, 237016 }, amount = 5},
{ ids = { 239702, 239703 }, amount = 6},
}

local recipe_SunSilkLining = {
yield = 1,
{ ids = { 251691 }, amount = 1},
{ ids = { 237015, 237016 }, amount = 6},
{ ids = { 239201, 239202 }, amount = 2},
}

local recipe_ArcanoweaveLining = {
yield = 1,
{ ids = { 251691 }, amount = 1},
{ ids = { 237017, 237018 }, amount = 6},
{ ids = { 239198, 239200 }, amount = 2},
}


-- Inscription
local recipe_SoulCipher = {
yield = 1,
{ ids = { 236952 }, amount = 1},
{ ids = { 236949 }, amount = 1},
{ ids = { 242788, 242789 }, amount = 1},
{ ids = { 245801, 245802 }, amount = 1},
{ ids = { 245805, 245806 }, amount = 1},
}

local recipe_MissiveAurora = {
yield = 1,
{ ids = { 245881 }, amount = 1},
{ ids = { 236850 }, amount = 1},
{ ids = { 245801, 245802 }, amount = 2},
{ ids = { 245805, 245806 }, amount = 2},
}

local recipe_MissiveFeverflare = {
yield = 1,
{ ids = { 245881 }, amount = 1},
{ ids = { 236850 }, amount = 1},
{ ids = { 245801, 245802 }, amount = 2},
{ ids = { 245805, 245806 }, amount = 2},
}

local recipe_MissiveFireflash = {
yield = 1,
{ ids = { 245881 }, amount = 1},
{ ids = { 236850 }, amount = 1},
{ ids = { 245801, 245802 }, amount = 2},
{ ids = { 245805, 245806 }, amount = 2},
}

local recipe_MissiveHarmonious = {
yield = 1,
{ ids = { 245881 }, amount = 1},
{ ids = { 236852 }, amount = 1},
{ ids = { 245801, 245802 }, amount = 2},
{ ids = { 245805, 245806 }, amount = 2},
}

local recipe_MissivePeerless = {
yield = 1,
{ ids = { 245881 }, amount = 1},
{ ids = { 236852 }, amount = 1},
{ ids = { 245801, 245802 }, amount = 2},
{ ids = { 245805, 245806 }, amount = 2},
}

local recipe_MissiveQuickblade = {
yield = 1,
{ ids = { 245881 }, amount = 1},
{ ids = { 236852 }, amount = 1},
{ ids = { 245801, 245802 }, amount = 2},
{ ids = { 245805, 245806 }, amount = 2},
}

local recipe_MissiveIngenuity = {
yield = 1,
{ ids = { 245881 }, amount = 1},
{ ids = { 236849 }, amount = 1},
{ ids = { 245801, 245802 }, amount = 2},
{ ids = { 245805, 245806 }, amount = 2},
}

local recipe_MissiveResourcefulness = {
yield = 1,
{ ids = { 245881 }, amount = 1},
{ ids = { 236849 }, amount = 1},
{ ids = { 245801, 245802 }, amount = 2},
{ ids = { 245805, 245806 }, amount = 2},
}

local recipe_MissiveMulticraft = {
yield = 1,
{ ids = { 245881 }, amount = 1},
{ ids = { 236849 }, amount = 1},
{ ids = { 245801, 245802 }, amount = 2},
{ ids = { 245805, 245806 }, amount = 2},
}

local recipe_MissiveCraftingSpeed = {
yield = 1,
{ ids = { 245881 }, amount = 1},
{ ids = { 236851 }, amount = 1},
{ ids = { 245801, 245802 }, amount = 2},
{ ids = { 245805, 245806 }, amount = 2},
}

local recipe_MissiveFinesse = {
yield = 1,
{ ids = { 245881 }, amount = 1},
{ ids = { 236951 }, amount = 1},
{ ids = { 245801, 245802 }, amount = 2},
{ ids = { 245805, 245806 }, amount = 2},
}

local recipe_MissivePerception = {
yield = 1,
{ ids = { 245881 }, amount = 1},
{ ids = { 236949 }, amount = 1},
{ ids = { 245801, 245802 }, amount = 2},
{ ids = { 245805, 245806 }, amount = 2},
}

local recipe_MissiveDeftness = {
yield = 1,
{ ids = { 245881 }, amount = 1},
{ ids = { 236951 }, amount = 1},
{ ids = { 245801, 245802 }, amount = 2},
{ ids = { 245805, 245806 }, amount = 2},
}

local recipe_SigilBlood = {
yield = 1,
{ ids = { 245882 }, amount = 1},
{ ids = { 236949 }, amount = 10},
{ ids = { 245755 }, amount = 1},
{ ids = { 245766, 245767 }, amount = 5},
}

local recipe_SigilVoid = {
yield = 1,
{ ids = { 245882 }, amount = 1},
{ ids = { 236952 }, amount = 10},
{ ids = { 245750 }, amount = 1},
{ ids = { 245766, 245767 }, amount = 5},
}

local recipe_SigilHunt = {
yield = 1,
{ ids = { 245882 }, amount = 1},
{ ids = { 236951 }, amount = 10},
{ ids = { 245829 }, amount = 1},
{ ids = { 245766, 245767 }, amount = 5},
}

local recipe_SigilRot = {
yield = 1,
{ ids = { 245882 }, amount = 1},
{ ids = { 236950 }, amount = 10},
{ ids = { 245846 }, amount = 1},
{ ids = { 245766, 245767 }, amount = 5},
}


-- Alchemy
local recipe_CompositeFlora = {
yield = 1,
{ ids = { 245881 }, amount = 4},
{ ids = { 236850 }, amount = 4},
{ ids = { 236761, 236767 }, amount = 6},
{ ids = { 236776, 236777 }, amount = 4},
}


-- Engineering
local recipe_SoulSprocket = {
yield = 1,
{ ids = { 253302 }, amount = 1},
{ ids = { 237359, 237361 }, amount = 5},
{ ids = { 237362, 237363 }, amount = 10},
}

local recipe_SongGear = {
yield = 1,
{ ids = { 253302 }, amount = 1},
{ ids = { 237359, 237361 }, amount = 10},
{ ids = { 237362, 237363 }, amount = 5},
}

local recipe_FluxCogwheel = {
yield = 1,
{ ids = { 253303 }, amount = 5},
{ ids = { 236950 }, amount = 1},
{ ids = { 243574, 243575 }, amount = 2},
{ ids = { 243576, 243577 }, amount = 1},
}

local recipe_GreasedCogwheel = {
yield = 1,
{ ids = { 253303 }, amount = 5},
{ ids = { 236951 }, amount = 1},
{ ids = { 243574, 243575 }, amount = 2},
{ ids = { 243576, 243577 }, amount = 1},
}

local recipe_PerfCogwheel = {
yield = 1,
{ ids = { 253303 }, amount = 5},
{ ids = { 236952 }, amount = 1},
{ ids = { 243574, 243575 }, amount = 2},
{ ids = { 243576, 243577 }, amount = 1},
}

local recipe_ConsistentCogwheel = {
yield = 1,
{ ids = { 253303 }, amount = 5},
{ ids = { 236949 }, amount = 1},
{ ids = { 243574, 243575 }, amount = 2},
{ ids = { 243576, 243577 }, amount = 1},
}

local recipe_M3ddy = {
yield = 1,
{ ids = { 243576, 243577 }, amount = 1},
{ ids = { 243578 }, amount = 3},
{ ids = { 243581, 243582 }, amount = 2},
}

local recipe_LuckyKeychain = {
yield = 1,
{ ids = { 253303 }, amount = 10},
{ ids = { 236951 }, amount = 1},
{ ids = { 243581, 243582 }, amount = 5},
}

local recipe_B1p = {
yield = 1,
{ ids = { 253303 }, amount = 10},
{ ids = { 236951 }, amount = 1},
{ ids = { 243581, 243582 }, amount = 5},
}

local recipe_KinAnklePrimers = {
yield = 1,
{ ids = { 243574, 243575 }, amount = 2},
{ ids = { 243578, 243579 }, amount = 3},
{ ids = { 243581, 243582 }, amount = 1},
}

local recipe_Hu5h = {
yield = 1,
{ ids = { 253303 }, amount = 10},
{ ids = { 236952 }, amount = 1},
{ ids = { 243581, 243582 }, amount = 5},
}

local recipe_B0p = {
yield = 1,
{ ids = { 253303 }, amount = 10},
{ ids = { 236952 }, amount = 1},
{ ids = { 243581, 243582 }, amount = 5},
}


ProfessionsHelperData["Midnight"].RecipeDB = {
    -- Herbalism
[238387] = recipe_magicalMulch,
[238388] = recipe_imbuedMulch,
[238389] = recipe_empoweredMulch,


-- Blacksmithing
[238197] = recipe_RefulgentCopperIngot,
[238198] = recipe_RefulgentCopperIngot,

[238202] = recipe_GloamingAlloy,
[238203] = recipe_GloamingAlloy,
[238204] = recipe_SterlingAlloy,
[238205] = recipe_SterlingAlloy,


-- Jewelcrafting
[240974] = recipe_KaleidoPrism,
[240975] = recipe_KaleidoPrism,

[240990] = recipe_SunglassVial,
[240991] = recipe_SunglassVial,

[251487] = recipe_PrismaFocusIris,
[251488] = recipe_PrismaFocusIris,
[251489] = recipe_StabGemBandolier,
[251490] = recipe_StabGemBandolier,

[240972] = recipe_SindoreiLens,
[240973] = recipe_SindoreiLens,


-- Leatherworking
[244603] = recipe_BlessedPangoCharm,
[244604] = recipe_BlessedPangoCharm,

[244607] = recipe_PrimalSporeBinding,
[244608] = recipe_PrimalSporeBinding,

[244631] = recipe_ScalewovenHide,
[244632] = recipe_ScalewovenHide,
[244633] = recipe_InfusedScalewovenHide,
[244634] = recipe_InfusedScalewovenHide,
[244635] = recipe_SinArmorBanding,
[244636] = recipe_SinArmorBanding,
[244637] = recipe_SilverWeaponWrap,
[244638] = recipe_SilverWeaponWrap,

[244640] = recipe_ForestHunterArmorKit,
[244641] = recipe_ForestHunterArmorKit,
[244642] = recipe_BloodKnightArmorKit,
[244643] = recipe_BloodKnightArmorKit,

[244674] = recipe_DevourBanding,
[244675] = recipe_DevourBanding,


-- Tailoring
[239201] = recipe_SunSilkBolt,
[239202] = recipe_SunSilkBolt,
[239700] = recipe_BriLinenBolt,
[239701] = recipe_BriLinenBolt,
[239702] = recipe_ImbBriLinenBolt,
[239703] = recipe_ImbBriLinenBolt,
[240164] = recipe_SunSilkLining,
[240165] = recipe_SunSilkLining,
[240166] = recipe_ArcanoweaveLining,
[240167] = recipe_ArcanoweaveLining,

-- Inscription
[245766] = recipe_SoulCipher,
[245767] = recipe_SoulCipher,

[245781] = recipe_MissiveAurora,
[245782] = recipe_MissiveAurora,
[245783] = recipe_MissiveFeverflare,
[245784] = recipe_MissiveFeverflare,
[245785] = recipe_MissiveFireflash,
[245786] = recipe_MissiveFireflash,
[245787] = recipe_MissiveHarmonious,
[245788] = recipe_MissiveHarmonious,
[245789] = recipe_MissivePeerless,
[245790] = recipe_MissivePeerless,
[245791] = recipe_MissiveQuickblade,
[245792] = recipe_MissiveQuickblade,

[245814] = recipe_MissiveIngenuity,
[245815] = recipe_MissiveIngenuity,
[245816] = recipe_MissiveResourcefulness,
[245817] = recipe_MissiveResourcefulness,
[245818] = recipe_MissiveMulticraft,
[245819] = recipe_MissiveMulticraft,
[245820] = recipe_MissiveCraftingSpeed,
[245821] = recipe_MissiveCraftingSpeed,
[245822] = recipe_MissiveFinesse,
[245823] = recipe_MissiveFinesse,
[245824] = recipe_MissivePerception,
[245825] = recipe_MissivePerception,
[245826] = recipe_MissiveDeftness,
[245827] = recipe_MissiveDeftness,

[245871] = recipe_SigilBlood,
[245872] = recipe_SigilBlood,
[245873] = recipe_SigilVoid,
[245874] = recipe_SigilVoid,
[245875] = recipe_SigilHunt,
[245876] = recipe_SigilHunt,
[245877] = recipe_SigilRot,
[245878] = recipe_SigilRot,


-- Alchemy
[241280] = recipe_CompositeFlora,
[241281] = recipe_CompositeFlora,


-- Engineering
[243574] = recipe_SongGear,
[243575] = recipe_SongGear,
[243576] = recipe_SoulSprocket,
[243577] = recipe_SoulSprocket,

[244697] = recipe_FluxCogwheel,
[244698] = recipe_FluxCogwheel,
[244699] = recipe_GreasedCogwheel,
[244700] = recipe_GreasedCogwheel,
[244701] = recipe_PerfCogwheel,
[244702] = recipe_PerfCogwheel,
[244703] = recipe_ConsistentCogwheel,
[244704] = recipe_ConsistentCogwheel,

[248136] = recipe_M3ddy,
[248130] = recipe_LuckyKeychain,

[248132] = recipe_KinAnklePrimers,
[248133] = recipe_KinAnklePrimers,

[248135] = recipe_B1p,
[248592] = recipe_B1p,

[255843] = recipe_Hu5h,
[255844] = recipe_Hu5h,

[257735] = recipe_B0p,
[257741] = recipe_B0p,
}