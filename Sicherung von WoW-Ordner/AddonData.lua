-- AddonData.lua
-- ProfessionsHelper Item Data

local ADDON_NAME, _ = ...
ProfessionsHelperData = ProfessionsHelperData or {}

ProfessionsHelperData["The War Within"] = {}

-- Leather
ProfessionsHelperData["The War Within"].Leather = {
    StormChargedLeather       = { IDs = { 212664, 212665, 212666 }, color = "#FF5900" }, -- Drop, Skinning, Vendor, Leatherworking, Alchemy, Bar
    GloomChitin               = { IDs = { 212667, 212668, 212669 }, color = "#7E94FF" }, -- Drop, Skinning, Vendor, Leatherworking, Alchemy, Bar
    ThunderousHide            = { IDs = { 212670, 212672, 212673 }, color = "#FF9F46" }, -- Drop, Skinning, Leatherworking, Bar
    SunlessCarapace           = { IDs = { 212674, 212675, 212676 }, color = "#FF55EE" }, -- Drop, Skinning, Leatherworking, Bar
    BottledStorm              = { IDs = { 218338 } },                                      -- Drop, allProc, Skinning, Icon
    BurningCinderbeeSetae     = { IDs = { 218339 } },                                      -- Drop, Skinning, Beast Part, Leatherworking, Icon
    CarapaceBackedHide        = { IDs = { 219880, 219881, 219882 } },                      -- Crafted, Leatherworking, Leatherworking, ProfIcon
    ChitinArmorBanding        = { IDs = { 219898, 219899, 219900 } },                      -- Crafted, Leatherworking, Leatherworking, ProfIcon
    CrystalfusedHide          = { IDs = { 219883, 219884, 219885 } },                      -- Crafted, Leatherworking, Leatherworking, Engineering, ProfIcon
    HonedBoneShards           = { IDs = { 218337 } },                                      -- Drop, Skinning, Beast Part, Leatherworking, Icon
    KahetiSwarmChitin         = { IDs = { 218336 } },                                      -- Drop, Skinning, Beast Part, Leatherworking, Icon
    LeyfusedHide              = { IDs = { 219892, 219893, 219894 } },                      -- Crafted, Leatherworking, Leatherworking, ProfIcon
    SporecoatedHide           = { IDs = { 219889, 219890, 219891 } },                      -- Crafted, Leatherworking, Leatherworking, ProfIcon
    StormTouchedWeaponWrap    = { IDs = { 219901, 219902, 219903 } },                      -- Crafted, Leatherworking, Leatherworking, ProfIcon
    SuperbBeastFang           = { IDs = { 219013 } },                                      -- Drop, Skinning, Beast Part, Leatherworking, Blacksmithing, Icon
    WrithingHide              = { IDs = { 219886, 219887, 219888 } },                      -- Crafted, Leatherworking, Leatherworking, Engineering, ProfIcon
}

-- Herbs
ProfessionsHelperData["The War Within"].Herbs = {
    ArathorsSpear    = { IDs = { 210808, 210809, 210810 }, color = "#B5A143"},                                   -- Drop, Vendor, Herbalism, Alchemy, Inscription, Bar
    BlessingBlossom  = { IDs = { 210805, 210806, 210807 }, color = "#B5396C"},                                   -- Drop, Vendor, Herbalism, Alchemy, Inscription, Bar
    KareshiLotus     = { IDs = { 240194 }, color = "#A610B5", gradient_End_color = "#C219FF"},                 -- Drop, Currency, Herbalism, Bar
    Luredrop         = { IDs = { 210799, 210800, 210801 }, color = "#BA6E70"},                                   -- Drop, Vendor, Herbalism, Alchemy, Inscription, Bar
    Mycobloom        = { IDs = { 210796, 210797, 210798 }, color = "#FFBC62"},                                   -- Drop, Vendor, Herbalism, Alchemy, Inscription, Bar
    NullLotus        = { IDs = { 213197 }, color = "#A610B5"},                                                   -- Drop, Vendor, Herbalism, Alchemy, Tailoring, Bar
    Orbinid          = { IDs = { 210802, 210803, 210804 }, color = "#A65EBA"},                                   -- Drop, Vendor, Herbalism, Alchemy, Inscription, Bar
    PhantomBloom     = { IDs = { 239690, 239691, 239692 }, color = "#30F4FF", gradient_End_color = "#EC82FF"}, -- Drop, Currency, Herbalism, Bar
}

