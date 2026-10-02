-- Forever.lua 
-- ProfessionsHelper Item Data

local ADDON_NAME, _ = ...
ProfessionsHelperData = ProfessionsHelperData or {}
ProfessionsHelperData["Forever"] = {
    Config = {
        ParentMapIDs = { 
            -- Kalimdor (MapID: 1414)
            [1411] = true, -- Durotar
            [1412] = true, -- Mulgore
            [1413] = true, -- Das Brachland
            [1438] = true, -- Teldrassil
            [1439] = true, -- Dunkelküste
            [1440] = true, -- Ashenvale
            [1441] = true, -- Tausend Nadeln
            [1442] = true, -- Steinkrallengebirge
            [1443] = true, -- Desolace
            [1444] = true, -- Feralas
            [1445] = true, -- Marschen von Dustwallow
            [1446] = true, -- Tanaris
            [1447] = true, -- Azshara
            [1448] = true, -- Teufelswald
            [1449] = true, -- Un'Goro-Krater
            [1450] = true, -- Moonglade
            [1451] = true, -- Silithus
            [1452] = true, -- Winterspring
            [2482] = true, -- Hyjal
            [2652] = true, -- Shen'dralas

            -- Östliche Königreiche (MapID: 1415)
            [1416] = true, -- Alteracgebirge
            [1417] = true, -- Arathihochland
            [1418] = true, -- Ödland
            [1419] = true, -- Verwüstete Lande
            [1420] = true, -- Tirisfal
            [1421] = true, -- Silberwald
            [1422] = true, -- Westliche Pestländer
            [1423] = true, -- Östliche Pestländer
            [1424] = true, -- Vorgebirge von Hillsbrad
            [1425] = true, -- Hinterland
            [1426] = true, -- Dun Morogh
            [1427] = true, -- Sengende Schlucht
            [1428] = true, -- Brennende Steppe
            [1429] = true, -- Wald von Elwynn
            [1430] = true, -- Gebirgspass der Totenwinde
            [1431] = true, -- Dämmerwald
            [1432] = true, -- Loch Modan
            [1433] = true, -- Rotkammgebirge
            [1434] = true, -- Schlingendorntal
            [1435] = true, -- Sümpfe des Elends
            [1436] = true, -- Westfall
            [1437] = true, -- Sumpfland
            [2548] = true, -- Flusslande
        },
        CityMapIDs = { 
            [1454] = true, -- Orgrimmar
            [1456] = true, -- Thunder Bluff
            [1457] = true, -- Darnassus
            [1453] = true, -- Stormwind
            [1455] = true, -- Ironforge
            [1458] = true, -- Undercity
        },
    },
}

-- ========================================
-- Ressources
-- ==========================================
-- Gathered + Vendor (sources = Drop, Vendor, gatheringProf= Mining, Skinning, Herbalism, Fishing, Cooking)

