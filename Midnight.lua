-- TheWarWithin.lua 
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
    Silverleaf_Thread = { IDs = { 251665 }, sources = { "Drop" }, processingProfs = { "Tailoring", "Leatherworking", "Jewelcrafting", "Enchanting" }, displayCategory = 2 },

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
    Fused_Vitality = { IDs = { 246345 }, sources = { "Vendor" }, processingProfs = { "Jewelcrafting", "Engineering", "Inscription", "Blacksmithing", "Leatherworking", "Tailoring" }, displayCategory = 2 },
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

ProfessionsHelperData["Midnight"].Skinning = {}

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

    -- House Decor
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
}

ProfessionsHelperData["Midnight"].Blacksmithing = {
    -- Alloys
    Refulgent_Copper_Ingot = { IDs = { 238197, 238198 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Blacksmithing", "Enchanting" }, displayCategory = 3 },
    Gloaming_Alloy = { IDs = { 238202, 238203 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Blacksmithing", "Enchanting", "Leatherworking" }, displayCategory = 3 },
    Sterling_Alloy = { IDs = { 238204, 238205 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Blacksmithing", "Enchanting" }, displayCategory = 3 },

    -- Frameworks

    -- House Decor
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

    -- House Decor
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

    -- House Decor
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
}

ProfessionsHelperData["Midnight"].Alchemy = {
    -- Crafting Materials
    Mote_of_Light = { IDs = { 236949 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Tailoring", "Leatherworking", "Engineering", "Inscription", "Enchanting", "Alchemy", "Jewelcrafting" }, displayCategory = 3 },
    Mote_of_Primal_Energy = { IDs = { 236950 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Tailoring", "Cooking", "Inscription", "Alchemy", "Enchanting", "Jewelcrafting", "Leatherworking" }, canExperiment = true, displayCategory = 3 },
    Mote_of_Wild_Magic = { IDs = { 236951 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Tailoring", "Leatherworking", "Inscription", "Alchemy", "Enchanting", "Cooking", "Skinning" }, displayCategory = 3 },
    Mote_of_Pure_Void = { IDs = { 236952 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Tailoring", "Engineering", "Leatherworking", "Enchanting", "Alchemy", "Jewelcrafting", "Inscription", "Skinning" }, canExperiment = true, displayCategory = 3 },
    
    Midnight_Catalyst = { IDs = { 241279 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Alchemy" }, displayCategory = 3 },
    Stabilized_Derivate = { IDs = { 242651 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Alchemy" }, canExperiment = true, displayCategory = 3 },

    -- Finishing Reagents / Intermediate
    Composite_Flora = { IDs = { 241280, 241281 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Alchemy", "Leatherworking" }, displayCategory = 3 },
    Wondrous_Synergist = { IDs = { 241282, 241283 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Alchemy" }, displayCategory = 3 },

    -- Endproduct or Others (Platzhalter für Elixiere/Tränke/Experimente)

    -- House Decor
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
}

ProfessionsHelperData["Midnight"].Enchanting = {
    -- Basic Materials (Category 1 - Balkenanzeige)
    Eversinging_Dust = { IDs = { 243599, 243600 }, color = "#FFD700", sources = { "Drop" }, gatheringProf = "Enchanting", processingProfs = { "Alchemy", "Tailoring", "Enchanting" }, canExperiment = true, displayCategory = 1 },
    Radiant_Shard = { IDs = { 243602, 243603 }, color = "#00BFFF", sources = { "Drop" }, gatheringProf = "Enchanting", processingProfs = { "Enchanting", "Tailoring" }, displayCategory = 1 },
    Dawn_Crystal = { IDs = { 243605, 243606 }, color = "#FF8C00", sources = { "Drop" }, gatheringProf = "Enchanting", processingProfs = { "Enchanting", "Jewelcrafting" }, displayCategory = 1 },

    -- Optional Reagents (Noch keine Midnight-Daten vorhanden)
    -- Finishing Reagents (Noch keine Midnight-Daten vorhanden)

    -- House Decor
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

    -- House Decor
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

    -- House Decor
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
    Green_Thumb = {spellID = 439871, IDs = { 439871 }, gatheringProf = "Herbalism", displayCategory = 5, sources = { "Spell" }, time = "CD"},
    Overload_Herb = {spellID = 423395, IDs = { 423395 }, gatheringProf = "Herbalism", displayCategory = 5, sources = { "Spell" }, time = "Reload"},
    ArcaneDuplication = {spellID = 439190, IDs = { 439190 }, gatheringProf = "Herbalism", displayCategory = 5, sources = { "Spell" }, time = "CD"},
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