-- Ores
ProfessionsHelperData["The War Within"].Ores = {
    Bismuth         = { IDs = { 210930, 210931, 210932 }, color = "#80567A"}, -- Drop, Vendor, Mining, Blacksmithing, Engineering, Jewelcrafting, Alchemy, Bar
    Ironclaw_Ore    = { IDs = { 210936, 210937, 210938 }, color = "#ACFCF8"}, -- Drop, Vendor, Mining, Blacksmithing, Engineering, Jewelcrafting, Alchemy, Bar
    Aqirite         = { IDs = { 210933, 210934, 210935 }, color = "#CA4A35"}, -- Drop, Vendor, Mining, Blacksmithing, Engineering, Jewelcrafting, Alchemy, Bar
}

-- Metal & Stone
ProfessionsHelperData["The War Within"].MetalAndStone = {
    Aqirite                    = {IDs = { 210933, 210934, 210935 }, color = "#CA4A35" },      -- Drop, Vendor, Mining, Blacksmithing, Engineering, Jewelcrafting, Alchemy, Bar
    Bismuth                    = {IDs = { 210930, 210931, 210932 }, color = "#80567A" },      -- Drop, Vendor, Mining, Blacksmithing, Engineering, Jewelcrafting, Alchemy, Bar
    Charged_Alloy              = {IDs = { 222420, 222421, 222422 } },                           -- Crafted, Blacksmithing, Blacksmithing, Engineering, ProfIcon
    Core_Alloy                 = {IDs = { 222417, 222418, 222419 } },                           -- Crafted, Blacksmithing, Blacksmithing, ProfIcon
    Crystalforged_Cauldron     = {IDs = { 212754 } },                                           -- Vendor, Alchemy, Icon
    Desolate_Talus             = {IDs = { 238201, 238212, 238213 }, color = "#80336F"},       -- Drop, Currency, Mining, Bar
    Echoing_Flux               = {IDs = { 226202 } },                                           -- Vendor, Blacksmithing, Icon
    Imperfect_Null_Stone       = {IDs = { 217707 } },                                           -- Drop, Reagent, Mining, Icon
    Ironclaw_Alloy             = {IDs = { 222426, 222427, 222428 } },                           -- Crafted, Blacksmithing, Blacksmithing, ProfIcon
    Ironclaw_Ore               = {IDs = { 210936, 210937, 210938 }, color = "#ACFCF8" },      -- Drop, Vendor, Mining, Blacksmithing, Engineering, Jewelcrafting, Alchemy, Bar
    Kareshi_Resonating_Stone   = {IDs = { 240216 }, color = "#2E349F"},                       -- Drop, Currency, Mining, Bar
    Manaforged_Instrument      = {IDs = { 249218 } },                                           -- Drop, Inscription, Enchanting, Icon
    Null_Stone                 = {IDs = { 210939 }, color = "#9F2264"},                       -- Drop, Vendor, Mining, Enchanting, Tailoring, Engineering, Jewelcrafting, Blacksmithing, Bar
    Sanctified_Alloy           = {IDs = { 222423, 222424, 222425 } },                           -- Crafted, Blacksmithing, Blacksmithing, Tailoring, ProfIcon
}