ProfessionsHelperData["Forever"].Herbalism = {
    Silverleaf = { IDs = { 765 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Enchanting", "FirstAid", "Herbalism" }, displayCategory = 1 },
    Mageroyal = { IDs = { 785 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Enchanting", "Cooking" }, displayCategory = 1 },
    Peacebloom = { IDs = { 2447 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "FirstAid", "Cooking", "Herbalism", "Enchanting" }, displayCategory = 1 },
    Earthroot = { IDs = { 2449 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Enchanting" }, displayCategory = 1 },
    Briarthorn = { IDs = { 2450 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Enchanting", "FirstAid" }, displayCategory = 1 },
    Swiftthistle = { IDs = { 2452 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Enchanting", "Cooking", "Herbalism" }, displayCategory = 1 },
    Bruiseweed = { IDs = { 2453 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Enchanting", "FirstAid", "Herbalism" }, displayCategory = 1 },
    WildSteelbloom = { IDs = { 3355 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Enchanting" }, displayCategory = 1 },
    Kingsblood = { IDs = { 3356 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Enchanting", "Leatherworking" }, displayCategory = 1 },
    Liferoot = { IDs = { 3357 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Cooking", "FirstAid" }, displayCategory = 1 },
    KhadgarsWhisker = { IDs = { 3358 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Herbalism" }, displayCategory = 1 },
    GraveMoss = { IDs = { 3369 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy" }, displayCategory = 1 },
    Fadeleaf = { IDs = { 3818 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Cooking", "Herbalism" }, displayCategory = 1 },
    Wintersbite = { IDs = { 3819 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Enchanting", "Herbalism" }, displayCategory = 1 },
    Stranglekelp = { IDs = { 3820 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy" }, displayCategory = 1 },
    Goldthorn = { IDs = { 3821 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy" }, displayCategory = 1 },
    Firebloom = { IDs = { 4625 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Enchanting", "Tailoring", "Herbalism" }, displayCategory = 1 },
    Wildvine = { IDs = { 8153 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Blacksmithing", "Tailoring", "Leatherworking", "Enchanting" }, displayCategory = 1 },
    PurpleLotus = { IDs = { 8831 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Alchemy", "Herbalism", "Blacksmithing" }, displayCategory = 1 },
    ArthasTears = { IDs = { 8836 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Herbalism" }, displayCategory = 1 },
    Sungrass = { IDs = { 8838 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Enchanting", "Herbalism", "FirstAid" }, displayCategory = 1 },
    Blindweed = { IDs = { 8839 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy" }, displayCategory = 1 },
    GhostMushroom = { IDs = { 8845 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy" }, displayCategory = 1 },
    Gromsblood = { IDs = { 8846 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Herbalism" }, displayCategory = 1 },
    Dreamfoil = { IDs = { 13463 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Herbalism" }, displayCategory = 1 },
    GoldenSansam = { IDs = { 13464 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "FirstAid" }, displayCategory = 1 },
    MountainSilversage = { IDs = { 13465 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Cooking", "Herbalism" }, displayCategory = 1 },
    Plaguebloom = { IDs = { 13466 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Herbalism" }, displayCategory = 1 },
    Icecap = { IDs = { 13467 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Enchanting", "Engineering" }, displayCategory = 1 },
    BlackLotus = { IDs = { 13468 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Enchanting", "Tailoring" }, displayCategory = 1 },
    Bloodvine = { IDs = { 19726 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Leatherworking", "Blacksmithing", "Tailoring" }, displayCategory = 1 },
    HiveThistle = { IDs = { 234012 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Enchanting", "Engineering" }, displayCategory = 1 },
    FrilledLichen = { IDs = { 249399 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Alchemy", "Enchanting" }, displayCategory = 1 },
}

ProfessionsHelperData["Forever"].Ores = {
    -- Ore
    CopperOre = { IDs = { 2770 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Mining" }, displayCategory = 1 },
    TinOre = { IDs = { 2771 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Mining" }, displayCategory = 1 },
    IronOre = { IDs = { 2772 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Mining", "Enchanting" }, displayCategory = 1 },
    SilverOre = { IDs = { 2775 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Mining", "Enchanting" }, displayCategory = 1 },
    GoldOre = { IDs = { 2776 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Mining" }, displayCategory = 1 },
    MithrilOre = { IDs = { 3858 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Mining", "Alchemy" }, displayCategory = 1 },
    ThoriumOre = { IDs = { 10620 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Mining", "Alchemy" }, displayCategory = 1 },
    DarkIronOre = { IDs = { 11370 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Mining" }, displayCategory = 1 },
    TruesilverOre = { IDs = { 7911 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Mining" }, displayCategory = 1 },
    SmallObsidianShard = { IDs = { 22202 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Blacksmithing", "Engineering" }, displayCategory = 1 },
    LargeObsidianShard = { IDs = { 22203 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Mining", "Blacksmithing" }, displayCategory = 1 },

    -- Stone
    RoughStone = { IDs = { 2835 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Mining", "Engineering", "Blacksmithing" }, displayCategory = 2 },
    CoarseStone = { IDs = { 2836 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 2 },
    HeavyStone = { IDs = { 2838 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Mining", "Engineering", "Blacksmithing" }, displayCategory = 2 },
    SolidStone = { IDs = { 7912 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Mining", "Engineering", "Blacksmithing" }, displayCategory = 2 },
    DenseStone = { IDs = { 12365 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Mining", "Engineering", "Blacksmithing" }, displayCategory = 2 },
    Pyrite = { IDs = { 249391 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Enchanting", "Engineering", "Tailoring", "Alchemy" }, displayCategory = 2 },

    -- Jewels
    Malachite = { IDs = { 774 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 2 },
    Tigerseye = { IDs = { 818 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 2 },
    MossAgate = { IDs = { 1206 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Leatherworking", "Blacksmithing", "Engineering" }, displayCategory = 2 },
    Shadowgem = { IDs = { 1210 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Engineering", "Tailoring", "Blacksmithing", "Leatherworking" }, displayCategory = 2 },
    Jade = { IDs = { 1529 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Engineering", "Tailoring", "Blacksmithing", "Leatherworking" }, displayCategory = 2 },
    LesserMoonstone = { IDs = { 1705 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 2 },
    Citrine = { IDs = { 3864 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Engineering", "Tailoring", "Blacksmithing", "Leatherworking" }, displayCategory = 2 },
    SmallLustrousPearl = { IDs = { 5498 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Leatherworking", "Blacksmithing", "Tailoring" }, displayCategory = 2 },
    IridescentPearl = { IDs = { 5500 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Leatherworking", "Blacksmithing", "Tailoring" }, displayCategory = 2 },
    Aquamarine = { IDs = { 7909 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Engineering", "Blacksmithing", "Enchanting" }, displayCategory = 2 },
    StarRuby = { IDs = { 7910 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Engineering", "Tailoring", "Blacksmithing", "Leatherworking" }, displayCategory = 2 },
    BlackVitriol = { IDs = { 9262 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Engineering", "Alchemy" }, displayCategory = 2 },
    BloodoftheMountain = { IDs = { 11382 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Enchanting", "Blacksmithing" }, displayCategory = 2 },
    BlackDiamond = { IDs = { 11754 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Enchanting", "Blacksmithing", "Leatherworking" }, displayCategory = 2 },
    BlueSapphire = { IDs = { 12361 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Blacksmithing", "Leatherworking" }, displayCategory = 2 },
    ArcaneCrystal = { IDs = { 12363 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Engineering", "Enchanting", "Alchemy" }, displayCategory = 2 },
    HugeEmerald = { IDs = { 12364 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Engineering", "Tailoring", "Blacksmithing", "Leatherworking" }, displayCategory = 2 },
    LargeOpal = { IDs = { 12799 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Engineering", "Blacksmithing", "Leatherworking" }, displayCategory = 2 },
    AzerothianDiamond = { IDs = { 12800 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Engineering", "Blacksmithing", "Leatherworking" }, displayCategory = 2 },
    GoldenPearl = { IDs = { 13926 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Blacksmithing", "Tailoring", "Leatherworking", "Enchanting" }, displayCategory = 2 },
    Souldarite = { IDs = { 19774 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Blacksmithing" }, displayCategory = 2 },
    FelCrystal = { IDs = { 248819 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Enchanting", "Alchemy" }, displayCategory = 2 },
}

ProfessionsHelperData["Forever"].Leather = {
    -- Leather
    LightLeather = { IDs = { 2318 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Blacksmithing", "Leatherworking", "Engineering", "Skinning", "Tailoring" }, displayCategory = 1 },
    MediumLeather = { IDs = { 2319 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Blacksmithing", "Leatherworking", "Engineering", "Skinning", "Tailoring" }, displayCategory = 1 },
    ThickLeather = { IDs = { 4304 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Blacksmithing", "Leatherworking", "Engineering", "Skinning", "Tailoring", "FirstAid" }, displayCategory = 1 },
    RuggedLeather = { IDs = { 8170 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Blacksmithing", "Leatherworking", "Engineering", "Skinning", "Tailoring" }, displayCategory = 1 },
    ChimeraLeather = { IDs = { 15423 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    CoreLeather = { IDs = { 17012 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Tailoring", "Blacksmithing" }, displayCategory = 1 },
    DevilsaurLeather = { IDs = { 15417 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Blacksmithing" }, displayCategory = 1 },
    FrostsaberLeather = { IDs = { 15422 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    HeavyLeather = { IDs = { 4234 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Engineering", "Tailoring", "Blacksmithing", "Skinning" }, displayCategory = 1 },
    PrimalBatLeather = { IDs = { 19767 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    PrimalTigerLeather = { IDs = { 19768 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    RuinedLeatherScraps = { IDs = { 2934 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    WarbearLeather = { IDs = { 15419 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    PristineLeather = { IDs = { 249427 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 1 },

    -- Hide
    LightHide = { IDs = { 783 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Skinning" }, displayCategory = 2 },
    MediumHide = { IDs = { 4232 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    HeavyHide = { IDs = { 4235 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Skinning" }, displayCategory = 2 },
    RuggedHide = { IDs = { 8171 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    ShadowcatHide = { IDs = { 7428 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    ThickHide = { IDs = { 8169 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Skinning" }, displayCategory = 2 },
    ThickWolfhide = { IDs = { 8368 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    PristineHide = { IDs = { 249428 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Engineering", "Tailoring", "Leatherworking" }, displayCategory = 2 },

    -- Scales
    DeviateScale = { IDs = { 6470 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    BlackDragonscale = { IDs = { 15416 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    BlackWhelpScale = { IDs = { 7286 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    BlueDragonscale = { IDs = { 15415 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    BrilliantChromaticScale = { IDs = { 12607 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    Dreamscale = { IDs = { 20381 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Tailoring", "Blacksmithing" }, displayCategory = 2 },
    GreenDragonscale = { IDs = { 15412 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    GreenWhelpScale = { IDs = { 7392 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Enchanting" }, displayCategory = 2 },
    HeavyScorpidScale = { IDs = { 15408 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    HeavySilithidCarapace = { IDs = { 20501 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    LightSilithidCarapace = { IDs = { 20500 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    PerfectDeviateScale = { IDs = { 6471 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    RedDragonscale = { IDs = { 15414 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    RedWhelpScale = { IDs = { 7287 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    ScaleofOnyxia = { IDs = { 15410 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Alchemy" }, displayCategory = 2 },
    ScorpidScale = { IDs = { 8154 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    SilithidChitin = { IDs = { 20498 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    TurtleScale = { IDs = { 8167 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    WornDragonscale = { IDs = { 8165 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
}

ProfessionsHelperData["Forever"].Cloth = {
    LinenCloth = { IDs = { 2589 }, sources = { "Drop" }, gatheringProf = "Tailoring", processingProfs = { "Engineering", "Tailoring", "Blacksmithing", "FirstAid" }, displayCategory = 1 },
    WoolCloth = { IDs = { 2592 }, sources = { "Drop" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring", "Engineering", "FirstAid" }, displayCategory = 1 },
    RuneCloth = { IDs = { 14047 }, sources = { "Drop" }, gatheringProf = "Tailoring", processingProfs = { "Engineering", "Tailoring", "FirstAid", "Leatherworking", "Enchanting", "Herbalism" }, displayCategory = 1 },
    FelCloth = { IDs = { 14256 }, sources = { "Drop" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring", "Leatherworking" }, displayCategory = 1 },
    MoonCloth = { IDs = { 14342 }, sources = { "Drop" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring", "Leatherworking" }, displayCategory = 1 },
}

ProfessionsHelperData["Forever"].Fishing = {
    RawSpottedYellowtail = { IDs = { 4603 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    RawLongjawMudSnapper = { IDs = { 6289 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    RawBrilliantSmallfish = { IDs = { 6291 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking", "Fishing" }, displayCategory = 4 },
    RawSlitherskinMackerel = { IDs = { 6303 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    RawBristleWhiskerCatfish = { IDs = { 6308 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    RawLochFrenzy = { IDs = { 6317 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    OilyBlackmouth = { IDs = { 6358 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Alchemy" }, displayCategory = 4 },
    FirefinSnapper = { IDs = { 6359 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Alchemy" }, displayCategory = 4 },
    RawRainbowFinAlbacore = { IDs = { 6361 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    RawRockscaleCod = { IDs = { 6362 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    DeviateFish = { IDs = { 6522 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking", "Alchemy" }, displayCategory = 4 },
    RawMithrilHeadTrout = { IDs = { 8365 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking", "Fishing" }, displayCategory = 4 },
    DarkShoreGrouper = { IDs = { 12238 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4},
    StonescaleEel = { IDs = { 13422 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Alchemy" }, displayCategory = 4 },
    RawGlossyMightfish = { IDs = { 13754 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    RawWinterSquid = { IDs = { 13755 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    RawSummerBass = { IDs = { 13756 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    RawRedgill = { IDs = { 13758 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    RawNightfinSnapper = { IDs = { 13759 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    RawSunscaleSalmon = { IDs = { 13760 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    DarkclawLobster = { IDs = { 13888 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    RawWhitescaleSalmon = { IDs = { 13889 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    RawPlatedArmorfish = { IDs = { 13890 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    LargeRawMightfish = { IDs = { 13893 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    RawSagefish = { IDs = { 21071 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    RawGreaterSagefish = { IDs = { 21153 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Whimsyfin = { IDs = { 251524 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
}

ProfessionsHelperData["Forever"].Enchanting = {
    -- Essences
    LesserMagicEssence = { IDs = { 10938 }, sources = { "Drop", "Crafted" }, gatheringerProf = "Enchanting", processingProfs = { "Blacksmithing", "Enchanting" }, displayCategory = 1 },
    GreaterMagicEssence = { IDs = { 10939 }, sources = { "Drop", "Crafted" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting" }, displayCategory = 1 },
    LesserAstralEssence = { IDs = { 10998 }, sources = { "Drop", "Crafted" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting" }, displayCategory = 1 },
    GreaterAstralEssence = { IDs = { 11082 }, sources = { "Drop", "Crafted" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting", "Tailoring" }, displayCategory = 1 },
    LesserMysticEssence = { IDs = { 11134 }, sources = { "Drop", "Crafted" }, gatheringerProf = "Enchanting", processingProfs = { "Tailoring", "Enchanting" }, displayCategory = 1 },
    GreaterMysticEssence = { IDs = { 11135 }, sources = { "Drop", "Crafted" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting" }, displayCategory = 1 },
    LesserNetherEssence = { IDs = { 11174 }, sources = { "Drop", "Crafted" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting" }, displayCategory = 1 },
    GreaterNetherEssence = { IDs = { 11175 }, sources = { "Drop", "Crafted" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting", "Tailoring" }, displayCategory = 1 },
    LesserEternalEssence = { IDs = { 16202 }, sources = { "Drop", "Crafted" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting" }, displayCategory = 1 },
    GreaterEternalEssence = { IDs = { 16203 }, sources = { "Drop", "Crafted" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting", "Tailoring", "Alchemy" }, displayCategory = 1 },

    -- Crystals
    SmallGlimmeringShard = { IDs = { 10978 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting" }, displayCategory = 1 },
    LargeGlimmeringShard = { IDs = { 11084 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting" }, displayCategory = 1 },
    SmallGlowingShard = { IDs = { 11138 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting" }, displayCategory = 1 },
    LargeGlowingShard = { IDs = { 11139 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting", "Blacksmithing" }, displayCategory = 1 },
    SmallRadiantShard = { IDs = { 11177 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting" }, displayCategory = 1 },
    LargeRadiantShard = { IDs = { 11178 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting", "Tailoring" }, displayCategory = 1 },
    SmallBrilliantShard = { IDs = { 14343 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting", "Tailoring" }, displayCategory = 1 },
    LargeBrilliantShard = { IDs = { 14344 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting", "Tailoring"  }, displayCategory = 1 },
    NexusCrystal = { IDs = { 20725 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting", "Blacksmithing" }, displayCategory = 1 },

    -- Dusts
    StrangeDust = { IDs = { 10940 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Blacksmithing", "Enchanting", "Leatherworking" }, displayCategory = 1 },
    SoulDust = { IDs = { 11083 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Alchemy", "Enchanting", "Leatherworking" }, displayCategory = 1 },
    VisionDust = { IDs = { 11137 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting", "Tailoring", "Leatherworking" }, displayCategory = 1 },
    DreamDust = { IDs = { 11176 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting", "Leatherworking", "Alchemy", "Tailoring" }, displayCategory = 1 },
    IllusionDust = { IDs = { 16204 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting"  }, displayCategory = 1 },
}

ProfessionsHelperData["Forever"].VendorDrop = {
    Writhing_Sample = { IDs = { 213611 }, sources = { "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining"}, processingProfs = { "Inscription", "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Skinning" }, displayCategory = 2 },
}


-- ==========================================
-- Materials
-- ==========================================
-- Crafted - Items (sources = Crafted; gatheringProf = <Category> (Herbalism, Skinning, Cooking, Leatherworking, Blacksmithing, Engineering, Enchanting, Inscription, Tailoring, Jewelcrafting))

ProfessionsHelperData["Forever"].Herbalism = {
    -- Mulch
    EmpoweredMulch = { IDs = { 219196 }, sources = { "Crafted" }, gatheringProf = "Herbalism", processingProfs = { "Herbalism" }, displayCategory = 3 },
}

ProfessionsHelperData["Forever"].Skinning = {
	-- Baits
    BeastLureScent = { IDs = { 219019 }, sources = { "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Skinning" }, displayCategory = 3 },

	-- Infused Baits
    SporefusedCreatureLure = { IDs = { 219011 }, sources = { "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Skinning" }, displayCategory = 3 },


	-- Fishbait
    RoaringAnglerseekerLure = { IDs = { 219006 }, sources = { "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Fishing" }, displayCategory = 3 },
}

ProfessionsHelperData["Forever"].Cooking = {
    -- Drop or Vendor
    Twined_Herbs = { IDs = { 222695 }, sources = { "Vendor" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 0 },

    -- Crafted
    Hearty_Feast = { IDs = { 228721 }, sources = { "Crafted" }, gatheringProf = "Cooking", processingProfs = { "Cooking" }, displayCategory = 0, note = "Warband" },
}

ProfessionsHelperData["Forever"].Leatherworking = {
    -- Crafting Materials
    StormTouchedWeaponWrap = { IDs = { 219901, 219902, 219903 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Leatherworking" }, displayCategory = 3 },

    -- Optional Reagents
    Writhing_Armor_Banding = { IDs = { 219504, 219505, 219506 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Leatherworking", "Tailoring", "Blacksmithing"  }, displayCategory = 3 },
}

ProfessionsHelperData["Forever"].Blacksmithing = {
    -- Alloys
    Ironclaw_Alloy = { IDs = { 222426, 222427, 222428 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Blacksmithing" }, displayCategory = 3 },

    -- Frameworks
    TemperedFramework = { IDs = { 222514, 222515, 222516 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Blacksmithing", "Engineering", "Leatherworking" }, displayCategory = 3 },
}

ProfessionsHelperData["Forever"].Engineering = {
    -- Drop
    Pile_of_Rusted_Scrap = { IDs = { 219150 }, sources = { "Drop" }, gatheringProf = "Engineering", processingProfs = { "Engineering" }, displayCategory = 2 },

    -- Crafting Materials
    Whimsical_Wiring = { IDs = { 221856, 221857, 221858 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Leatherworking", "Blacksmithing" }, displayCategory = 3 },

    -- Optional Reagents
    Concealed_Chaos_Module = { IDs = { 221938, 221939, 221940 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },

    -- Finishing Reagents
    BottledBrilliance = { IDs = { 225987, 225988, 225989 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "AllProf" }, displayCategory = 3 },
}

ProfessionsHelperData["Forever"].Tailoring = {
    -- Spools
    SpoolOfWeaverthread = { IDs = { 222795, 222796, 222797 }, color = "#FFB841", gradient_End_color = "#C64DA1", sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 1 },

    -- Bolts
    ExquisiteWeaverclothBolt = { IDs = { 224832, 224833, 224834 }, sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 1 },

    -- Optional Reagents
    Duskthread_Lining = { IDs = { 222871, 222872, 222873 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 3 },

    -- Finishing Reagents
    PreservingEmbroideryThread = { IDs = { 222885, 222886, 222887 }, sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 3 },
}

ProfessionsHelperData["Forever"].Alchemy = {
    -- Crafting Materials
    Coreway_Catalyst = { IDs = { 210815 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = "Alchemy" , displayCategory = 2 },

    -- Finishing Reagents
    PetalPowder = { IDs = { 228404, 228405, 228406 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Alchemy" }, displayCategory = 3 },

    -- Endproduct or Others
    harmonious_horticulture = { IDs = { 212563, 212564, 212565 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Alchemy", "Leatherworking" }, displayCategory = 3 },

    -- Mutagens
    Gleaming_Transmutagen = { IDs = { 211805 }, sources = { "Crafted", "Vendor" }, gatheringProf = "Alchemy", processingProfs = "Alchemy" , displayCategory = 2 },
}

ProfessionsHelperData["Forever"].Enchanting = {
    -- Optional Reagents
    Enchanted_Weathered_Harbinger_Crest = { IDs = { 224069 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 3 },

    -- Finishing Reagents
    MirrorPowder = { IDs = { 224176, 224177, 224178 }, sources = { "Crafted" }, gatheringProf = "Enchanting", processingProfs = { "Jewelcrafting" }, displayCategory = 3 },
}

ProfessionsHelperData["Forever"].FirstAid = {
    Heiltrank = { IDs = { 118 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
}

ProfessionsHelperData["Forever"].AllProf = {}


-- ==========================================
-- Spells of professions
-- ==========================================

ProfessionsHelperData["Forever"].Skills = {
    
    --Skinning
    Carve_Meat = {spellID = 442615, IDs = { 442615 }, gatheringProf = "Skinning", displayCategory = 5, sources = { "Spell" }, time = "Reload"},

    --Herbalism
    ArcaneDuplication = {spellID = 439190, IDs = { 439190 }, gatheringProf = "Herbalism", displayCategory = 5, sources = { "Spell" }, time = "CD"},
}


-- ==========================================
-- Recipes of professions
-- ==========================================

    -- Skinning
    -- Baits
    local recipe_elusiveCreatureLure = {
    yield = 1,
    { ids = {223512}, amount = 10 }, -- Basic_Meat
}

    -- Fishbaits
    local recipe_arathorHammerfishLure = {
    yield = 1,
    { ids = {220137}, amount = 2 }, -- Fish
}


-- Leatherworking
-- Materials
local recipe_chitinArmorBanding = {
    yield = 1,
    { ids = { 218336 }, amount = 1 },
    { ids = { 212674, 212675, 212676 }, amount = 1 },
    { ids = { 212667, 212668, 212669 }, amount = 30 },
}

-- OptionalsReagents
local recipe_blessedWeaponGrip = {
    yield = 1,
    { ids = { 219901, 219902, 219903 }, amount = 1 },
    { ids = { 221758 }, amount = 1 },
}


    -- Herbalism
    local recipe_magicalMulch = {
    yield = 1,
    { ids = {210796, 210797, 210798}, amount = 5 },
    }


    --Alchemy
    local recipe_algarManaPotion = {
    yield = 5,
    { ids = {211806, 211807, 211808}, amount = 1 },
    { ids = {210796, 210797, 210798}, amount = 6 },
    { ids = {210805, 210806, 210807}, amount = 3 },
}


-- 2. Das Rezept allen drei Qualitätsstufen des Endprodukts zuweisen
ProfessionsHelperData["Forever"].RecipeDB = {
    -- Skinning
    -- Baits
    [219007] = recipe_elusiveCreatureLure, -- BasicLure


    -- Fishbait



    -- Leatherworking
    -- Materials
    [219898] = recipe_chitinArmorBanding,


    -- OptionalsReagents
    [219495] = recipe_blessedWeaponGrip,


    -- Herbalism
    [219194] = recipe_magicalMulch,


    -- Blasphemite


    [430345] = { isSpell = true, spellID = 430345,
    slots = {
        { type = "group", key = "ExperimentHerbs", amount = 10 },
        { ids = {210815}, amount = 6 },
        { ids = {210814}, amount = 5 },
        },
    },
    
    [427174] = { isSpell = true, spellID = 427174,
    slots = {
        { type = "group", key = "ExperimentHerbs", amount = 20 },
        { ids = {210815}, amount = 2 },
        },
    },

    
}