-- Cloth
ProfessionsHelperData["The War Within"].Cloth = {
    AlgariFowlfeather        = { IDs = { 225570 } }, -- Drop, Tailoring, Tailoring, Icon
    Dawnweave                = { IDs = { 224826, 228235, 228236 }, color = "#D1833F", gradient_End_color = "#FFFF00"}, -- Drop, Tailoring, Tailoring, Bar
    DawnweaveBolt            = { IDs = { 222801, 222802, 222803 }, color = "#FFFF00", gradient_End_color = "#D1833F"}, -- Crafted, Tailoring, Tailoring, Bar, ProfIcon
    Duskweave                = { IDs = { 224824, 228233, 228234 }, color = "#7B12FF", gradient_End_colorr = "#8F85D1"}, -- Drop, Tailoring, Tailoring, Bar
    DuskweaveBolt            = { IDs = { 222798, 222799, 222800 }, color = "#7250D1", gradient_End_color = "#A939FF"}, -- Crafted, Tailoring, Tailoring, Bar, ProfIcon
    ExquisiteWeaverclothBolt = { IDs = { 224832, 224833, 224834 } }, -- Crafted, Tailoring, Tailoring, ProfIcon
    SpoolOfDawnthread        = { IDs = { 222792, 222793, 222794 }, color = "#6C77D1", gradient_End_color = "#D1833F"}, -- Crafted, Tailoring, Tailoring, Bar
    SpoolOfDuskthread        = { IDs = { 222789, 222790, 222791 }, color = "#8F85D1", gradient_End_color = "#ED2EFF"}, -- Crafted, Tailoring, Tailoring, Bar
    SpoolOfWeaverthread      = { IDs = { 222795, 222796, 222797 }, color = "#FFB841", gradient_End_color = "#C64DA1"}, -- Crafted, Tailoring, Tailoring, Bar
    Weavercloth              = { IDs = { 224828, 228231, 228232 }, color = "#C69052", gradient_End_color = "#FFFF00"}, -- Drop, Tailoring, Tailoring, Alchemy, Bar
    WeaverclothBolt          = { IDs = { 222804, 222805, 222806 }, color = "#7B12FF", gradient_End_color = "#8F85D1"}, -- Crafted, Tailoring, Tailoring, Bar
}

-- Cooking
ProfessionsHelperData["The War Within"].Cooking = {
    CoagulatedYolk = { IDs = { 223977 } }, -- Crafted, Cooking, Cooking, Icon
}

-- Elemental
ProfessionsHelperData["The War Within"].Elemental = {
    FracturedSparkOfFortunes  = { IDs = { 230905 } }, -- Drop, allProf, Saison 2, not useable
    FracturedSparkOfOmens     = { IDs = { 211297 } }, -- Drop, allProf, Saison 1, not useable
    FracturedSparkOfStarlight = { IDs = { 231757 } }, -- Drop, allProf, Saison 3
}

-- Enchanting
ProfessionsHelperData["The War Within"].Enchanting = {
    GleamingShard      = { IDs = { 219949, 219950, 219951 }, color = "#01C1FF", gradient_End_color = "#2D7DFF"}, -- Drop, Enchanting, Entchanting, Tailoring, Bar
    RefulgentCrystal   = { IDs = { 219952, 219954, 219955 }, color = "#EE09FF", gradient_End_color= "#B900FF"}, -- Drop, Enchanting, Enchanitng, Tailoring, Bar
    StormDust          = { IDs = { 219946, 219947, 219948 }, color = "#38A9CB", gradient_End_color = "#893CFF"}, -- Drop, Enchanting, Enchanting, Tailoring, Alchemy, Bar
}

-- Finishing Reagents
ProfessionsHelperData["The War Within"].FinishingReagents = {
    AdjustableFramework                  = { IDs = { 222511, 222512, 222513 } }, -- Crafted, Blacksmithing, Blacksmithing, Engineering, Leatherworking, Inscription, ProfIcon
    ApprenticesCraftingLicense           = { IDs = { 225670 } },                 -- Drop, allProf, allProf,  Icon
    ArtisansConsortiumSealOfApproval    = { IDs = { 225673 } },                  -- Drop, allProf, allProf,  Icon
    AssortedChokingHazards               = { IDs = { 225984, 225985, 225986 } }, -- unknown, Engineering, Icon
    BottledBrilliance                    = { IDs = { 225987, 225988, 225989 } }, -- Crafted, Engineering, Engineering, Blacksmithing, Leatherworking, Jewelcrafting, Alchemy, Tailoring, Inscription, ProfIcon
    BrightPolishingCloth                 = { IDs = { 222879, 222880, 222881 } }, -- Crafted, Tailoring, Jewelcrafting, ProfIcon
    BubblingMycobloomCulture             = { IDs = { 228401, 228402, 228403 } }, -- Crafted, Alchemy, Alchemy, ProfIcon
    ConcentrationConcentrate             = { IDs = { 224173, 224174, 224175 } }, -- Crafted, Enchanting, allProf, ProfIcon
    ForgedFramework                      = { IDs = { 222499, 222500, 222501 } }, -- Crafted, Blacksmithing, Blacksmithing, Engineering, ProfIcon
    GlitteringGemdust                    = { IDs = { 214043 } },                 -- unknown, Jewelcrafting, Icon
    GrittyPolishingCloth                 = { IDs = { 222876, 222877, 222878 } }, -- Crafted, Tailoring, Jewelcrafting, ProfIcon
    HotHoneycomb                         = { IDs = { 225912 } },                 -- Drop, Cooking, Icon
    MirrorPowder                         = { IDs = { 224176, 224177, 224178 } }, -- Crafted, Enchanting, Jewelcrafting, ProfIcon
    OminousEnergyCrystal                 = { IDs = { 213765, 213766, 213767 } }, -- Crafted, Jewelcrafting, Jewelcrafting, Engineering, ProfIcon
    PetalPowder                          = { IDs = { 228404, 228405, 228406 } }, -- Crafted, Alchemy, Alchemy, ProfIcon
    PreservingEmbroideryThread           = { IDs = { 222885, 222886, 222887 } }, -- Crafted, Tailoring, Tailoring, ProfIcon
    SiftedCaveSand                       = { IDs = { 213762, 213763, 213764 } }, -- Crafted, Jewelcrafting, Inscription, ProfIcon
    StackOfPentagoldReviews              = { IDs = { 225671 } },                 -- Drop, allProf, allProf,  Icon
    TemperedFramework                    = { IDs = { 222514, 222515, 222516 } }, -- Crafted, Blacksmithing, Blacksmithing, Engineering, Leatherworking, ProfIcon
    UnraveledInstructions                = { IDs = { 225672 } },                 -- Drop, allProf, allProf,  Icon
    WeaverclothEmbroideryThread          = { IDs = { 222882, 222883, 222884 } }, -- Crafted, Tailoring, Tailoring, ProfIcon
}

-- Food or Drink
ProfessionsHelperData["The War Within"].FoodOrDrink = {
    PortionedSteak = { IDs = { 222738 } }, -- Crafted, Cooking, Cooking
}

-- Inscription
ProfessionsHelperData["The War Within"].Inscription = {
    Inks = {
        Apricate_Ink = { IDs = { 222615, 222616, 222617 } }, -- Crafted, Inscription, Inscription, Tailoring, ProfIcon
        Shadow_Ink   = { IDs = { 222609, 222610, 222611 } }, -- Crafted, Inscription, Inscription, ProfIcon
    },
    Pigments = {
        Blossom_Pigment  = { IDs = { 224805, 224804, 224803 }, color = "#D53026"}, -- Crafted, Inscription, Inscription, Bar
        Luredrop_Pigment = { IDs = { 222612, 222613, 222614 }, color = "#F29134"}, -- Crafted, Inscription, Inscription, Bar
        Nacreous_Pigment = { IDs = { 222618, 222619, 222620 }, color = "#B84945"}, -- Crafted, Inscription, Inscription, Bar
        Orbinid_Pigment  = { IDs = { 224800, 224801, 224802 } },                    -- Crafted, Inscription, Inscription, ProfIcon
    },
    Other = {
        Distilled_Algari_Freshwater = { IDs = { 226205 } }, -- Vendor, Inscription, Icon
    },
}



-- Jewelcrafting
ProfessionsHelperData["The War Within"].Jewelcrafting = {
    AmbivalentAmber         = { IDs = { 212498 } },                 -- Crafted, Jewelcrafting, Jewelcrafting, Icon
    BlackBloodInfusedBar    = { IDs = { 239107 } },                 -- Drop, Jewelcrafting, Icon
    Blasphemite             = { IDs = { 212514 } },                 -- Crafted, Alchemy, Jewelcrafting, ProfIcon
    CrushedGemstones        = { IDs = { 213219, 213220, 213221 } }, -- Crafted, Jewelcrafting, Jewelcrafting, Icon
    DecorativeLens          = { IDs = { 213753, 213754, 213755 } }, -- Crafted, Jewelcrafting, Jewelcrafting, Engineering, ProfIcon
    EngravedGemcutter       = { IDs = { 213750, 213751, 213752 } }, -- Crafted, Jewelcrafting, Jewelcrafting, ProfIcon
    ExtravagantEmerald      = { IDs = { 212505 } },                 -- Crafted, Jewelcrafting, Jewelcrafting, Icon
    GlitteringGlass         = { IDs = { 213399 } },                 -- Crafted, Jewelcrafting, Jewelcrafting, Icon
    HandfulOfPebbles        = { IDs = { 213398 } },                 -- Crafted, Jewelcrafting, Jewelcrafting, Icon
    InvertedPrism           = { IDs = { 213759, 213760, 213761 } }, -- Crafted, Jewelcrafting, Jewelcrafting, Alchemy, ProfIcon
    MarbledStone            = { IDs = { 213756, 213757, 213758 } }, -- Crafted, Jewelcrafting, Jewelcrafting, Icon
    OstentatiousOnyx        = { IDs = { 212511 } },                 -- Crafted, Jewelcrafting, Jewelcrafting, Icon
    StunningSapphire        = { IDs = { 212508 } },                 -- Crafted, Jewelcrafting, Jewelcrafting, Icon
}

-- Meat
ProfessionsHelperData["The War Within"].Meat = {
    Arathor_Hammerfish 	    = {IDs = { 220145 } },
    Awoken_Coelacanth 	    = {IDs = { 220153 } },
    Basically_Beef 		    = {IDs = { 223512 } },
    Bismuth_Bitterling 	    = {IDs = { 220137 } },
    Bloody_Perch 		    = {IDs = { 220135 } },
    Bug_Brisket 		    = {IDs = { 225567 } },
    Chopped_Mycobloom 	    = {IDs = { 222737 } },
    Cinderbee_Belly 	    = {IDs = { 225911 } },
    Clipped_Bird_Wing 	    = {IDs = { 225569 } },
    Clumped_Flour 		    = {IDs = { 222701 } },
    Coreway_Dust 		    = {IDs = { 222697 } },
    Crunchy_Peppers 	    = {IDs = { 222696 } },
    Crystalline_Sturgeon 	= {IDs = { 220136 } },
    Cursed_Ghoulfish 	    = {IDs = { 220152 } },
    Dilly_Dally_Dace 	    = {IDs = { 220134 } },
    Dornish_Pike 		    = {IDs = { 220143 } },
    Fine_Egg_Powder 	    = {IDs = { 225876 } },
    Fortuitous_Essence      = {IDs = { 222689 } },
    Fresh_Fillet 		    = {IDs = { 222741 } },
    Goldengill_Trout 	    = {IDs = { 222533 } },
    Granulated_Spices 	    = {IDs = { 222700 } },
    Hearty_Feast 		    = {IDs = { 228721 } },
    Hearty_Food 		    = {IDs = { 222693 } },
    Kaheti_Slum_Shark       = {IDs = { 220147 } },
    Khaz_Algar_Tomato       = {IDs = { 222699 } },
    Massive_Worm_Flank      = {IDs = { 225565 } },
    Meaty_Muscle            = {IDs = { 225564 } },
    Nibbling_Minnow         = {IDs = { 220138 } },
    Pale_Huskfish           = {IDs = { 220148 } },
    Prepared_Ghoulfish      = {IDs = { 225883 } },
    Queens_Lurefish         = {IDs = { 220151 } },
    Quiet_River_Bass        = {IDs = { 220142 } },
    Regal_Dottyback         = {IDs = { 220146 } },
    Roaring_Anglerseeker    = {IDs = { 220144 } },
    Sanguine_Dogfish        = {IDs = { 220149 } },
    Slum_Shark_Scrap        = {IDs = { 225568 } },
    Specular_Rainbowfish    = {IDs = { 220141 } },
    Spiced_Meat_Stock       = {IDs = { 222739 } },
    Spiked_Sea_Raven        = {IDs = { 220150 } },
    Surface_Olive           = {IDs = { 222698 } },
    Twined_Herbs            = {IDs = { 222695 } },
    Undermine_Clam_Meat     = {IDs = { 235845 } },
    Warped_Wing             = {IDs = { 225566 } },
    Whispering_Stargazer    = {IDs = { 220139 } },
}

-- Miscellaneous Item
ProfessionsHelperData["The War Within"].MiscellaneousItem = {
    Putrid_Goop = { IDs = { 225937 } },
}

-- Optional Reagents
ProfessionsHelperData["The War Within"].OptionalReagents = {
    Adjustable_Cogwheel                         = { IDs = { 221920, 221921, 221922 } },
    Algari_Missive_of_Crafting_Speed            = { IDs = { 222635, 222636, 222637 } },
    Algari_Missive_of_Deftness                  = { IDs = { 222644, 222645, 222646 } },
    Algari_Missive_of_Finesse                   = { IDs = { 222638, 222639, 222640 } },
    Algari_Missive_of_Ingenuity                 = { IDs = { 222626, 222627, 222628 } },
    Algari_Missive_of_Multicraft                = { IDs = { 222632, 222633, 222634 } },
    Algari_Missive_of_Perception                = { IDs = { 222641, 222642, 222643 } },
    Algari_Missive_of_Resourcefulness           = { IDs = { 222629, 222630, 222631 } },
    Algari_Missive_of_the_Aurora                = { IDs = { 222579, 222580, 222581 } },
    Algari_Missive_of_the_Feverflare            = { IDs = { 222582, 222583, 222584 } },
    Algari_Missive_of_the_Fireflash             = { IDs = { 222585, 222586, 222587 } },
    Algari_Missive_of_the_Harmonious            = { IDs = { 222588, 222589, 222590 } },
    Algari_Missive_of_the_Peerless              = { IDs = { 222591, 222592, 222593 } },
    Algari_Missive_of_the_Quickblade            = { IDs = { 222594, 222595, 222596 } },
    Blame_Redirection_Device                    = { IDs = { 221926, 221927, 221928 } },
    Blessed_Weapon_Grip                         = { IDs = { 219495, 219496, 219497 } },
    Captured_Starlight                          = { IDs = { 213774, 213775, 213776 } },
    Complicated_Fuse_Box                        = { IDs = { 221932, 221933, 221934 } },
    Concealed_Chaos_Module                      = { IDs = { 221938, 221939, 221940 } },
    Darkmoon_Sigil_Ascension                    = { IDs = { 226022, 226023, 226024 } }, -- Crafted, Inscription, ProfIcon
    Darkmoon_Sigil_Radiance                     = { IDs = { 226025, 226026, 226027 } }, -- Crafted, Inscription, ProfIcon
    Darkmoon_Sigil_Symbiosis                    = { IDs = { 226028, 226029, 226030 } }, -- Crafted, Inscription, ProfIcon
    Darkmoon_Sigil_Vivacity                     = { IDs = { 226031, 226032, 226033 } }, -- Crafted, Inscription, ProfIcon
    Dawnthread_Lining                           = { IDs = { 222868, 222869, 222870 } }, -- Crafted, Tailoring, ProfIcon
    Duskthread_Lining                           = { IDs = { 222871, 222872, 222873 } }, -- Crafted, Tailoring, ProfIcon
    Elemental_Focusing_Lens                     = { IDs = { 213768, 213769, 213770 } }, -- Crafted, Jewelcrafting, ProfIcon
    Enchanted_Gilded_Ethereal_Crest             = { IDs = { 231768 } }, -- Crafted, Enchanting, ProfIcon
    Enchanted_Gilded_Harbinger_Crest            = { IDs = { 224073 } }, -- Crafted, Enchanting, ProfIcon
    Enchanted_Gilded_Undermine_Crest            = { IDs = { 230935 } }, -- Crafted, Enchanting, ProfIcon
    Enchanted_Runed_Ethereal_Crest              = { IDs = { 231769 } }, -- Crafted, Enchanting, ProfIcon
    Enchanted_Runed_Harbinger_Crest             = { IDs = { 224072 } }, -- Crafted, Enchanting, ProfIcon
    Enchanted_Runed_Undermine_Crest             = { IDs = { 230936 } }, -- Crafted, Enchanting, ProfIcon
    Enchanted_Weathered_Ethereal_Crest          = { IDs = { 231767 } }, -- Crafted, Enchanting, ProfIcon
    Enchanted_Weathered_Harbinger_Crest         = { IDs = { 224069 } }, -- Crafted, Enchanting, ProfIcon
    Enchanted_Weathered_Undermine_Crest         = { IDs = { 230937 } }, -- Crafted, Enchanting, ProfIcon
    Energy_Redistribution_Beacon                = { IDs = { 221941, 221942, 221943 } },
    Gilded_Augmentation_Matrix                  = { IDs = { 239146 } },
    Gilded_Starlight_Matrix                     = { IDs = { 251993 } },
    Griftahs_Heavy_Duty_Embellishing_Powder     = { IDs = { 228921 } },
    Impeccable_Cogwheel                         = { IDs = { 221917, 221918, 221919 } },
    Overclocked_Cogwheel                        = { IDs = { 221914, 221915, 221916 } },
    Pouch_of_Pocket_Grenades                    = { IDs = { 221935, 221936, 221937 } },
    Prismatic_Null_Stone                        = { IDs = { 213771, 213772, 213773 } },
    Recalibrated_Safety_Switch                  = { IDs = { 221923, 221924, 221925 } },
    Relic_of_the_Past_VI                        = { IDs = { 228368 } },
    Runed_Augmentation_Matrix                   = { IDs = { 239203 } },
    Runed_Starlight_Matrix                      = { IDs = { 251994 } },
    Serrated_Cogwheel                           = { IDs = { 221911, 221912, 221913 } },
    Soul_Sigil_I                                = { IDs = { 228338 } },
    Soul_Sigil_II                               = { IDs = { 228339 } },
    Writhing_Armor_Banding                      = { IDs = { 219504, 219505, 219506 } }, -- Crafted, Leatherworking, ProfIcon
}

-- Part
ProfessionsHelperData["The War Within"].Part = {
    Assorted_Whirligigs           = { IDs = { 227770 } },
    Blinker_Fluid                 = { IDs = { 227771 } },
    Bountiful_Bolts               = { IDs = { 227769 } },
    Cataclysmic_Converter         = { IDs = { 227772 } },
    Chaos_Circuit                 = { IDs = { 221865, 221866, 221867 } },
    Entropy_Enhancer              = { IDs = { 221868, 221869, 221870 } },
    Gyrating_Gear                 = { IDs = { 221859, 221860, 221861 } },
    Handful_of_Bismuth_Bolts      = { IDs = { 221853, 221854, 221855 } },
    Pile_of_Rusted_Scrap          = { IDs = { 219150 } },
    Pummel_Permit                 = { IDs = { 227774 } },
    Pummel_Proof_Plating          = { IDs = { 227773 } },
    Safety_Switch                 = { IDs = { 221862, 221863, 221864 } },
    Whimsical_Wiring              = { IDs = { 221856, 221857, 221858 } },
}

-- Permanent Item Enhancement
ProfessionsHelperData["The War Within"].PermanentItemEnhancement = {
    Daybreak_Spellthread 		= { IDs = { 222894, 222895, 222896 } },
    Sunset_Spellthread 		    = { IDs = { 222891, 222892, 222893 } },
    Weavercloth_Spellthread 	= { IDs = { 222888, 222889, 222890 } },
}

-- Trade Good
ProfessionsHelperData["The War Within"].TradeGood = {
        Adorning_Ribbon                       = { IDs = { 228930 } },
        Artisans_Acuity                       = { IDs = { 210814 } },
        Astral_Aspirants_Heraldry             = { IDs = { 230286 } },
        Astral_Combatants_Heraldry            = { IDs = { 230285 } },
        Astral_Gladiators_Heraldry            = { IDs = { 230287 } },
        Coreway_Catalyst                      = { IDs = { 210815 } },
        Crystalline_Powder                    = { IDs = { 213610 } },
        Dilution_Solution                     = { IDs = { 210828 } },
        Forged_Aspirants_Heraldry             = { IDs = { 210232 } },
        Forged_Combatants_Heraldry            = { IDs = { 210221 } },
        Forged_Gladiators_Heraldry            = { IDs = { 210233 } },
        Frayed_Wiring                         = { IDs = { 228414 } },
        Gilded_Vial                           = { IDs = { 211806, 211807, 211808 } },
        Gleaming_Chaos                        = { IDs = { 225677 } },
        Gleaming_Transmutagen                 = { IDs = { 211805 } },
        Gloomfathom_Hide                      = { IDs = { 221757 } }, -- Drop, Blacksmithing, Leatherworking, Icon
        Harmonious_Horticulture               = { IDs = { 212563, 212564, 212565 } },
        Junk_Bucket                           = { IDs = { 228956 } },
        Leyline_Residue                       = { IDs = { 213613 } }, -- Drop, allProf, Icon
        Mercurial_Transmutagen                = { IDs = { 211803 } }, -- Crafted, Alchemy, ProfIcon
        Mosswool_Thread                       = { IDs = { 224764 } }, -- Vendor, Leatherworking, Tailoring, Icon
        Nascent_Gilded_Harbinger_Crest        = { IDs = { 220789 } },
        Nascent_Gilded_Undermine_Crest        = { IDs = { 230986 } },
        Nascent_Runed_Harbinger_Crest         = { IDs = { 220790 } },
        Nascent_Runed_Undermine_Crest         = { IDs = { 230985 } },
        Nascent_Weathered_Harbinger_Crest     = { IDs = { 220788 } },
        Nascent_Weathered_Undermine_Crest     = { IDs = { 230987 } },
        Ominous_Transmutagen                  = { IDs = { 211802 } },
        Prized_Aspirants_Heraldry             = { IDs = { 229389 } },
        Prized_Combatants_Heraldry            = { IDs = { 229388 } },
        Prized_Gladiators_Heraldry            = { IDs = { 229390 } },
        Profaned_Tinderbox                    = { IDs = { 221758 } },
        Ringing_Deeps_Ingot                   = { IDs = { 221754 } },
        Spark_of_Beginnings                   = { IDs = { 211494 } },
        Spark_of_Fortunes                     = { IDs = { 230906 } },
        Spark_of_Legacies                     = { IDs = { 228224 } },
        Spark_of_Omens                        = { IDs = { 211296 } },
        Spark_of_Starlight                    = { IDs = { 231756 } },
        Vial_of_Kaheti_Oils                   = { IDs = { 221756 } },
        Viridescent_Spores                    = { IDs = { 213612 } }, -- Drop, allProf, Icon
        Viridian_Charmcap                     = { IDs = { 221763 } }, 
        Volatile_Transmutagen                 = { IDs = { 211804 } }, -- Crafted, Alchemy, ProfIcon
        Writhing_Sample                       = { IDs = { 213611 } }, -- Drop, allProf, Icon
}
