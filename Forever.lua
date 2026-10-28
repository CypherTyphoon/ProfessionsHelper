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
}
ProfessionsHelperData["Forever"].Stone = {
    RoughStone = { IDs = { 2835 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Mining", "Engineering", "Blacksmithing" }, displayCategory = 2 },
    CoarseStone = { IDs = { 2836 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 2 },
    HeavyStone = { IDs = { 2838 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Mining", "Engineering", "Blacksmithing" }, displayCategory = 2 },
    SolidStone = { IDs = { 7912 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Mining", "Engineering", "Blacksmithing" }, displayCategory = 2 },
    DenseStone = { IDs = { 12365 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Mining", "Engineering", "Blacksmithing" }, displayCategory = 2 },
    Pyrite = { IDs = { 249391 }, sources = { "Drop" }, gatheringProf = "Mining", processingProfs = { "Enchanting", "Engineering", "Tailoring", "Alchemy" }, displayCategory = 2 },
}
ProfessionsHelperData["Forever"].Jewels = {
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
    LightLeather = { IDs = { 2318 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Blacksmithing", "Leatherworking", "Engineering", "Skinning", "Tailoring" }, displayCategory = 1 },
    MediumLeather = { IDs = { 2319 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Blacksmithing", "Leatherworking", "Engineering", "Skinning", "Tailoring" }, displayCategory = 1 },
    ThickLeather = { IDs = { 4304 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Blacksmithing", "Leatherworking", "Engineering", "Skinning", "Tailoring", "FirstAid" }, displayCategory = 1 },
    RuggedLeather = { IDs = { 8170 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Blacksmithing", "Leatherworking", "Engineering", "Skinning", "Tailoring" }, displayCategory = 1 },
    ChimeraLeather = { IDs = { 15423 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    CoreLeather = { IDs = { 17012 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Tailoring", "Blacksmithing" }, displayCategory = 1 },
    DevilsaurLeather = { IDs = { 15417 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Blacksmithing" }, displayCategory = 1 },
    FrostsaberLeather = { IDs = { 15422 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    HeavyLeather = { IDs = { 4234 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Engineering", "Tailoring", "Blacksmithing", "Skinning" }, displayCategory = 1 },
    PrimalBatLeather = { IDs = { 19767 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    PrimalTigerLeather = { IDs = { 19768 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    RuinedLeatherScraps = { IDs = { 2934 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    WarbearLeather = { IDs = { 15419 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    PristineLeather = { IDs = { 249427 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 1 },
}
ProfessionsHelperData["Forever"].Hide = {
    -- Hide
    LightHide = { IDs = { 783 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Skinning" }, displayCategory = 2 },
    MediumHide = { IDs = { 4232 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    HeavyHide = { IDs = { 4235 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Skinning" }, displayCategory = 2 },
    RuggedHide = { IDs = { 8171 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    ShadowcatHide = { IDs = { 7428 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    ThickHide = { IDs = { 8169 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Skinning" }, displayCategory = 2 },
    ThickWolfhide = { IDs = { 8368 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    PristineHide = { IDs = { 249428 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Engineering", "Tailoring", "Leatherworking" }, displayCategory = 2 },
}
ProfessionsHelperData["Forever"].Scales = {
    -- Scales
    DeviateScale = { IDs = { 6470 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    BlackDragonscale = { IDs = { 15416 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    BlackWhelpScale = { IDs = { 7286 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    BlueDragonscale = { IDs = { 15415 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    BrilliantChromaticScale = { IDs = { 12607 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    Dreamscale = { IDs = { 20381 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Tailoring", "Blacksmithing" }, displayCategory = 2 },
    GreenDragonscale = { IDs = { 15412 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    GreenWhelpScale = { IDs = { 7392 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Enchanting" }, displayCategory = 2 },
    HeavyScorpidScale = { IDs = { 15408 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    HeavySilithidCarapace = { IDs = { 20501 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    LightSilithidCarapace = { IDs = { 20500 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    PerfectDeviateScale = { IDs = { 6471 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    RedDragonscale = { IDs = { 15414 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    RedWhelpScale = { IDs = { 7287 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    ScaleofOnyxia = { IDs = { 15410 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking", "Alchemy" }, displayCategory = 2 },
    ScorpidScale = { IDs = { 8154 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    SilithidChitin = { IDs = { 20498 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    TurtleScale = { IDs = { 8167 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
    WornDragonscale = { IDs = { 8165 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 2 },
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

ProfessionsHelperData["Forever"].EnchantingEssences = {
    LesserMagicEssence = { IDs = { 10938 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Blacksmithing", "Enchanting" }, displayCategory = 1 },
    GreaterMagicEssence = { IDs = { 10939 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting" }, displayCategory = 1 },
    LesserAstralEssence = { IDs = { 10998 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting" }, displayCategory = 1 },
    GreaterAstralEssence = { IDs = { 11082 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting", "Tailoring" }, displayCategory = 1 },
    LesserMysticEssence = { IDs = { 11134 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Tailoring", "Enchanting" }, displayCategory = 1 },
    GreaterMysticEssence = { IDs = { 11135 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting" }, displayCategory = 1 },
    LesserNetherEssence = { IDs = { 11174 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting" }, displayCategory = 1 },
    GreaterNetherEssence = { IDs = { 11175 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting", "Tailoring" }, displayCategory = 1 },
    LesserEternalEssence = { IDs = { 16202 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting" }, displayCategory = 1 },
    GreaterEternalEssence = { IDs = { 16203 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting", "Tailoring", "Alchemy" }, displayCategory = 1 },
}
ProfessionsHelperData["Forever"].EnchahtingCrystals = {
    SmallGlimmeringShard = { IDs = { 10978 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting" }, displayCategory = 1 },
    LargeGlimmeringShard = { IDs = { 11084 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting" }, displayCategory = 1 },
    SmallGlowingShard = { IDs = { 11138 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting" }, displayCategory = 1 },
    LargeGlowingShard = { IDs = { 11139 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting", "Blacksmithing" }, displayCategory = 1 },
    SmallRadiantShard = { IDs = { 11177 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting" }, displayCategory = 1 },
    LargeRadiantShard = { IDs = { 11178 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting", "Tailoring" }, displayCategory = 1 },
    SmallBrilliantShard = { IDs = { 14343 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting", "Tailoring" }, displayCategory = 1 },
    LargeBrilliantShard = { IDs = { 14344 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting", "Tailoring"  }, displayCategory = 1 },
    NexusCrystal = { IDs = { 20725 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting", "Blacksmithing" }, displayCategory = 1 },
}
ProfessionsHelperData["Forever"].EnchantingDusts = {
    StrangeDust = { IDs = { 10940 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Blacksmithing", "Enchanting", "Leatherworking" }, displayCategory = 1 },
    SoulDust = { IDs = { 11083 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Alchemy", "Enchanting", "Leatherworking" }, displayCategory = 1 },
    VisionDust = { IDs = { 11137 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting", "Tailoring", "Leatherworking" }, displayCategory = 1 },
    DreamDust = { IDs = { 11176 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting", "Leatherworking", "Alchemy", "Tailoring" }, displayCategory = 1 },
    IllusionDust = { IDs = { 16204 }, sources = { "Drop" }, gatheringerProf = "Enchanting", processingProfs = { "Enchanting"  }, displayCategory = 1 },
}

ProfessionsHelperData["Forever"].VendorDrop = {

}


-- ==========================================
-- Materials
-- ==========================================
-- Crafted - Items (sources = Crafted; gatheringProf = <Category> (Herbalism, Skinning, Cooking, Leatherworking, Blacksmithing, Engineering, Enchanting, Inscription, Tailoring, Jewelcrafting))

ProfessionsHelperData["Forever"].Herbalism = {

}

ProfessionsHelperData["Forever"].Skinning = {

}

ProfessionsHelperData["Forever"].MiningCampfireItems = {
    RockGarden = { IDs = { 279948 }, sources = { "Crafted" }, gatheringProf = "Mining", displayCategory = 3, required = 140 },
    MoltenFoundry = { IDs = { 279952 }, sources = { "Crafted" }, gatheringProf = "Mining", displayCategory = 3, required = 300 },
    Lodestone = { IDs = { 279960 }, sources = { "Crafted" }, gatheringProf = "Mining", displayCategory = 3, required = 20 },
}
ProfessionsHelperData["Forever"].MiningBars = {
    CopperBar = { IDs = { 2840 }, sources = { "Crafted" }, gatheringProf = "Mining", displayCategory = 3, required = 25 },
    BronzeBar = { IDs = { 2841 }, sources = { "Crafted" }, gatheringProf = "Mining", displayCategory = 3, required = 65 },
    SilverBar = { IDs = { 2842 }, sources = { "Crafted" }, gatheringProf = "Mining", displayCategory = 3, required = 75 },
    IronBar = { IDs = { 3575 }, sources = { "Crafted" }, gatheringProf = "Mining", displayCategory = 3, required = 125 },
    TinBar = { IDs = { 3576 }, sources = { "Crafted" }, gatheringProf = "Mining", displayCategory = 3, required = 65 },
    GoldBar = { IDs = { 3577 }, sources = { "Crafted" }, gatheringProf = "Mining", displayCategory = 3, required = 155 },
    SteelBar = { IDs = { 3859 }, sources = { "Crafted" }, gatheringProf = "Mining", displayCategory = 3, required = 165 },
    MithrilBar = { IDs = { 3860 }, sources = { "Crafted" }, gatheringProf = "Mining", displayCategory = 3, required = 175 },
    TruesilverBar = { IDs = { 6037 }, sources = { "Crafted" }, gatheringProf = "Mining", displayCategory = 3, required = 230 },
    DarkIronBar = { IDs = { 11371 }, sources = { "Crafted" }, gatheringProf = "Mining", displayCategory = 3, required = 230 },
    ThoriumBar = { IDs = { 12359 }, sources = { "Crafted" }, gatheringProf = "Mining", displayCategory = 3, required = 250 },
    ElementiumBar = { IDs = { 17771 }, sources = { "Crafted" }, gatheringProf = "Mining", displayCategory = 3, required = 310 },
    ObsidianInfusedThoriumBar = { IDs = { 234003 }, sources = { "Crafted" }, gatheringProf = "Mining", displayCategory = 3, required = 315 },
    AzerothiumBar = { IDs = { 249726 }, sources = { "Crafted" }, gatheringProf = "Mining", displayCategory = 3, required = 275 },
    HeavyThoriumBar = { IDs = { 251291 }, sources = { "Crafted" }, gatheringProf = "Mining", displayCategory = 3, required = 300 },
}

-- Leatherworking
ProfessionsHelperData["Forever"].LeatherworkingLeatherAndHide = {
    LightLeather = { IDs = { 2318 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },
    MediumLeather = { IDs = { 2319 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },
    HeavyLeather = { IDs = { 4234 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },
    ThickLeather = { IDs = { 4304 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },
    RuggedLeather = { IDs = { 8170 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },
    FaintlyGlowingLeather = { IDs = { 213369 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },

    CuredLightHide = { IDs = { 4231 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },
    CuredMediumHide = { IDs = { 4233 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },
    CuredHeavyHide = { IDs = { 4236 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },
    CuredThickHide = { IDs = { 8172 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },
    CuredRuggedHide = { IDs = { 15407 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },
}
ProfessionsHelperData["Forever"].LeatherworkingCampfireItems = {
    CampTant = { IDs = { 279978 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3},
    TanningRack = { IDs = { 279941 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3},
    SewingMachine = { IDs = { 279945 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3},
}
ProfessionsHelperData["Forever"].LeatherworkingArmorKits = {
    LightArmorKit = { IDs = { 2304 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },

    MediumArmorKit = { IDs = { 2313 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },
    MysticMediumArmorKit = { IDs = { 252436 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },
    ForcefulMediumArmorKit = { IDs = { 252437 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },

    HeavyArmorKit = { IDs = { 4265 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },
    MysticHeavyArmorKit = { IDs = { 252452 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },
    ForcefulHeavyArmorKit = { IDs = { 252453 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },

    ThickArmorKit = { IDs = { 8173 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },
    MysticThickArmorKit = { IDs = { 252462 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },
    ForcefulThickArmorKit = { IDs = { 252463 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },

    RuggedArmorKit = { IDs = { 15564 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },
    MysticRuggedArmorKit = { IDs = { 252487 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },
    ForcefulRuggedArmorKit = { IDs = { 252488 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },

    WildLeatherArmorKit = { IDs = { 279258 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },
    CoreArmorKit = { IDs = { 18251 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", displayCategory = 3 },
}


ProfessionsHelperData["Forever"].BlacksmithingCampfire = {
    SharpeningWheelTier1 = { IDs = { 279944 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 20 },
    AnvilTier2 = { IDs = { 279988 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 140 },
    MasterForgeTier3 = { IDs = { 279955 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 300 },
}
ProfessionsHelperData["Forever"].BlacksmithingCraftingMaterials = {
    CopperRod = { IDs = { 6217 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 10 },
    RoughGrindingStone = { IDs = { 3470 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 25 },
    SilverRod = { IDs = { 6338 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 75 },
    HeavyGrindingStone = { IDs = { 3486 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 100 },
    IronBuckle = { IDs = { 7071 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 125 },
    CoarseGrindingStone = { IDs = { 3478 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 50 },
    GoldenRod = { IDs = { 11128 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 125 },
    SolidGrindingStone = { IDs = { 7966 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 175 },
    InlaidMithrilCylinder = { IDs = { 9060 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 200 },
    DenseGrindingStone = { IDs = { 12644 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 225 },
    ArcaniteRod = { IDs = { 16206 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 250 },
}
ProfessionsHelperData["Forever"].BlacksmithingWeaponStones = {
    RoughSharpeningStone = { IDs = { 2862 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 15 },
    RoughWeightstone = { IDs = { 3239 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 15 },
    CoarseWeightstone = { IDs = { 3240 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 40 },
    CoarseSharpeningStone = { IDs = { 2863 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 40 },
    HeavySharpeningStone = { IDs = { 2871 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 100 },
    HeavyWeightstone = { IDs = { 3241 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 100 },
    SolidSharpeningStone = { IDs = { 7964 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 175 },
    SolidWeightstone = { IDs = { 7965 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 175 },
    DenseWeightstone = { IDs = { 12643 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 225 },
    DenseSharpeningStone = { IDs = { 12404 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 225 },
    ElementalSharpeningStone = { IDs = { 18262 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 300 },
    ObsidianGrindingStone = { IDs = { 22202 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 315 },
}
ProfessionsHelperData["Forever"].BlacksmithingWeaponChainsShieldSpikesSpurs = {
    SteelWeaponChain = { IDs = { 6041 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 190 },
    IronShieldSpike = { IDs = { 6042 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 150 },
    MithrilShieldSpike = { IDs = { 7967 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 215 },
    MithrilSpurs = { IDs = { 7969 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 235 },
}
ProfessionsHelperData["Forever"].BlacksmithingKeys = {
    SilverSkeletonKey = { IDs = { 15869 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 75 },
    GoldenSkeletonKey = { IDs = { 15870 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 125 },
    ArcaniteSkeletonKey = { IDs = { 15872 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 250 },
    TruesilverSkeletonKey = { IDs = { 15871 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", displayCategory = 3, required = 175 },
}


ProfessionsHelperData["Forever"].EngineeringCampfireItems = { 
    RegentBot = { IDs = { 279950 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    RepairBot = { IDs = { 279949 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    AnarchistsWorkbench = { IDs = { 279989 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
}
ProfessionsHelperData["Forever"].EngineeringAmmunition = {
    CraftedLightShot = { IDs = { 8067 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    CraftedHeavyShot = { IDs = { 8068 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    CraftedSolidShot = { IDs = { 8069 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    HIImpactMithrilSlugs = { IDs = { 10512 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    MithrilGyroShot = { IDs = { 10513 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    ThoriumShells = { IDs = { 15997 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    SwiftfeatherArrow = { IDs = { 274387 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    SwiftstrikeShot = { IDs = { 274388 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
}
ProfessionsHelperData["Forever"].EngineeringBlastingPowder = {
    RoughBlastingPowder = { IDs = { 4357 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    CoarseBlastingPowder = { IDs = { 4364 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    HeavyBlastingPowder = { IDs = { 4377 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    SolidBlastingPowder = { IDs = { 10505 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    DenseBlastingPowder = { IDs = { 15992 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
}
ProfessionsHelperData["Forever"].EngineeringTubesFrames = {
    CopperTube = { IDs = { 4361 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    BronzeTube = { IDs = { 4371 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    BronzeFramework = { IDs = { 4382 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    MithrilTube = { IDs = { 10559 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    MithrilCasing = { IDs = { 10561 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    ThoriumTube = { IDs = { 16000 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
}
ProfessionsHelperData["Forever"].EngineeringElectronicParts = {
    CopperModulator = { IDs = { 4363 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    IronStrut = { IDs = { 4387 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    Gyrochronatom = { IDs = { 4389 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    SilverContact = { IDs = { 4404 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    GoldPowerCore = { IDs = { 10558 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    UnstableTrigger = { IDs = { 10560 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    ThoriumWidget = { IDs = { 15994 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
    TruesilverTransformer = { IDs = { 18631 }, sources = { "Crafted" }, gatheringProf = "Engineering", displayCategory = 3 },
}


ProfessionsHelperData["Forever"].TailoringBolts = {
    BoltOfLinenCloth = { IDs = { 2996 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 3, required = 25 },
    BoltOfWoolenCloth = { IDs = { 2997 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 3, required = 55 },
    BoltOfSilkCloth = { IDs = { 4305 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 3, required = 100 },
    BoltOfMageweave = { IDs = { 4339 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 3, required = 140 },
    BoltOfRunecloth = { IDs = { 14048 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 3, required = 205 },
    BoltOfQirajiSilk = { IDs = { 22279 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 3, required = 315 },
}
ProfessionsHelperData["Forever"].TailoringCloths = {
    Mooncloth = { IDs = { 14342 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 3, required = 230 },
}
ProfessionsHelperData["Forever"].TailoringCampfire = {
    FactionBannerAllianceTier1 = { IDs = { 279973 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 3, required = 20 },
    FactionBannerHordeTier1 = { IDs = { 279972 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 3, required = 20 },
    SpinningWheelTier2 = { IDs = { 279943 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 3, required = 140 },
    LoomTier4 = { IDs = { 279959 }, sources = { "Crafted" }, gatheringProf = "Tailoring", displayCategory = 3, required = 300 },
}


ProfessionsHelperData["Forever"].AlchemyCampfire = {
    ManaWell = { IDs = { 279956 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
    Fermenter = { IDs = { 279970 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
    AlchemyLaboratory = { IDs = { 279990 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
}
ProfessionsHelperData["Forever"].AlchemyTransmute = {
    GoldBar = { IDs = { 3577 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
    TrueSilverBar = { IDs = { 6037 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
    ElementalFire = { IDs = { 7068 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
    EssenceOfFire = { IDs = { 7078 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
    EssenceOfWater = { IDs = { 7080 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
    EssenceOfAir = { IDs = { 7082 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
    ArcaniteBar = { IDs = { 12360 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
    EssenceofUndeath = { IDs = { 12808 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
    EssenceofLife = { IDs = { 12803 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
    LegioniteBar = { IDs = { 251290 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
}
ProfessionsHelperData["Forever"].AlchemyDyes = {
    GhostDye = { IDs = { 9210 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
    CeruleanDye = { IDs = { 249409 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
    MagentaDye = { IDs = { 249430 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
    ViridianDye = { IDs = { 249431 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
}
ProfessionsHelperData["Forever"].AlchemyMixes = {
    BlackmouthOil = { IDs = { 6370 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
    FireOil = { IDs = { 6371 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
    GoblinRocketFuel = { IDs = { 9061 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
    StonescaleOil = { IDs = { 13423 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
    SulfuricAcid = { IDs = { 249410 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
}
ProfessionsHelperData["Forever"].AlchemyPotions = {
    MinorManaPotion = { IDs = { 2455 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 25 },
    LesserManaPotion = { IDs = { 3385 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 120 },
    ManaPotion = { IDs = { 3827 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 160 },
    GreaterManaPotion = { IDs = { 6149 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 205 },
    SuperiorManaPotion = { IDs = { 13443 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 260 },
    MajorManaPotion = { IDs = { 13444 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 295 },
    MinorRejuvenationPotion = { IDs = { 2456 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 40 },
    MajorRejuvenationPotion = { IDs = { 18253 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 300 },
    LesserInvisibilityPotion = { IDs = { 3823 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 165 },
    InvisibilityPotion = { IDs = { 9172 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 235 },
    MinorDiscoloredHealingPotion = { IDs = { 4596 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 50 },
    LesserDiscoloredHealingPotion = { IDs = { 247239 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 85 },
    DiscoloredHealingPotion = { IDs = { 247240 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 135 },
    GreaterDiscoloredHealingPotion = { IDs = { 247241 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 175 },
    SuperiorDiscoloredHealingPotion = { IDs = { 247242 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 230 },
    MajorDiscoloredHealingPotion = { IDs = { 241650 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 250 },
    LesserStoneshieldPotion = { IDs = { 4623 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 215 },
    GreaterStoneshieldPotion = { IDs = { 13455 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 280 },
    ShadowProtectionPotion = { IDs = { 6048 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 135 },
    GreaterShadowProtectionPotion = { IDs = { 13459 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 290 },
    FireProtectionPotion = { IDs = { 6049 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 165 },
    GreaterFireProtectionPotion = { IDs = { 13457 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 290 },
    FrostProtectionPotion = { IDs = { 6050 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 190 },
    GreaterFrostProtectionPotion = { IDs = { 13456 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 290 },
    NatureProtectionPotion = { IDs = { 6052 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 190 },
    GreaterNatureProtectionPotion = { IDs = { 13458 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 290 },
    DreamlessSleepPotion = { IDs = { 12190 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 230 },
    GreaterDreamlessSleepPotion = { IDs = { 20002 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 275 },
    MinorSpellblastingPotion = { IDs = { 250932 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 35 },
    LesserSpellblastingPotion = { IDs = { 250933 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 85 },
    SpellblastingPotion = { IDs = { 250934 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 135 },
    GreaterSpellblastingPotion = { IDs = { 250935 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 185 },
    SuperiorSpellblastingPotion = { IDs = { 250936 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 235 },
    MajorSpellblastingPotion = { IDs = { 250937 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 285 },
    MinorFrenzyPotion = { IDs = { 250938 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 40 },
    LesserFrenzyPotion = { IDs = { 250939 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 90 },
    FrenzyPotion = { IDs = { 250940 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 140 },
    GreaterFrenzyPotion = { IDs = { 250941 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 190 },
    SuperiorFrenzyPotion = { IDs = { 250942 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 240 },
    MajorFrenzyPotion = { IDs = { 250943 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 290 },
    MinorMendersPotion = { IDs = { 250944 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 30 },
    LesserMendersPotion = { IDs = { 250945 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 80 },
    MendersPotion = { IDs = { 250946 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 130 },
    GreaterMendersPotion = { IDs = { 250947 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 180 },
    SuperiorMendersPotion = { IDs = { 250948 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 230 },
    MajorMendersPotion = { IDs = { 250949 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 280 },
    SwiftnessPotion = { IDs = { 2459 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 60 },
    MinorMagicResistancePotion = { IDs = { 3384 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 110 },
    PotionOfPoisonCleansing = { IDs = { 3386 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 120 },
    LimitedInvulnerabilityPotion = { IDs = { 3387 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 250 },
    RagePotion = { IDs = { 5631 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 60 },
    GreatRagePotion = { IDs = { 5633 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 175 },
    FreeActionPotion = { IDs = { 5634 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 150 },
    HolyProtectionPotion = { IDs = { 6051 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 100 },
    SwimSpeedPotion = { IDs = { 6372 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 100 },
    RestorativePotion = { IDs = { 9030 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 225 },
    MagicResistancePotion = { IDs = { 9036 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 210 },
    WildvinePotion = { IDs = { 9144 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 225 },
    PotionOfDemonSlaying = { IDs = { 9224 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 250 },
    MightyRagePotion = { IDs = { 13442 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 255 },
    GreaterArcaneProtectionPotion = { IDs = { 13461 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 290 },
    PurificationPotion = { IDs = { 13462 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 285 },
    LivingActionPotion = { IDs = { 20008 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 285 },
    PotionOfPredatorySenses = { IDs = { 250327 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 195 },
    PotionOfVenomousBlood = { IDs = { 250950 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 275 },
    CausticSmogPotion = { IDs = { 250951 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 265 },
    DragonfirePotion = { IDs = { 250953 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 245 },
    PotionOfElementalPurging = { IDs = { 250954 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 280 },
    PotionOfBeastSlaying = { IDs = { 250955 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 280 },
}
ProfessionsHelperData["Forever"].AlchemyElixirs = {
    ElixirOfMinorStrength = { IDs = { 2454 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 15 },
    ElixirOfStrength = { IDs = { 250349 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 150 },
    ElixirOfGreaterStrength = { IDs = { 9206 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 245 },
    ElixirOfMinorAgility = { IDs = { 2457 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 50 },
    ElixirOfLesserAgility = { IDs = { 3390 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 140 },
    ElixirOfAgility = { IDs = { 8949 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 185 },
    ElixirOfGreaterAgility = { IDs = { 9187 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 240 },
    ElixirOfMinorFortitude = { IDs = { 2458 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 50 },
    ElixirOfLesserFortitude = { IDs = { 3825 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 175 },
    ElixirOfFortitude = { IDs = { 250334 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 150 },
    ElixirOfGreaterFortitude = { IDs = { 250335 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 200 },
    MinorTrollsBloodElixir = { IDs = { 3382 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 15 },
    LesserTrollsBloodElixir = { IDs = { 3388 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 125 },
    TrollsBloodElixir = { IDs = { 3826 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 180 },
    MajorTrollsBloodElixir = { IDs = { 20004 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 290 },
    ElixirOfMinorDefense = { IDs = { 5997 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 55 },
    ElixirOfLesserDefense = { IDs = { 3389 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 130 },
    ElixirOfDefense = { IDs = { 8951 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 195 },
    ElixirOfGreaterDefense = { IDs = { 13445 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 265 },
    MinorArcaneElixir = { IDs = { 247754 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 10 },
    LesserArcaneElixir_250342 = { IDs = { 250342 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 120 },
    LesserArcaneElixir_217398 = { IDs = { 217398 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 190 },
    ArcaneElixir = { IDs = { 9155 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 235 },
    GreaterArcaneElixir = { IDs = { 13454 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 285 },
    ElixirOfLesserIntellect = { IDs = { 250353 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 95 },
    ElixirOfIntellect = { IDs = { 250354 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 135 },
    ElixirOfGreaterIntellect = { IDs = { 9179 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 235 },
    MinorMagebloodElixir = { IDs = { 250339 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 25 },
    LesserMagebloodElixir = { IDs = { 250340 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 75 },
    MagebloodElixir = { IDs = { 20007 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 275 },
    GreaterMagebloodElixir = { IDs = { 250341 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 175 },
    MinorClericsElixir = { IDs = { 250330 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 45 },
    LesserClericsElixir = { IDs = { 250331 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 95 },
    ClericsElixir = { IDs = { 250332 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 145 },
    GreaterClericsElixir = { IDs = { 250333 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 195 },
    ElixirOfMinorSpirit = { IDs = { 250344 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 15 },
    ElixirOfLesserSpirit = { IDs = { 250345 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 65 },
    ElixirOfSpirit = { IDs = { 250346 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 115 },
    ElixirOfGreaterSpirit = { IDs = { 250347 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 165 },
    ElixirOfWisdom = { IDs = { 3383 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 90 },
    ElixirOfOgreStrength = { IDs = { 3391 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 150 },
    ElixirOfFirePower = { IDs = { 6373 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 140 },
    ElixirOfGiantGrowth = { IDs = { 6662 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 90 },
    ElixirOfShadowPower = { IDs = { 9264 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 250 },
    ElixirOfTheSages = { IDs = { 13447 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 270 },
    ElixirOfTheMongoose = { IDs = { 13452 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 280 },
    ElixirOfBruteForce = { IDs = { 13453 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 275 },
    ElixirOfFrostPower = { IDs = { 17708 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 190 },
    ElixirOfHolyPower = { IDs = { 21546 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 250 },
    ElixirOfCoalescedRegret = { IDs = { 210708 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 90 },
    ElixirOfTheHoneyBadger = { IDs = { 233967 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 315 },
    ElixirOfTheMageLord = { IDs = { 233968 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 315 },
    ElixirOfTheIronside = { IDs = { 233969 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 315 },
    ElixirOfAlacrity = { IDs = { 233977 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 315 },
    ElixirOfMinorForce = { IDs = { 247755 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 10 },
    ElixirOfCunning = { IDs = { 250328 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 275 },
    ElixirOfThePhalanx = { IDs = { 250329 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 250 },
    ElixirOfWickedRegeneration = { IDs = { 250336 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 285 },
    ElixirOfTheOwl = { IDs = { 250337 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 280 },
    ElixirOfSages = { IDs = { 250338 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 275 },
    ElixirOfNaturePower = { IDs = { 250343 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 285 },
    ElixirOfTheWhale = { IDs = { 250348 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 275 },
    ElixirOfFerocity = { IDs = { 250350 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 275 },
    ElixirOfTheGrizzly = { IDs = { 250351 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 300 },
}
ProfessionsHelperData["Forever"].AlchemyFlasks = {
    FlaskOfPetrification = { IDs = { 13506 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 300 },
    FlaskOfTheTitans = { IDs = { 13510 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 300 },
    FlaskOfDistilledWisdom = { IDs = { 13511 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 300 },
    FlaskOfSupremePower = { IDs = { 13512 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 300 },
    FlaskOfChromaticResistance = { IDs = { 13513 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 300 },
    FlaskOfEverlastingNightmares = { IDs = { 221024 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 250 },
    FlaskOfRestlessDreams = { IDs = { 222952 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 250 },
    FlaskOfMadness = { IDs = { 233962 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 315 },
    FlaskOfAncientKnowledge = { IDs = { 233964 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 315 },
    FlaskOfTheOldGods = { IDs = { 233965 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 315 },
    FlaskOfUnyieldingSorrow = { IDs = { 233966 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 315 },
    FlaskOfNaturalAccuracy = { IDs = { 274273 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 300 },
    FlaskOfNaturalAggression = { IDs = { 274274 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 300 },
    FlaskOfNaturalPrecision = { IDs = { 274275 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 300 },
    FlaskOfNaturalSwiftness = { IDs = { 274276 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 300 },
}
ProfessionsHelperData["Forever"].AlchemyWeaponOils = {
    ShadowOil = { IDs = { 3824 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 165 },
    FrostOil = { IDs = { 3829 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 200 },
    OilOfImmolation = { IDs = { 8956 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3, required = 205 },
}


ProfessionsHelperData["Forever"].EnchantingCampfire = {
    EnchantedLute = { IDs = { 279976 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 3, required = 20 },
    ArcaneSalvager = { IDs = { 279985 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 3, required = 140 },
    ArcaneForge = { IDs = { 279987 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 3, required = 300 },
}
ProfessionsHelperData["Forever"].EnchantingWeaponOils = {
    MinorWizardOil = { IDs = { 20744 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 3, required = 45 },
    LesserWizardOil = { IDs = { 20746 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 3, required = 200 },
    WizardOil = { IDs = { 20750 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 3, required = 275 },
    BrilliantWizardOil = { IDs = { 20749 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 3, required = 300 },
    MinorManaOil = { IDs = { 20745 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 3, required = 150 },
    LesserManaOil = { IDs = { 20747 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 3, required = 250 },
    BrilliantManaOil = { IDs = { 20748 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 3, required = 300 },
    BlackfathomManaOil = { IDs = { 211848 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 3, required = 100 },
}
ProfessionsHelperData["Forever"].EnchantingSigils = {
    EnchantedSigilInnovation = { IDs = { 217308 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 3, required = 225 },
    EnchantedSigilFlowingWaters = { IDs = { 228978 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 3, required = 290 },
}
ProfessionsHelperData["Forever"].EnchantingCraftingMaterials = {
    EnchantedThoriumBar = { IDs = { 12655 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 3, required = 250 },
    EnchantedLeather = { IDs = { 12810 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 3, required = 250 },
    MoteOfMagic = { IDs = { 247786 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 3, required = 10 },
}
ProfessionsHelperData["Forever"].EnchantingShieldOils = {
    ConductiveShieldCoating = { IDs = { 228980 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 3, required = 275 },
    MagnificentTrollshine = { IDs = { 232611 }, sources = { "Crafted" }, gatheringProf = "Enchanting", displayCategory = 3, required = 300 },
}


ProfessionsHelperData["Forever"].FirstAidBandages = {
    LinenBandage = { IDs = { 1251 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    HeavyLinenBandage = { IDs = { 2581 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    WoolBandage = { IDs = { 3530 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    HeavyWoolBandage = { IDs = { 3531 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    SilkBandage = { IDs = { 6450 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    HeavySilkBandage = { IDs = { 6451 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    MageWeaveBandage = { IDs = { 8544 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    HeavyMageWeaveBandage = { IDs = { 8545 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    RuneClothBandage = { IDs = { 14529 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    HeavyRuneClothBandage = { IDs = { 14530 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    DenseRuneClothBandage = { IDs = { 470349 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
}
ProfessionsHelperData["Forever"].FirstAidPotions = {
    MinorHealingPotion = { IDs = { 118 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    LesserHealingPotion = { IDs = { 858 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    HealingPotion = { IDs = { 929 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    GreaterHealingPotion = { IDs = { 1710 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    SuperiorHealingPotion = { IDs = { 3928 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    MajorHealingPotion = { IDs = { 13446 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
}
ProfessionsHelperData["Forever"].FirstAidOthers = {
    SimplePoultice = { IDs = { 255716 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    CleverPoultice = { IDs = { 255717 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    SuperiorPoultice = { IDs = { 255718 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    PowerfulPoultice = { IDs = { 255719 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    WoolenTourniquet = { IDs = { 255720 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    LeatherTourniquet = { IDs = { 255721 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    SurgicalTourniquet = { IDs = { 255722 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    AntiVenom = { IDs = { 6452 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    StrongAntiVenom = { IDs = { 6453 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    PotentAntiVenom = { IDs = { 255715 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3 },
    PowerfulAntiVenom = { IDs = { 19440 }, sources = { "Crafted" }, gatheringProf = "FirstAid", displayCategory = 3},
}


ProfessionsHelperData["Forever"].Cooking = {

}

ProfessionsHelperData["Forever"].AllProf = {}


-- ==========================================
-- Spells of professions
-- ==========================================

ProfessionsHelperData["Forever"].Skills = {
-- Leatherworking
    Dragonscale = {spellID = 10656, IDs = { 10656 }, gatheringProf = "Leatherworking", displayCategory = 5, sources = { "Spell" }},
    Elemental = {spellID = 10658, IDs = { 10658 }, gatheringProf = "Leatherworking", displayCategory = 5, sources = { "Spell" }},
    Tribal = {spellID = 10660, IDs = { 10660 }, gatheringProf = "Leatherworking", displayCategory = 5, sources = { "Spell" }},

    -- Blacksmithing
    Weaponsmith = {spellID = 9787, IDs = { 9787 }, gatheringProf = "Blacksmithing", displayCategory = 5, sources = { "Spell" }},
    Armorsmith = {spellID = 9788, IDs = { 9788 }, gatheringProf = "Blacksmithing", displayCategory = 5, sources = { "Spell" }},

    -- Engineering
    GnomishEngineer = {spellID = 20219, IDs = { 20219 }, gatheringProf = "Engineering", displayCategory = 5, sources = { "Spell" }},
    GoblinEngineer = {spellID = 20222, IDs = { 20222 }, gatheringProf = "Engineering", displayCategory = 5, sources = { "Spell" }},
}


-- ==========================================
-- Recipes of professions
-- ==========================================

ProfessionsHelperData['Forever'].RecipeDB = {}
    -- ========================================
    -- Mining
    -- ========================================
do
    -- CampfireItem
    local recipe_RockGarden = {
        yield = 1,
        { ids = { 2838 }, amount = 2 },
        { ids = { 2772 }, amount = 1 },
        { ids = { 2842 }, amount = 1 },
    }

    local recipe_MoltenFoundry = {
        yield = 1,
        { ids = { 12359 }, amount = 5 },
        { ids = { 12365 }, amount = 2 },
        { ids = { 6037 }, amount = 1 },
    }

    local recipe_Lodestone = {
        yield = 1,
        { ids = { 2835 }, amount = 1 },
        { ids = { 2840 }, amount = 1 },
    }

    -- Bars
    local recipe_CopperBar = {
        yield = 1,
        { ids = { 2770 }, amount = 1 },
    }

    local recipe_BronzeBar = {
        yield = 2,
        { ids = { 2840 }, amount = 1 },
        { ids = { 3576 }, amount = 1 },
    }

    local recipe_SilverBar = {
        yield = 1,
        { ids = { 2775 }, amount = 1 },
    }

    local recipe_IronBar = {
        yield = 1,
        { ids = { 2772 }, amount = 1 },
    }

    local recipe_TinBar = {
        yield = 1,
        { ids = { 2771 }, amount = 1 },
    }

    local recipe_GoldBar = {
        yield = 1,
        { ids = { 2776 }, amount = 1 },
    }

    local recipe_SteelBar = {
        yield = 1,
        { ids = { 3575 }, amount = 1 },
        { ids = { 3857 }, amount = 1 },
    }

    local recipe_MithrilBar = {
        yield = 1,
        { ids = { 3858 }, amount = 1 },
    }

    local recipe_TruesilverBar = {
        yield = 1,
        { ids = { 7911 }, amount = 1 },
    }

    local recipe_DarkIronBar = {
        yield = 1,
        { ids = { 11370 }, amount = 8 },
    }

    local recipe_ThoriumBar = {
        yield = 1,
        { ids = { 10620 }, amount = 1 },
    }

    local recipe_ElementiumBar = {
        yield = 1,
        { ids = { 18562 }, amount = 1 },
        { ids = { 12360 }, amount = 10 },
        { ids = { 17010 }, amount = 1 },
        { ids = { 18567 }, amount = 3 },
    }

    local recipe_ObsidianInfusedThoriumBar = {
        yield = 1,
        { ids = { 12655 }, amount = 2 },
        { ids = { 22203 }, amount = 2 },
    }

    local recipe_AzerothiumBar = {
        yield = 1,
        { ids = { 249426 }, amount = 2 },
        { ids = { 3857 }, amount = 1 },
    }

    local recipe_HeavyThoriumBar = {
        yield = 1,
        { ids = { 248815 }, amount = 1 },
    }

    ProfessionsHelperData['Forever'].RecipeDB = ProfessionsHelperData['Forever'].RecipeDB or {}
    ProfessionsHelperData['Forever'].RecipeDB['Mining'] = {
        -- CampfireItem
        [279948] = recipe_RockGarden,
        [279952] = recipe_MoltenFoundry,
        [279960] = recipe_Lodestone,
        -- Bars
        [2840] = recipe_CopperBar,
        [2841] = recipe_BronzeBar,
        [2842] = recipe_SilverBar,
        [3575] = recipe_IronBar,
        [3576] = recipe_TinBar,
        [3577] = recipe_GoldBar,
        [3859] = recipe_SteelBar,
        [3860] = recipe_MithrilBar,
        [6037] = recipe_TruesilverBar,
        [11371] = recipe_DarkIronBar,
        [12359] = recipe_ThoriumBar,
        [17771] = recipe_ElementiumBar,
        [234003] = recipe_ObsidianInfusedThoriumBar,
        [249726] = recipe_AzerothiumBar,
        [251291] = recipe_HeavyThoriumBar,
    }
end
    -- ========================================
    -- Enchanting
    -- ========================================
do
    -- Campfire
    local recipe_EnchantedLute = {
        yield = 1,
        { ids = { 4470 }, amount = 1 },
        { ids = { 10940 }, amount = 1 },
    }

    local recipe_ArcaneSalvager = {
        yield = 1,
        { ids = { 11137 }, amount = 1 },
        { ids = { 11174 }, amount = 2 },
    }

    local recipe_ArcaneForge = {
        yield = 1,
        { ids = { 273128 }, amount = 1 },
        { ids = { 14344 }, amount = 2 },
        { ids = { 16203 }, amount = 4 },
    }

    -- WeaponOil
    local recipe_MinorWizardOil = {
        yield = 1,
        { ids = { 10940 }, amount = 1 },
        { ids = { 17034 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_LesserWizardOil = {
        yield = 1,
        { ids = { 11137 }, amount = 1 },
        { ids = { 17035 }, amount = 1 },
        { ids = { 3372 }, amount = 2 },
    }

    local recipe_WizardOil = {
        yield = 1,
        { ids = { 16204 }, amount = 3 },
        { ids = { 4625 }, amount = 2 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_BrilliantWizardOil = {
        yield = 1,
        { ids = { 14344 }, amount = 2 },
        { ids = { 4625 }, amount = 3 },
        { ids = { 18256 }, amount = 1 },
    }

    local recipe_MinorManaOil = {
        yield = 1,
        { ids = { 11083 }, amount = 1 },
        { ids = { 17034 }, amount = 1 },
        { ids = { 3372 }, amount = 2 },
    }

    local recipe_LesserManaOil = {
        yield = 1,
        { ids = { 11176 }, amount = 1 },
        { ids = { 8831 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_BrilliantManaOil = {
        yield = 1,
        { ids = { 14344 }, amount = 2 },
        { ids = { 8831 }, amount = 3 },
        { ids = { 18256 }, amount = 1 },
    }

    local recipe_BlackfathomManaOil = {
        yield = 1,
        { ids = { 3372 }, amount = 1 },
        { ids = { 10939 }, amount = 1 },
        { ids = { 10940 }, amount = 5 },
    }

    -- Sigil
    local recipe_EnchantedSigilInnovation = {
        yield = 1,
        { ids = { 11137 }, amount = 5 },
    }

    local recipe_EnchantedSigilFlowingWaters = {
        yield = 1,
        { ids = { 16204 }, amount = 1 },
    }

    -- Craftingmaterial
    local recipe_EnchantedThoriumBar = {
        yield = 1,
        { ids = { 12359 }, amount = 1 },
        { ids = { 11176 }, amount = 3 },
    }

    local recipe_EnchantedLeather = {
        yield = 1,
        { ids = { 8170 }, amount = 1 },
        { ids = { 16202 }, amount = 1 },
    }

    local recipe_MoteOfMagic = {
        yield = 3,
        { ids = { 10940 }, amount = 1 },
    }

    -- ShieldOil
    local recipe_ConductiveShieldCoating = {
        yield = 1,
        { ids = { 16204 }, amount = 2 },
        { ids = { 4625 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_MagnificentTrollshine = {
        yield = 1,
        { ids = { 8151 }, amount = 3 },
        { ids = { 8152 }, amount = 3 },
        { ids = { 14344 }, amount = 2 },
        { ids = { 18256 }, amount = 1 },
    }

    ProfessionsHelperData['Forever'].RecipeDB = ProfessionsHelperData['Forever'].RecipeDB or {}
    ProfessionsHelperData['Forever'].RecipeDB['Enchanting'] = {
        -- Campfire
        [279976] = recipe_EnchantedLute,
        [279985] = recipe_ArcaneSalvager,
        [279987] = recipe_ArcaneForge,
        -- WeaponOil
        [20744] = recipe_MinorWizardOil,
        [20746] = recipe_LesserWizardOil,
        [20750] = recipe_WizardOil,
        [20749] = recipe_BrilliantWizardOil,
        [20745] = recipe_MinorManaOil,
        [20747] = recipe_LesserManaOil,
        [20748] = recipe_BrilliantManaOil,
        [211848] = recipe_BlackfathomManaOil,
        -- Sigil
        [217308] = recipe_EnchantedSigilInnovation,
        [228978] = recipe_EnchantedSigilFlowingWaters,
        -- Craftingmaterial
        [12655] = recipe_EnchantedThoriumBar,
        [12810] = recipe_EnchantedLeather,
        [247786] = recipe_MoteOfMagic,
        -- ShieldOil
        [228980] = recipe_ConductiveShieldCoating,
        [232611] = recipe_MagnificentTrollshine,
    }
end
    -- ========================================
    -- Tailoring
    -- ========================================
do
    -- Bolt
    local recipe_BoltOfLinenCloth = {
        yield = 2,
        { ids = { 2589 }, amount = 1 },
    }

    local recipe_BoltOfWoolenCloth = {
        yield = 3,
        { ids = { 2592 }, amount = 1 },
    }

    local recipe_BoltOfSilkCloth = {
        yield = 4,
        { ids = { 4306 }, amount = 1 },
    }

    local recipe_BoltOfMageweave = {
        yield = 5,
        { ids = { 4338 }, amount = 1 },
    }

    local recipe_BoltOfRunecloth = {
        yield = 5,
        { ids = { 14047 }, amount = 1 },
    }

    local recipe_BoltOfQirajiSilk = {
        yield = 5,
        { ids = { 234008 }, amount = 1 },
    }

    -- Cloth
    local recipe_Mooncloth = {
        yield = 2,
        { ids = { 14256 }, amount = 2 },
    }

    -- Campfire
    local recipe_FactionBannerAllianceTier1 = {
        yield = 1,
        { ids = { 2996 }, amount = 1 },
        { ids = { 2320 }, amount = 1 },
    }

    local recipe_FactionBannerHordeTier1 = {
        yield = 1,
        { ids = { 2996 }, amount = 1 },
        { ids = { 2320 }, amount = 1 },
    }

    local recipe_SpinningWheelTier2 = {
        yield = 1,
        { ids = { 4470 }, amount = 2 },
        { ids = { 4305 }, amount = 5 },
        { ids = { 2321 }, amount = 3 },
    }

    local recipe_LoomTier4 = {
        yield = 1,
        { ids = { 273131 }, amount = 1 },
        { ids = { 14048 }, amount = 4 },
        { ids = { 4470 }, amount = 4 },
    }

-- Segment 3: Recipe Callings
ProfessionsHelperData['Forever'].RecipeDB['Tailoring'] = {
    -- Bolt
    [2996] = recipe_BoltOfLinenCloth,
    [2997] = recipe_BoltOfWoolenCloth,
    [4305] = recipe_BoltOfSilkCloth,
    [4339] = recipe_BoltOfMageweave,
    [14048] = recipe_BoltOfRunecloth,
    [22279] = recipe_BoltOfQirajiSilk,

    -- Cloth
    [14342] = recipe_Mooncloth,

    -- Campfire
    [279973] = recipe_FactionBannerAllianceTier1,
    [279972] = recipe_FactionBannerHordeTier1,
    [279943] = recipe_SpinningWheelTier2,
    [279959] = recipe_LoomTier4,
}
end
    -- ========================================
    -- Blacksmithing
    -- ========================================
do
    -- WeaponStone
    local recipe_RoughSharpeningStone = { yield = 1, { ids = { 2835 }, amount = 1 }, }
    local recipe_RoughWeightstone = { yield = 1, { ids = { 2835 }, amount = 1 }, }
    local recipe_CoarseWeightstone = { yield = 1, { ids = { 2836 }, amount = 1 }, }
    local recipe_CoarseSharpeningStone = { yield = 1, { ids = { 2836 }, amount = 1 }, }
    local recipe_HeavySharpeningStone = { yield = 1, { ids = { 2838 }, amount = 1 }, }
    local recipe_HeavyWeightstone = { yield = 1, { ids = { 2838 }, amount = 1 }, }
    local recipe_SolidSharpeningStone = { yield = 1, { ids = { 7912 }, amount = 1 }, }
    local recipe_SolidWeightstone = { yield = 1, { ids = { 7912 }, amount = 1 }, }
    local recipe_DenseWeightstone = { yield = 1, { ids = { 12365 }, amount = 1 }, }
    local recipe_DenseSharpeningStone = { yield = 1, { ids = { 12365 }, amount = 1 }, }
    local recipe_ElementalSharpeningStone = { yield = 1, { ids = { 7067 }, amount = 2 }, { ids = { 12365 }, amount = 3 }, }
    local recipe_ObsidianGrindingStone = { yield = 1, { ids = { 22202 }, amount = 5 }, }

    -- Campfire
    local recipe_SharpeningWheelTier1 = { yield = 1, { ids = { 2835 }, amount = 1 }, { ids = { 2840 }, amount = 1 }, }
    local recipe_AnvilTier2 = { yield = 1, { ids = { 2841 }, amount = 5 }, { ids = { 3478 }, amount = 2 }, { ids = { 2319 }, amount = 2 }, }
    local recipe_MasterForgeTier3 = { yield = 1, { ids = { 273127 }, amount = 5 }, { ids = { 12359 }, amount = 2 }, { ids = { 8170 }, amount = 2 }, }

    -- Craftingmaterial
    local recipe_CopperRod = { yield = 1, { ids = { 2840 }, amount = 1 }, }
    local recipe_RoughGrindingStone = { yield = 1, { ids = { 2835 }, amount = 2 }, }
    local recipe_SilverRod = { yield = 1, { ids = { 2842 }, amount = 2 }, { ids = { 3470 }, amount = 1 }, }
    local recipe_HeavyGrindingStone = { yield = 1, { ids = { 2838 }, amount = 3 }, }
    local recipe_IronBuckle = { yield = 2, { ids = { 3575 }, amount = 1 }, }
    local recipe_CoarseGrindingStone = { yield = 1, { ids = { 2836 }, amount = 2 }, }
    local recipe_GoldenRod = { yield = 1, { ids = { 3577 }, amount = 2 }, { ids = { 3478 }, amount = 1 }, }
    local recipe_SolidGrindingStone = { yield = 1, { ids = { 7912 }, amount = 4 }, }
    local recipe_InlaidMithrilCylinder = { yield = 1, { ids = { 3860 }, amount = 5 }, { ids = { 3577 }, amount = 1 }, { ids = { 6037 }, amount = 1 }, }
    local recipe_DenseGrindingStone = { yield = 1, { ids = { 12365 }, amount = 4 }, }
    local recipe_ArcaniteRod = { yield = 1, { ids = { 12360 }, amount = 3 }, { ids = { 12644 }, amount = 1 }, }

    -- ShieldSpike
    local recipe_IronShieldSpike = { yield = 1, { ids = { 3575 }, amount = 6 }, { ids = { 3478 }, amount = 4 }, }
    local recipe_MithrilShieldSpike = { yield = 1, { ids = { 3860 }, amount = 4 }, { ids = { 6037 }, amount = 2 }, { ids = { 7966 }, amount = 4 }, }

    -- Keys
    local recipe_SilverSkeletonKey = { yield = 2, { ids = { 2842 }, amount = 1 }, { ids = { 3470 }, amount = 1 }, }
    local recipe_GoldenSkeletonKey = { yield = 2, { ids = { 3577 }, amount = 1 }, { ids = { 3486 }, amount = 1 }, }
    local recipe_ArcaniteSkeletonKey = { yield = 2, { ids = { 12360 }, amount = 1 }, { ids = { 12644 }, amount = 1 }, }
    local recipe_TruesilverSkeletonKey = { yield = 2, { ids = { 6037 }, amount = 1 }, { ids = { 7966 }, amount = 1 }, }

    -- WeaponChain
    local recipe_SteelWeaponChain = { yield = 1, { ids = { 3859 }, amount = 8 }, { ids = { 3486 }, amount = 2 }, { ids = { 4234 }, amount = 4 }, }

    -- BootsSpurs
    local recipe_MithrilSpurs = { yield = 1, { ids = { 3860 }, amount = 4 }, { ids = { 7966 }, amount = 3 }, }

-- Segment 3: Recipe Callings
ProfessionsHelperData['Forever'].RecipeDB['Blacksmithing'] = {
    -- WeaponStone
    [2862] = recipe_RoughSharpeningStone,
    [2863] = recipe_CoarseSharpeningStone,
    [2871] = recipe_HeavySharpeningStone,
    [3239] = recipe_RoughWeightstone,
    [3240] = recipe_CoarseWeightstone,
    [3241] = recipe_HeavyWeightstone,
    [7964] = recipe_SolidSharpeningStone,
    [7965] = recipe_SolidWeightstone,
    [12404] = recipe_DenseSharpeningStone,
    [12643] = recipe_DenseWeightstone,
    [18262] = recipe_ElementalSharpeningStone,
    [22202] = recipe_ObsidianGrindingStone,

    -- Campfire
    [279944] = recipe_SharpeningWheelTier1,
    [279955] = recipe_MasterForgeTier3,
    [279988] = recipe_AnvilTier2,

    -- Craftingmaterial
    [3470] = recipe_RoughGrindingStone,
    [3478] = recipe_CoarseGrindingStone,
    [3486] = recipe_HeavyGrindingStone,
    [6217] = recipe_CopperRod,
    [6338] = recipe_SilverRod,
    [7071] = recipe_IronBuckle,
    [7966] = recipe_SolidGrindingStone,
    [9060] = recipe_InlaidMithrilCylinder,
    [11128] = recipe_GoldenRod,
    [12644] = recipe_DenseGrindingStone,
    [16206] = recipe_ArcaniteRod,

    -- ShieldSpike
    [6042] = recipe_IronShieldSpike,
    [7967] = recipe_MithrilShieldSpike,

    -- Keys
    [15869] = recipe_SilverSkeletonKey,
    [15870] = recipe_GoldenSkeletonKey,
    [15871] = recipe_TruesilverSkeletonKey,
    [15872] = recipe_ArcaniteSkeletonKey,

    -- WeaponChain
    [6041] = recipe_SteelWeaponChain,

    -- BootsSpurs
    [7969] = recipe_MithrilSpurs,
}
end 
    -- ========================================
    -- Leatherworking
    -- ========================================
do

    local recipe_LightLeather = {
        yield = 1,
        { ids = { 2934 }, amount = 3 },
    }

    local recipe_MediumLeather = {
        yield = 1,
        { ids = { 2318 }, amount = 3 },
    }

    local recipe_HeavyLeather = {
        yield = 1,
        { ids = { 2319 }, amount = 3 },
    }

    local recipe_ThickLeather = {
        yield = 1,
        { ids = { 4234 }, amount = 3 },
    }

    local recipe_RuggedLeather = {
        yield = 1,
        { ids = { 4304 }, amount = 3 },
    }

    local recipe_FaintlyGlowingLeather = {
        yield = 1,
        { ids = { 8172 }, amount = 1 },
        { ids = { 213370 }, amount = 5 },
    }

    local recipe_CuredLightHide = {
        yield = 1,
        { ids = { 783 }, amount = 1 },
        { ids = { 4289 }, amount = 1 },
    }

    local recipe_CuredMediumHide = {
        yield = 1,
        { ids = { 4232 }, amount = 1 },
        { ids = { 4289 }, amount = 1 },
    }

    local recipe_CuredHeavyHide = {
        yield = 1,
        { ids = { 4235 }, amount = 1 },
        { ids = { 4289 }, amount = 3 },
    }

    local recipe_CuredThickHide = {
        yield = 1,
        { ids = { 8169 }, amount = 1 },
        { ids = { 8150 }, amount = 1 },
    }

    local recipe_CuredRuggedHide = {
        yield = 3,
        { ids = { 8171 }, amount = 1 },
        { ids = { 15409 }, amount = 1 },
    }

    local recipe_CampTent = {
        yield = 1,
        { ids = { 2318 }, amount = 5 },
    }

    local recipe_TanningRack = {
        yield = 1,
        { ids = { 2319 }, amount = 5 },
        { ids = { 2321 }, amount = 3 },
        { ids = { 4470 }, amount = 2 },
    }

    local recipe_SewingMachine = {
        yield = 1,
        { ids = { 273130 }, amount = 1 },
        { ids = { 8170 }, amount = 5 },
        { ids = { 14341 }, amount = 1 },
    }

    local recipe_LightArmorKit = {
        yield = 2,
        { ids = { 2318 }, amount = 1 },
    }

    local recipe_MediumArmorKit = {
        yield = 2,
        { ids = { 2319 }, amount = 4 },
        { ids = { 2320 }, amount = 1 },
    }

    local recipe_MysticMediumArmorKit = {
        yield = 2,
        { ids = { 2313 }, amount = 1 },
        { ids = { 10940 }, amount = 2 },
        { ids = { 2455 }, amount = 2 },
    }

    local recipe_ForcefulMediumArmorKit = {
        yield = 2,
        { ids = { 2313 }, amount = 1 },
        { ids = { 10940 }, amount = 2 },
        { ids = { 2454 }, amount = 2 },
    }

    local recipe_HeavyArmorKit = {
        yield = 2,
        { ids = { 4234 }, amount = 5 },
        { ids = { 2321 }, amount = 1 },
    }

    local recipe_MysticHeavyArmorKit = {
        yield = 2,
        { ids = { 4265 }, amount = 1 },
        { ids = { 11083 }, amount = 2 },
        { ids = { 3385 }, amount = 2 },
    }

    local recipe_ForcefulHeavyArmorKit = {
        yield = 2,
        { ids = { 4265 }, amount = 1 },
        { ids = { 11083 }, amount = 2 },
        { ids = { 6662 }, amount = 2 },
    }

    local recipe_ThickArmorKit = {
        yield = 2,
        { ids = { 4304 }, amount = 5 },
        { ids = { 4291 }, amount = 1 },
    }

    local recipe_MysticThickArmorKit = {
        yield = 2,
        { ids = { 8173 }, amount = 1 },
        { ids = { 11137 }, amount = 2 },
        { ids = { 3827 }, amount = 2 },
    }

    local recipe_ForcefulThickArmorKit = {
        yield = 2,
        { ids = { 8173 }, amount = 1 },
        { ids = { 11137 }, amount = 2 },
        { ids = { 3391 }, amount = 2 },
    }

    local recipe_RuggedArmorKit = {
        yield = 2,
        { ids = { 8170 }, amount = 5 },

    }

    local recipe_MysticRuggedArmorKit = {
        yield = 2,
        { ids = { 15564 }, amount = 1 },
        { ids = { 11176 }, amount = 2 },
        { ids = { 13444 }, amount = 2 },
        { ids = { 249429 }, amount = 1 },
        { ids = { 248824 }, amount = 1 },
    }

    local recipe_ForcefulRuggedArmorKit = {
        yield = 2,
        { ids = { 15564 }, amount = 1 },
        { ids = { 11176 }, amount = 2 },
        { ids = { 9206 }, amount = 2 },
        { ids = { 249429 }, amount = 1 },
        { ids = { 248824 }, amount = 1 },
    }

    local recipe_WildLeatherArmorKit = {
        yield = 2,
        { ids = { 248825 }, amount = 22 },
        { ids = { 14341 }, amount = 3 },
    }

    local recipe_CoreArmorKit = {
        yield = 2,
        { ids = { 17012 }, amount = 3 },
        { ids = { 14341 }, amount = 2 },
    }

    ProfessionsHelperData['Forever'].RecipeDB = ProfessionsHelperData['Forever'].RecipeDB or {}
    ProfessionsHelperData['Forever'].RecipeDB['Leatherworking'] = {
        [2318] = recipe_LightLeather,
        [2319] = recipe_MediumLeather,
        [4234] = recipe_HeavyLeather,
        [4304] = recipe_ThickLeather,
        [8170] = recipe_RuggedLeather,
        [213369] = recipe_FaintlyGlowingLeather,
        [4231] = recipe_CuredLightHide,
        [4233] = recipe_CuredMediumHide,
        [4236] = recipe_CuredHeavyHide,
        [8172] = recipe_CuredThickHide,
        [15407] = recipe_CuredRuggedHide,
        [279978] = recipe_CampTent,
        [279941] = recipe_TanningRack,
        [279945] = recipe_SewingMachine,
        [2304] = recipe_LightArmorKit,
        [2313] = recipe_MediumArmorKit,
        [252436] = recipe_MysticMediumArmorKit,
        [252437] = recipe_ForcefulMediumArmorKit,
        [4265] = recipe_HeavyArmorKit,
        [252452] = recipe_MysticHeavyArmorKit,
        [252453] = recipe_ForcefulHeavyArmorKit,
        [8173] = recipe_ThickArmorKit,
        [252462] = recipe_MysticThickArmorKit,
        [252463] = recipe_ForcefulThickArmorKit,
        [15564] = recipe_RuggedArmorKit,
        [252487] = recipe_MysticRuggedArmorKit,
        [252488] = recipe_ForcefulRuggedArmorKit,
        [279258] = recipe_WildLeatherArmorKit,
        [18251] = recipe_CoreArmorKit,
    }
end
    -- ========================================
    -- FirstAid
    -- ========================================
do

    local recipe_LinenBandage = {
        yield = 1,
        { ids = { 2589 }, amount = 1 },
    }

    local recipe_HeavyLinenBandage = {
        yield = 1,
        { ids = { 2589 }, amount = 2 },
    }

    local recipe_WoolBandage = {
        yield = 1,
        { ids = { 2592 }, amount = 1 },
    }

    local recipe_HeavyWoolBandage = {
        yield = 1,
        { ids = { 2592 }, amount = 2 },
    }

    local recipe_SilkBandage = {
        yield = 1,
        { ids = { 4306 }, amount = 1 },
    }

    local recipe_HeavySilkBandage = {
        yield = 1,
        { ids = { 4306 }, amount = 2 },
    }

    local recipe_MageWeaveBandage = {
        yield = 1,
        { ids = { 4338 }, amount = 1 },
    }

    local recipe_HeavyMageWeaveBandage = {
        yield = 1,
        { ids = { 4338 }, amount = 2 },
    }

    local recipe_RuneClothBandage = {
        yield = 1,
        { ids = { 14047 }, amount = 1 },
    }

    local recipe_HeavyRuneClothBandage = {
        yield = 1,
        { ids = { 14047 }, amount = 2 },
    }

    local recipe_DenseRuneClothBandage = {
        yield = 1,
        { ids = { 18630 }, amount = 1 },
    }

    local recipe_MinorHealingPotion = {
        yield = 2,
        { ids = { 3371 }, amount = 1 },
        { ids = { 2678 }, amount = 1 },
        { ids = { 2447 }, amount = 1 },
    }

    local recipe_LesserHealingPotion = {
        yield = 2,
        { ids = { 3371 }, amount = 1 },
        { ids = { 2678 }, amount = 2 },
        { ids = { 2450 }, amount = 1 },
    }

    local recipe_HealingPotion = {
        yield = 2,
        { ids = { 3372 }, amount = 1 },
        { ids = { 2692 }, amount = 2 },
        { ids = { 2453 }, amount = 1 },
    }

    local recipe_GreaterHealingPotion = {
        yield = 2,
        { ids = { 3372 }, amount = 1 },
        { ids = { 2692 }, amount = 3 },
        { ids = { 3357 }, amount = 1 },
    }

    local recipe_SuperiorHealingPotion = {
        yield = 2,
        { ids = { 8925 }, amount = 1 },
        { ids = { 3713 }, amount = 1 },
        { ids = { 8838 }, amount = 1 },
    }

    local recipe_MajorHealingPotion = {
        yield = 2,
        { ids = { 8925 }, amount = 1 },
        { ids = { 3713 }, amount = 3 },
        { ids = { 13464 }, amount = 1 },
    }

    local recipe_SimplePoultice = {
        yield = 4,
        { ids = { 3174 }, amount = 1 },
        { ids = { 2678 }, amount = 1 },
        { ids = { 2723 }, amount = 1 },
    }

    local recipe_CleverPoultice = {
        yield = 4,
        { ids = { 1468 }, amount = 1 },
        { ids = { 3713 }, amount = 1 },
        { ids = { 2686 }, amount = 1 },
    }

    local recipe_SuperiorPoultice = {
        yield = 4,
        { ids = { 7070 }, amount = 1 },
        { ids = { 2692 }, amount = 1 },
        { ids = { 2596 }, amount = 1 },
    }

    local recipe_PowerfulPoultice = {
        yield = 4,
        { ids = { 7080 }, amount = 1 },
        { ids = { 2692 }, amount = 1 },
        { ids = { 2594 }, amount = 1 },
    }

    local recipe_WoolenTourniquet = {
        yield = 2,
        { ids = { 2592 }, amount = 2 },
        { ids = { 2321 }, amount = 2 },
    }

    local recipe_LeatherTourniquet = {
        yield = 2,
        { ids = { 4304 }, amount = 2 },
        { ids = { 4291 }, amount = 2 },
    }

    local recipe_SurgicalTourniquet = {
        yield = 2,
        { ids = { 8170 }, amount = 2 },
        { ids = { 14047 }, amount = 2 },
        { ids = { 7343 }, amount = 2 },
    }

    local recipe_AntiVenom = {
        yield = 4,
        { ids = { 1475 }, amount = 1 },
    }

    local recipe_StrongAntiVenom = {
        yield = 4,
        { ids = { 1288 }, amount = 1 },
    }

    local recipe_PotentAntiVenom = {
        yield = 4,
        { ids = { 255645 }, amount = 1 },
    }

    local recipe_PowerfulAntiVenom = {
        yield = 4,
        { ids = { 19441 }, amount = 1 },
    }

    ProfessionsHelperData['Forever'].RecipeDB = ProfessionsHelperData['Forever'].RecipeDB or {}
    ProfessionsHelperData['Forever'].RecipeDB['FirstAid'] = {
        [1251] = recipe_LinenBandage,
        [2581] = recipe_HeavyLinenBandage,
        [3530] = recipe_WoolBandage,
        [3531] = recipe_HeavyWoolBandage,
        [6450] = recipe_SilkBandage,
        [6451] = recipe_HeavySilkBandage,
        [8544] = recipe_MageWeaveBandage,
        [8545] = recipe_HeavyMageWeaveBandage,
        [14529] = recipe_RuneClothBandage,
        [14530] = recipe_HeavyRuneClothBandage,
        [470349] = recipe_DenseRuneClothBandage,
        [118] = recipe_MinorHealingPotion,
        [858] = recipe_LesserHealingPotion,
        [929] = recipe_HealingPotion,
        [1710] = recipe_GreaterHealingPotion,
        [3928] = recipe_SuperiorHealingPotion,
        [13446] = recipe_MajorHealingPotion,
        [255716] = recipe_SimplePoultice,
        [255717] = recipe_CleverPoultice,
        [255718] = recipe_SuperiorPoultice,
        [255719] = recipe_PowerfulPoultice,
        [255720] = recipe_WoolenTourniquet,
        [255721] = recipe_LeatherTourniquet,
        [255722] = recipe_SurgicalTourniquet,
        [6452] = recipe_AntiVenom,
        [6453] = recipe_StrongAntiVenom,
        [255715] = recipe_PotentAntiVenom,
        [19440] = recipe_PowerfulAntiVenom,
    }
end
    -- ========================================
    -- Alchemy
    -- ========================================
do
-- CampfireItems
    local recipe_ManaWell = { yield = 1, { ids = { 3371 }, amount = 1 }, { ids = { 2447 }, amount = 1 }, }
    local recipe_Fermenter = { yield = 1, { ids = { 2452 }, amount = 1 }, { ids = { 3356 }, amount = 1 }, { ids = { 3372 }, amount = 1 }, }

    local recipe_AlchemyLaboratory = {
        yield = 1,
        { ids = { 13463 }, amount = 2 },
        { ids = { 8925 }, amount = 1 },
        { ids = { 273125 }, amount = 1 },
    }
-- Transmutes
    local recipe_GoldBar = {
        yield = 1,
        { ids = { 3575 }, amount = 1 },
    }

    local recipe_TrueSilverBar = {
        yield = 1,
        { ids = { 3860 }, amount = 1 },
    }

    local recipe_ElementalFire = {
        yield = 4,
        { ids = { 7077 }, amount = 1 },
    }

    local recipe_EssenceOfFire = {
        yield = 1,
        { ids = { 7082 }, amount = 1 },
    }

    local recipe_EssenceOfWater_1 = {
        yield = 1,
        { ids = { 12808 }, amount = 1 },
    }

    local recipe_EssenceOfAir = {
        yield = 1,
        { ids = { 7080 }, amount = 1 },
    }

    local recipe_ArcaniteBar = {
        yield = 1,
        { ids = { 12363 }, amount = 1 },
        { ids = { 12359 }, amount = 1 },
    }

    local recipe_EssenceofUndeath = {
        yield = 1,
        { ids = { 7080 }, amount = 1 },
    }

    local recipe_EssenceofLife = {
        yield = 1,
        { ids = { 7076 }, amount = 1 },
    }

    local recipe_LegioniteBar = {
        yield = 1,
        { ids = { 248819 }, amount = 1 },
        { ids = { 251291 }, amount = 1 },
    }

    local recipe_EssenceOfWater_2 = {
        yield = 1,
        { ids = { 7076 }, amount = 1 },
    }

    local recipe_EssenceOfEarth_1 = {
        yield = 1,
        { ids = { 7078 }, amount = 1 },
    }

    local recipe_EssenceOfEarth_2 = {
        yield = 1,
        { ids = { 12803 }, amount = 1 },
    }
-- Dyes
    local recipe_GhostDye = {
        yield = 3,
        { ids = { 8925 }, amount = 1 },
        { ids = { 4342 }, amount = 1 },
        { ids = { 8845 }, amount = 2 },
    }

    local recipe_CeruleanDye = {
        yield = 2,
        { ids = { 3371 }, amount = 1 },
        { ids = { 249399 }, amount = 2 },
    }

    local recipe_MagentaDye = {
        yield = 2,
        { ids = { 3372 }, amount = 1 },
        { ids = { 249424 }, amount = 2 },
    }

    local recipe_ViridianDye = {
        yield = 2,
        { ids = { 8925 }, amount = 1 },
        { ids = { 249274 }, amount = 2 },
    }
-- Oils
    local recipe_BlackmouthOil = {
        yield = 2,
        { ids = { 3371 }, amount = 1 },
        { ids = { 6358 }, amount = 2 },
    }

    local recipe_FireOil = {
        yield = 3,
        { ids = { 3371 }, amount = 1 },
        { ids = { 6359 }, amount = 2 },
    }

    local recipe_GoblinRocketFuel = {
        yield = 3,
        { ids = { 3372 }, amount = 1 },
        { ids = { 9260 }, amount = 1 },
        { ids = { 4625 }, amount = 1 },
    }

    local recipe_StonescaleOil = {
        yield = 3,
        { ids = { 3372 }, amount = 1 },
        { ids = { 13422 }, amount = 1 },
    }

    local recipe_SulfuricAcid = {
        yield = 2,
        { ids = { 3371 }, amount = 1 },
        { ids = { 249391 }, amount = 2 },
    }
-- Potions
    local recipe_MinorManaPotion = {
        yield = 2,
        { ids = { 785 }, amount = 1 },
        { ids = { 2447 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_MinorRejuvenationPotion = {
        yield = 2,
        { ids = { 785 }, amount = 2 },
        { ids = { 2447 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_SwiftnessPotion = {
        yield = 2,
        { ids = { 2452 }, amount = 1 },
        { ids = { 2450 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_MinorMagicResistancePotion = {
        yield = 2,
        { ids = { 785 }, amount = 3 },
        { ids = { 3355 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_LesserManaPotion = {
        yield = 2,
        { ids = { 785 }, amount = 1 },
        { ids = { 3820 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_PotionOfPoisonCleansing = {
        yield = 2,
        { ids = { 1288 }, amount = 1 },
        { ids = { 2453 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_LimitedInvulnerabilityPotion = {
        yield = 2,
        { ids = { 8839 }, amount = 2 },
        { ids = { 8845 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_LesserInvisibilityPotion = {
        yield = 2,
        { ids = { 3818 }, amount = 1 },
        { ids = { 3355 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_ManaPotion = {
        yield = 2,
        { ids = { 3820 }, amount = 1 },
        { ids = { 3356 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_MinorDiscoloredHealingPotion = {
        yield = 2,
        { ids = { 3371 }, amount = 1 },
        { ids = { 2447 }, amount = 1 },
        { ids = { 730 }, amount = 1 },
    }

    local recipe_LesserStoneshieldPotion = {
        yield = 2,
        { ids = { 3858 }, amount = 1 },
        { ids = { 3821 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_RagePotion = {
        yield = 2,
        { ids = { 5635 }, amount = 1 },
        { ids = { 2450 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_GreatRagePotion = {
        yield = 2,
        { ids = { 5637 }, amount = 1 },
        { ids = { 3356 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_FreeActionPotion = {
        Yield = 2,
        { ids = { 6370 }, amount = 2 },
        { ids = { 3820 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_ShadowProtectionPotion = {
        yield = 2,
        { ids = { 3369 }, amount = 1 },
        { ids = { 3356 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_FireProtectionPotion = {
        Yield = 2,
        { ids = { 4402 }, amount = 1 },
        { ids = { 6371 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_FrostProtectionPotion = {
        yield = 2,
        { ids = { 3819 }, amount = 1 },
        { ids = { 3821 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_HolyProtectionPotion = {
        yield = 2,
        { ids = { 2453 }, amount = 1 },
        { ids = { 2452 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_NatureProtectionPotion = {
        yield = 2,
        { ids = { 3357 }, amount = 1 },
        { ids = { 3820 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_GreaterManaPotion = {
        yield = 2,
        { ids = { 3358 }, amount = 1 },
        { ids = { 3821 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_SwimSpeedPotion = {
        yield = 2,
        { ids = { 2452 }, amount = 1 },
        { ids = { 6370 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_RestorativePotion = {
        yield = 2,
        { ids = { 7067 }, amount = 1 },
        { ids = { 3821 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_MagicResistancePotion = {
        yield = 2,
        { ids = { 3358 }, amount = 1 },
        { ids = { 8831 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_WildvinePotion = {
        yield = 2,
        { ids = { 8153 }, amount = 1 },
        { ids = { 8831 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_InvisibilityPotion = {
        yield = 2,
        { ids = { 8845 }, amount = 1 },
        { ids = { 8838 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_PotionOfDemonSlaying = {
        yield = 2,
        { ids = { 8846 }, amount = 1 },
        { ids = { 8845 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_DreamlessSleepPotion = {
        Yield = 2,
        { ids = { 8831 }, amount = 3 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_MightyRagePotion = {
        yield = 2,
        { ids = { 8846 }, amount = 3 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_SuperiorManaPotion = {
        yield = 2,
        { ids = { 8838 }, amount = 2 },
        { ids = { 8839 }, amount = 2 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_MajorManaPotion = {
        yield = 2,
        { ids = { 13463 }, amount = 3 },
        { ids = { 13467 }, amount = 2 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_GreaterStoneshieldPotion = {
        yield = 2,
        { ids = { 13423 }, amount = 3 },
        { ids = { 10620 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_GreaterFrostProtectionPotion = {
        yield = 2,
        { ids = { 7070 }, amount = 1 },
        { ids = { 13463 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_GreaterFireProtectionPotion = {
        yield = 2,
        { ids = { 7068 }, amount = 1 },
        { ids = { 13463 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_GreaterNatureProtectionPotion = {
        yield = 2,
        { ids = { 7067 }, amount = 1 },
        { ids = { 13463 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_GreaterShadowProtectionPotion = {
        yield = 2,
        { ids = { 3824 }, amount = 1 },
        { ids = { 13463 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_GreaterArcaneProtectionPotion = {
        yield = 2,
        { ids = { 11176 }, amount = 1 },
        { ids = { 13463 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_PurificationPotion = {
        yield = 2,
        { ids = { 13467 }, amount = 2 },
        { ids = { 13466 }, amount = 2 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_MajorRejuvenationPotion = {
        yield = 2,
        { ids = { 10286 }, amount = 1 },
        { ids = { 13464 }, amount = 4 },
        { ids = { 13463 }, amount = 4 },
        { ids = { 18256 }, amount = 1 },
    }

    local recipe_GreaterDreamlessSleepPotion = {
        yield = 2,
        { ids = { 13463 }, amount = 2 },
        { ids = { 13464 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_LivingActionPotion = {
        yield = 2,
        { ids = { 13467 }, amount = 2 },
        { ids = { 13465 }, amount = 2 },
        { ids = { 10286 }, amount = 2 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_MajorDiscoloredHealingPotion = {
        yield = 2,
        { ids = { 8925 }, amount = 1 },
        { ids = { 13466 }, amount = 1 },
        { ids = { 730 }, amount = 1 },
    }

    local recipe_LesserDiscoloredHealingPotion = {
        yield = 2,
        { ids = { 3371 }, amount = 1 },
        { ids = { 2450 }, amount = 1 },
        { ids = { 730 }, amount = 1 },
    }

    local recipe_DiscoloredHealingPotion = {
        Yield = 2,
        { ids = { 3372 }, amount = 1 },
        { ids = { 2453 }, amount = 1 },
        { ids = { 730 }, amount = 1 },
    }

    local recipe_GreaterDiscoloredHealingPotion = {
        yield = 2,
        { ids = { 3372 }, amount = 1 },
        { ids = { 3356 }, amount = 1 },
        { ids = { 730 }, amount = 1 },
    }

    local recipe_SuperiorDiscoloredHealingPotion = {
        yield = 2,
        { ids = { 8925 }, amount = 1 },
        { ids = { 8838 }, amount = 1 },
        { ids = { 730 }, amount = 1 },
    }

    local recipe_PotionOfPredatorySenses = {
        yield = 2,
        { ids = { 3818 }, amount = 2 },
        { ids = { 3821 }, amount = 2 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_MinorSpellblastingPotion = {
        yield = 2,
        { ids = { 765 }, amount = 1 },
        { ids = { 2447 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_LesserSpellblastingPotion = {
        yield = 2,
        { ids = { 785 }, amount = 1 },
        { ids = { 765 }, amount = 2 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_SpellblastingPotion = {
        yield = 2,
        { ids = { 3355 }, amount = 1 },
        { ids = { 3369 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_GreaterSpellblastingPotion = {
        yield = 2,
        { ids = { 3356 }, amount = 2 },
        { ids = { 3818 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_SuperiorSpellblastingPotion = {
        yield = 2,
        { ids = { 3819 }, amount = 2 },
        { ids = { 3358 }, amount = 2 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_MajorSpellblastingPotion = {
        yield = 2,
        { ids = { 13463 }, amount = 2 },
        { ids = { 13465 }, amount = 1 },
        { ids = { 18256 }, amount = 1 },
    }

    local recipe_MinorFrenzyPotion = {
        yield = 2,
        { ids = { 2449 }, amount = 1 },
        { ids = { 765 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_LesserFrenzyPotion = {
        yield = 2,
        { ids = { 2450 }, amount = 1 },
        { ids = { 2449 }, amount = 2 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_FrenzyPotion = {
        yield = 2,
        { ids = { 3818 }, amount = 2 },
        { ids = { 2450 }, amount = 2 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_GreaterFrenzyPotion = {
        yield = 2,
        { ids = { 4625 }, amount = 3 },
        { ids = { 3818 }, amount = 2 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_SuperiorFrenzyPotion = {
        yield = 2,
        { ids = { 8839 }, amount = 3 },
        { ids = { 4625 }, amount = 2 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_MajorFrenzyPotion = {
        yield = 2,
        { ids = { 13466 }, amount = 3 },
        { ids = { 8839 }, amount = 2 },
        { ids = { 18256 }, amount = 1 },
    }

    local recipe_MinorMendersPotion = {
        yield = 2,
        { ids = { 785 }, amount = 2 },
        { ids = { 2453 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_LesserMendersPotion = {
        yield = 2,
        { ids = { 3356 }, amount = 2 },
        { ids = { 3357 }, amount = 2 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_MendersPotion = {
        yield = 2,
        { ids = { 3819 }, amount = 2 },
        { ids = { 4625 }, amount = 2 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_GreaterMendersPotion = {
        yield = 2,
        { ids = { 8836 }, amount = 2 },
        { ids = { 8831 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_SuperiorMendersPotion = {
        yield = 2,
        { ids = { 8838 }, amount = 2 },
        { ids = { 8836 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_MajorMendersPotion = {
        yield = 2,
        { ids = { 13463 }, amount = 3 },
        { ids = { 8838 }, amount = 1 },
        { ids = { 18256 }, amount = 1 },
    }

    local recipe_PotionOfVenomousBlood = {
        yield = 2,
        { ids = { 8846 }, amount = 3 },
        { ids = { 13466 }, amount = 2 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_CausticSmogPotion = {
        Yield = 2,
        { ids = { 8845 }, amount = 2 },
        { ids = { 3369 }, amount = 2 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_DragonfirePotion = {
        Yield = 2,
        { ids = { 13465 }, amount = 2 },
        { ids = { 4625 }, amount = 2 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_PotionOfElementalPurging = {
        yield = 2,
        { ids = { 4625 }, amount = 2 },
        { ids = { 3819 }, amount = 2 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_PotionOfBeastSlaying = {
        yield = 2,
        { ids = { 8846 }, amount = 2 },
        { ids = { 13466 }, amount = 2 },
        { ids = { 18256 }, amount = 1 },
    }
-- Elixirs
        local recipe_ElixirOfMinorStrength = {
        yield = 2,
        { ids = { 2449 }, amount = 1 },
        { ids = { 765 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_ElixirOfMinorAgility = {
        yield = 2,
        { ids = { 2452 }, amount = 1 },
        { ids = { 765 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_ElixirOfMinorFortitude = {
        yield = 2,
        { ids = { 2449 }, amount = 2 },
        { ids = { 2447 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_MinorTrollsBloodElixir = {
        yield = 2,
        { ids = { 2447 }, amount = 1 },
        { ids = { 2449 }, amount = 2 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_ElixirOfWisdom = {
        yield = 2,
        { ids = { 785 }, amount = 1 },
        { ids = { 2450 }, amount = 2 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_LesserTrollsBloodElixir = {
        yield = 2,
        { ids = { 2453 }, amount = 2 },
        { ids = { 2450 }, amount = 2 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_ElixirOfLesserDefense = {
        yield = 2,
        { ids = { 3355 }, amount = 1 },
        { ids = { 3820 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_ElixirOfLesserAgility = {
        yield = 2,
        { ids = { 3355 }, amount = 1 },
        { ids = { 2452 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_ElixirOfOgreStrength = {
        yield = 2,
        { ids = { 2449 }, amount = 1 },
        { ids = { 3356 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_ElixirOfLesserFortitude = {
        yield = 2,
        { ids = { 3355 }, amount = 1 },
        { ids = { 3821 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_TrollsBloodElixir = {
        yield = 2,
        { ids = { 3357 }, amount = 1 },
        { ids = { 2453 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_ElixirOfMinorDefense = {
        yield = 2,
        { ids = { 765 }, amount = 1 },
        { ids = { 2447 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_ElixirOfFirePower = {
        yield = 2,
        { ids = { 6371 }, amount = 2 },
        { ids = { 3356 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_ElixirOfGiantGrowth = {
        yield = 2,
        { ids = { 6522 }, amount = 1 },
        { ids = { 2449 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_ElixirOfAgility = {
        yield = 2,
        { ids = { 3820 }, amount = 1 },
        { ids = { 3821 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_ElixirOfDefense = {
        yield = 2,
        { ids = { 3355 }, amount = 1 },
        { ids = { 3821 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_ArcaneElixir = {
        yield = 2,
        { ids = { 8839 }, amount = 1 },
        { ids = { 3821 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfGreaterIntellect = {
        yield = 2,
        { ids = { 8839 }, amount = 1 },
        { ids = { 3358 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfGreaterAgility = {
        yield = 2,
        { ids = { 8838 }, amount = 1 },
        { ids = { 3821 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfGreaterStrength = {
        yield = 2,
        { ids = { 8838 }, amount = 1 },
        { ids = { 8846 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfShadowPower = {
        yield = 2,
        { ids = { 8845 }, amount = 3 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfGreaterDefense = {
        yield = 2,
        { ids = { 13423 }, amount = 2 },
        { ids = { 8838 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfTheSages = {
        yield = 2,
        { ids = { 13463 }, amount = 1 },
        { ids = { 13466 }, amount = 2 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfTheMongoose = {
        yield = 2,
        { ids = { 13465 }, amount = 2 },
        { ids = { 13466 }, amount = 2 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfBruteForce = {
        yield = 2,
        { ids = { 8846 }, amount = 2 },
        { ids = { 13466 }, amount = 2 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_GreaterArcaneElixir = {
        yield = 2,
        { ids = { 13463 }, amount = 3 },
        { ids = { 13465 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfFrostPower = {
        yield = 2,
        { ids = { 3819 }, amount = 2 },
        { ids = { 3358 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_MajorTrollsBloodElixir = {
        yield = 2,
        { ids = { 8846 }, amount = 1 },
        { ids = { 13466 }, amount = 2 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_MagebloodElixir = {
        yield = 2,
        { ids = { 13463 }, amount = 1 },
        { ids = { 13466 }, amount = 2 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfHolyPower = {
        yield = 2,
        { ids = { 6371 }, amount = 3 },
        { ids = { 4625 }, amount = 3 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfCoalescedRegret = {
        yield = 2,
        { ids = { 3820 }, amount = 5 },
        { ids = { 3372 }, amount = 1 },
        { ids = { 3369 }, amount = 5 },
        { ids = { 11083 }, amount = 1 },
    }

    local recipe_LesserArcaneElixir_217398 = {
        yield = 2,
        { ids = { 3356 }, amount = 1 },
        { ids = { 3821 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfTheHoneyBadger = {
        yield = 2,
        { ids = { 13465 }, amount = 2 },
        { ids = { 234012 }, amount = 2 },
        { ids = { 234011 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfTheMageLord = {
        yield = 2,
        { ids = { 13466 }, amount = 2 },
        { ids = { 234012 }, amount = 2 },
        { ids = { 234011 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfTheIronside = {
        yield = 2,
        { ids = { 13467 }, amount = 2 },
        { ids = { 234012 }, amount = 2 },
        { ids = { 234011 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfAlacrity = {
        yield = 2,
        { ids = { 13463 }, amount = 2 },
        { ids = { 234012 }, amount = 2 },
        { ids = { 234011 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_MinorArcaneElixir = {
        yield = 2,
        { ids = { 2447 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_ElixirOfMinorForce = {
        yield = 2,
        { ids = { 765 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_ElixirOfCunning = {
        yield = 2,
        { ids = { 13463 }, amount = 3 },
        { ids = { 8846 }, amount = 2 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfThePhalanx = {
        yield = 2,
        { ids = { 13464 }, amount = 2 },
        { ids = { 8838 }, amount = 4 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_MinorClericsElixir = {
        yield = 2,
        { ids = { 785 }, amount = 2 },
        { ids = { 2453 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_LesserClericsElixir = {
        yield = 2,
        { ids = { 3356 }, amount = 2 },
        { ids = { 3357 }, amount = 2 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_ClericsElixir = {
        yield = 2,
        { ids = { 3819 }, amount = 2 },
        { ids = { 4625 }, amount = 2 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_GreaterClericsElixir = {
        yield = 2,
        { ids = { 8836 }, amount = 3 },
        { ids = { 8831 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfFortitude = {
        yield = 2,
        { ids = { 3821 }, amount = 4 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_ElixirOfGreaterFortitude = {
        yield = 2,
        { ids = { 8838 }, amount = 4 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfWickedRegeneration = {
        yield = 2,
        { ids = { 13464 }, amount = 3 },
        { ids = { 13463 }, amount = 2 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfTheOwl = {
        yield = 2,
        { ids = { 13463 }, amount = 4 },
        { ids = { 13465 }, amount = 2 },
        { ids = { 18256 }, amount = 1 },
    }

    local recipe_ElixirOfSages = {
        yield = 2,
        { ids = { 13463 }, amount = 4 },
        { ids = { 13464 }, amount = 2 },
        { ids = { 18256 }, amount = 1 },
    }

    local recipe_MinorMagebloodElixir = {
        yield = 2,
        { ids = { 785 }, amount = 2 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_LesserMagebloodElixir = {
        yield = 2,
        { ids = { 3356 }, amount = 3 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_GreaterMagebloodElixir = {
        yield = 2,
        { ids = { 8839 }, amount = 3 },
        { ids = { 8836 }, amount = 2 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_LesserArcaneElixir_250342 = {
        yield = 2,
        { ids = { 3356 }, amount = 4 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_ElixirOfNaturePower = {
        yield = 2,
        { ids = { 13464 }, amount = 4 },
        { ids = { 8838 }, amount = 2 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfMinorSpirit = {
        yield = 2,
        { ids = { 2449 }, amount = 2 },
        { ids = { 2447 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_ElixirOfLesserSpirit = {
        yield = 2,
        { ids = { 3355 }, amount = 2 },
        { ids = { 785 }, amount = 1 },
        { ids = { 3371 }, amount = 1 },
    }

    local recipe_ElixirOfSpirit = {
        yield = 2,
        { ids = { 3358 }, amount = 3 },
        { ids = { 3356 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_ElixirOfGreaterSpirit = {
        yield = 2,
        { ids = { 8836 }, amount = 3 },
        { ids = { 8831 }, amount = 2 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfTheWhale = {
        yield = 2,
        { ids = { 13463 }, amount = 3 },
        { ids = { 8846 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfStrength = {
        yield = 2,
        { ids = { 3355 }, amount = 3 },
        { ids = { 3821 }, amount = 1 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_ElixirOfFerocity = {
        yield = 2,
        { ids = { 8846 }, amount = 3 },
        { ids = { 8845 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfTheGrizzly = {
        yield = 2,
        { ids = { 8846 }, amount = 3 },
        { ids = { 8839 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_ElixirOfLesserIntellect = {
        yield = 2,
        { ids = { 3356 }, amount = 3 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_ElixirOfIntellect = {
        yield = 2,
        { ids = { 3358 }, amount = 3 },
        { ids = { 3372 }, amount = 1 },
    }
--Flasks
        local recipe_FlaskOfPetrification = {
        yield = 2,
        { ids = { 13423 }, amount = 30 },
        { ids = { 13465 }, amount = 10 },
        { ids = { 13468 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_FlaskOfTheTitans = {
        yield = 2,
        { ids = { 8846 }, amount = 30 },
        { ids = { 13423 }, amount = 10 },
        { ids = { 13468 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_FlaskOfDistilledWisdom = {
        yield = 2,
        { ids = { 13463 }, amount = 30 },
        { ids = { 13467 }, amount = 10 },
        { ids = { 13468 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_FlaskOfSupremePower = {
        yield = 2,
        { ids = { 13463 }, amount = 30 },
        { ids = { 13465 }, amount = 10 },
        { ids = { 13468 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_FlaskOfChromaticResistance = {
        yield = 2,
        { ids = { 13467 }, amount = 30 },
        { ids = { 13465 }, amount = 10 },
        { ids = { 13468 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_FlaskOfEverlastingNightmares = {
        yield = 2,
        { ids = { 221021 }, amount = 10 },
        { ids = { 220688 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_FlaskOfRestlessDreams = {
        yield = 2,
        { ids = { 221021 }, amount = 10 },
        { ids = { 220688 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_FlaskOfMadness = {
        yield = 2,
        { ids = { 16203 }, amount = 1 },
        { ids = { 234010 }, amount = 1 },
        { ids = { 13513 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_FlaskOfAncientKnowledge = {
        yield = 2,
        { ids = { 16203 }, amount = 1 },
        { ids = { 234011 }, amount = 1 },
        { ids = { 13512 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_FlaskOfTheOldGods = {
        yield = 2,
        { ids = { 16203 }, amount = 1 },
        { ids = { 234006 }, amount = 1 },
        { ids = { 13510 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_FlaskOfUnyieldingSorrow = {
        yield = 2,
        { ids = { 16203 }, amount = 1 },
        { ids = { 234012 }, amount = 1 },
        { ids = { 13511 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    local recipe_FlaskOfNaturalAccuracy = {
        yield = 2,
        { ids = { 248822 }, amount = 1 },
        { ids = { 248821 }, amount = 12 },
        { ids = { 13464 }, amount = 9 },
        { ids = { 18256 }, amount = 1 },
    }

    local recipe_FlaskOfNaturalAggression = {
        yield = 2,
        { ids = { 248822 }, amount = 1 },
        { ids = { 248821 }, amount = 18 },
        { ids = { 13465 }, amount = 6 },
        { ids = { 18256 }, amount = 1 },
    }

    local recipe_FlaskOfNaturalPrecision = {
        yield = 2,
        { ids = { 248822 }, amount = 1 },
        { ids = { 248823 }, amount = 12 },
        { ids = { 13463 }, amount = 9 },
        { ids = { 18256 }, amount = 1 },
    }

    local recipe_FlaskOfNaturalSwiftness = {
        yield = 2,
        { ids = { 248822 }, amount = 1 },
        { ids = { 248823 }, amount = 18 },
        { ids = { 13467 }, amount = 6 },
        { ids = { 18256 }, amount = 1 },
    }
-- WeaponOils
        local recipe_ShadowOil = {
        Yield = 3,
        { ids = { 3818 }, amount = 4 },
        { ids = { 3369 }, amount = 4 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_FrostOil = {
        Yield = 3,
        { ids = { 3358 }, amount = 4 },
        { ids = { 3819 }, amount = 2 },
        { ids = { 3372 }, amount = 1 },
    }

    local recipe_OilOfImmolation = {
        Yield = 2,
        { ids = { 4625 }, amount = 1 },
        { ids = { 3821 }, amount = 1 },
        { ids = { 8925 }, amount = 1 },
    }

    ProfessionsHelperData['Forever'].RecipeDB = ProfessionsHelperData['Forever'].RecipeDB or {}
    ProfessionsHelperData['Forever'].RecipeDB['Alchemy'] = {
        [279956] = recipe_ManaWell,
        [279970] = recipe_Fermenter,
        [279990] = recipe_AlchemyLaboratory,
        [3577] = recipe_GoldBar,
        [6037] = recipe_TrueSilverBar,
        [7068] = recipe_ElementalFire,
        [7076] = { recipe_EssenceOfEarth_1, recipe_EssenceOfEarth_2 },
        [7078] = recipe_EssenceOfFire,
        [7080] = { recipe_EssenceOfWater_1, recipe_EssenceOfWater_2 },
        [7082] = recipe_EssenceOfAir,
        [12360] = recipe_ArcaniteBar,
        [12803] = recipe_EssenceofLife,
        [12808] = recipe_EssenceofUndeath,
        [251290] = recipe_LegioniteBar,
        [9210] = recipe_GhostDye,
        [249409] = recipe_CeruleanDye,
        [249430] = recipe_MagentaDye,
        [249431] = recipe_ViridianDye,
        [6370] = recipe_BlackmouthOil,
        [6371] = recipe_FireOil,
        [9061] = recipe_GoblinRocketFuel,
        [13423] = recipe_StonescaleOil,
        [249410] = recipe_SulfuricAcid,
        [2455] = recipe_MinorManaPotion,
        [2456] = recipe_MinorRejuvenationPotion,
        [2459] = recipe_SwiftnessPotion,
        [3384] = recipe_MinorMagicResistancePotion,
        [3385] = recipe_LesserManaPotion,
        [3386] = recipe_PotionOfPoisonCleansing,
        [3387] = recipe_LimitedInvulnerabilityPotion,
        [3823] = recipe_LesserInvisibilityPotion,
        [3827] = recipe_ManaPotion,
        [4596] = recipe_MinorDiscoloredHealingPotion,
        [4623] = recipe_LesserStoneshieldPotion,
        [5631] = recipe_RagePotion,
        [5633] = recipe_GreatRagePotion,
        [5634] = recipe_FreeActionPotion,
        [6048] = recipe_ShadowProtectionPotion,
        [6049] = recipe_FireProtectionPotion,
        [6050] = recipe_FrostProtectionPotion,
        [6051] = recipe_HolyProtectionPotion,
        [6052] = recipe_NatureProtectionPotion,
        [6149] = recipe_GreaterManaPotion,
        [6372] = recipe_SwimSpeedPotion,
        [9030] = recipe_RestorativePotion,
        [9036] = recipe_MagicResistancePotion,
        [9144] = recipe_WildvinePotion,
        [9172] = recipe_InvisibilityPotion,
        [9224] = recipe_PotionOfDemonSlaying,
        [12190] = recipe_DreamlessSleepPotion,
        [13442] = recipe_MightyRagePotion,
        [13443] = recipe_SuperiorManaPotion,
        [13444] = recipe_MajorManaPotion,
        [13455] = recipe_GreaterStoneshieldPotion,
        [13456] = recipe_GreaterFrostProtectionPotion,
        [13457] = recipe_GreaterFireProtectionPotion,
        [13458] = recipe_GreaterNatureProtectionPotion,
        [13459] = recipe_GreaterShadowProtectionPotion,
        [13461] = recipe_GreaterArcaneProtectionPotion,
        [13462] = recipe_PurificationPotion,
        [18253] = recipe_MajorRejuvenationPotion,
        [20002] = recipe_GreaterDreamlessSleepPotion,
        [20008] = recipe_LivingActionPotion,
        [241650] = recipe_MajorDiscoloredHealingPotion,
        [247239] = recipe_LesserDiscoloredHealingPotion,
        [247240] = recipe_DiscoloredHealingPotion,
        [247241] = recipe_GreaterDiscoloredHealingPotion,
        [247242] = recipe_SuperiorDiscoloredHealingPotion,
        [250327] = recipe_PotionOfPredatorySenses,
        [250932] = recipe_MinorSpellblastingPotion,
        [250933] = recipe_LesserSpellblastingPotion,
        [250934] = recipe_SpellblastingPotion,
        [250935] = recipe_GreaterSpellblastingPotion,
        [250936] = recipe_SuperiorSpellblastingPotion,
        [250937] = recipe_MajorSpellblastingPotion,
        [250938] = recipe_MinorFrenzyPotion,
        [250939] = recipe_LesserFrenzyPotion,
        [250940] = recipe_FrenzyPotion,
        [250941] = recipe_GreaterFrenzyPotion,
        [250942] = recipe_SuperiorFrenzyPotion,
        [250943] = recipe_MajorFrenzyPotion,
        [250944] = recipe_MinorMendersPotion,
        [250945] = recipe_LesserMendersPotion,
        [250946] = recipe_MendersPotion,
        [250947] = recipe_GreaterMendersPotion,
        [250948] = recipe_SuperiorMendersPotion,
        [250949] = recipe_MajorMendersPotion,
        [250950] = recipe_PotionOfVenomousBlood,
        [250951] = recipe_CausticSmogPotion,
        [250953] = recipe_DragonfirePotion,
        [250954] = recipe_PotionOfElementalPurging,
        [250955] = recipe_PotionOfBeastSlaying,
        [2454] = recipe_ElixirOfMinorStrength,
        [2457] = recipe_ElixirOfMinorAgility,
        [2458] = recipe_ElixirOfMinorFortitude,
        [3382] = recipe_MinorTrollsBloodElixir,
        [3383] = recipe_ElixirOfWisdom,
        [3388] = recipe_LesserTrollsBloodElixir,
        [3389] = recipe_ElixirOfLesserDefense,
        [3390] = recipe_ElixirOfLesserAgility,
        [3391] = recipe_ElixirOfOgreStrength,
        [3825] = recipe_ElixirOfLesserFortitude,
        [3826] = recipe_TrollsBloodElixir,
        [5997] = recipe_ElixirOfMinorDefense,
        [6373] = recipe_ElixirOfFirePower,
        [6662] = recipe_ElixirOfGiantGrowth,
        [8949] = recipe_ElixirOfAgility,
        [8951] = recipe_ElixirOfDefense,
        [9155] = recipe_ArcaneElixir,
        [9179] = recipe_ElixirOfGreaterIntellect,
        [9187] = recipe_ElixirOfGreaterAgility,
        [9206] = recipe_ElixirOfGreaterStrength,
        [9264] = recipe_ElixirOfShadowPower,
        [13445] = recipe_ElixirOfGreaterDefense,
        [13447] = recipe_ElixirOfTheSages,
        [13452] = recipe_ElixirOfTheMongoose,
        [13453] = recipe_ElixirOfBruteForce,
        [13454] = recipe_GreaterArcaneElixir,
        [17708] = recipe_ElixirOfFrostPower,
        [20004] = recipe_MajorTrollsBloodElixir,
        [20007] = recipe_MagebloodElixir,
        [21546] = recipe_ElixirOfHolyPower,
        [210708] = recipe_ElixirOfCoalescedRegret,
        [217398] = recipe_LesserArcaneElixir_217398,
        [233967] = recipe_ElixirOfTheHoneyBadger,
        [233968] = recipe_ElixirOfTheMageLord,
        [233969] = recipe_ElixirOfTheIronside,
        [233977] = recipe_ElixirOfAlacrity,
        [247754] = recipe_MinorArcaneElixir,
        [247755] = recipe_ElixirOfMinorForce,
        [250328] = recipe_ElixirOfCunning,
        [250329] = recipe_ElixirOfThePhalanx,
        [250330] = recipe_MinorClericsElixir,
        [250331] = recipe_LesserClericsElixir,
        [250332] = recipe_ClericsElixir,
        [250333] = recipe_GreaterClericsElixir,
        [250334] = recipe_ElixirOfFortitude,
        [250335] = recipe_ElixirOfGreaterFortitude,
        [250336] = recipe_ElixirOfWickedRegeneration,
        [250337] = recipe_ElixirOfTheOwl,
        [250338] = recipe_ElixirOfSages,
        [250339] = recipe_MinorMagebloodElixir,
        [250340] = recipe_LesserMagebloodElixir,
        [250341] = recipe_GreaterMagebloodElixir,
        [250342] = recipe_LesserArcaneElixir_250342,
        [250343] = recipe_ElixirOfNaturePower,
        [250344] = recipe_ElixirOfMinorSpirit,
        [250345] = recipe_ElixirOfLesserSpirit,
        [250346] = recipe_ElixirOfSpirit,
        [250347] = recipe_ElixirOfGreaterSpirit,
        [250348] = recipe_ElixirOfTheWhale,
        [250349] = recipe_ElixirOfStrength,
        [250350] = recipe_ElixirOfFerocity,
        [250351] = recipe_ElixirOfTheGrizzly,
        [250353] = recipe_ElixirOfLesserIntellect,
        [250354] = recipe_ElixirOfIntellect,
        [13506] = recipe_FlaskOfPetrification,
        [13510] = recipe_FlaskOfTheTitans,
        [13511] = recipe_FlaskOfDistilledWisdom,
        [13512] = recipe_FlaskOfSupremePower,
        [13513] = recipe_FlaskOfChromaticResistance,
        [221024] = recipe_FlaskOfEverlastingNightmares,
        [222952] = recipe_FlaskOfRestlessDreams,
        [233962] = recipe_FlaskOfMadness,
        [233964] = recipe_FlaskOfAncientKnowledge,
        [233965] = recipe_FlaskOfTheOldGods,
        [233966] = recipe_FlaskOfUnyieldingSorrow,
        [274273] = recipe_FlaskOfNaturalAccuracy,
        [274274] = recipe_FlaskOfNaturalAggression,
        [274275] = recipe_FlaskOfNaturalPrecision,
        [274276] = recipe_FlaskOfNaturalSwiftness,
        [3824] = recipe_ShadowOil,
        [3829] = recipe_FrostOil,
        [8956] = recipe_OilOfImmolation,

    }
end
    -- ========================================
    -- Engineering
    -- ========================================
do

    local recipe_RegentBot = {
        yield = 1,
        { ids = { 4361 }, amount = 1 },
        { ids = { 4359 }, amount = 1 },
    }

    local recipe_RepairBot = {
        yield = 1,
        { ids = { 4243 }, amount = 1 },
        { ids = { 4371 }, amount = 1 },
        { ids = { 4375 }, amount = 2 },
    }

    local recipe_AnarchistsWorkbench = {
        yield = 1,
        { ids = { 15994 }, amount = 2 },
        { ids = { 273129 }, amount = 1 },
    }

    local recipe_CraftedLightShot = {
        yield = 200,
        { ids = { 2840 }, amount = 1 },
        { ids = { 4357 }, amount = 1 },
    }

    local recipe_CraftedHeavyShot = {
        yield = 200,
        { ids = { 2840 }, amount = 1 },
        { ids = { 4364 }, amount = 1 },
    }

    local recipe_CraftedSolidShot = {
        yield = 200,
        { ids = { 2841 }, amount = 1 },
        { ids = { 4377 }, amount = 1 },
    }

    local recipe_HIImpactMithrilSlugs = {
        yield = 200,
        { ids = { 10505 }, amount = 1 },
        { ids = { 3860 }, amount = 1 },
    }

    local recipe_MithrilGyroShot = {
        yield = 200,
        { ids = { 10505 }, amount = 2 },
        { ids = { 3860 }, amount = 2 },
    }

    local recipe_ThoriumShells = {
        yield = 200,
        { ids = { 15992 }, amount = 1 },
        { ids = { 12359 }, amount = 2 },
    }

    local recipe_SwiftfeatherArrow = {
        yield = 200,
        { ids = { 7069 }, amount = 1 },
        { ids = { 17056 }, amount = 5 },
        { ids = { 251291 }, amount = 8 },
    }

    local recipe_SwiftstrikeShot = {
        yield = 200,
        { ids = { 7067 }, amount = 1 },
        { ids = { 12365 }, amount = 8 },
        { ids = { 251291 }, amount = 8 },
    }

    local recipe_RoughBlastingPowder = {
        yield = 2,
        { ids = { 2835 }, amount = 1 },
    }

    local recipe_CoarseBlastingPowder = {
        yield = 2,
        { ids = { 2836 }, amount = 1 },
    }

    local recipe_HeavyBlastingPowder = {
        yield = 2,
        { ids = { 2838 }, amount = 1 },
    }

    local recipe_SolidBlastingPowder = {
        yield = 2,
        { ids = { 7912 }, amount = 2 },
    }

    local recipe_DenseBlastingPowder = {
        yield = 2,
        { ids = { 12365 }, amount = 2 },
    }

    local recipe_CopperTube = {
        yield = 2,
        { ids = { 2880 }, amount = 1 },
        { ids = { 2840 }, amount = 2 },
    }

    local recipe_BronzeTube = {
        yield = 2,
        { ids = { 2880 }, amount = 1 },
        { ids = { 2841 }, amount = 2 },
    }

    local recipe_BronzeFramework = {
        yield = 2,
        { ids = { 2592 }, amount = 1 },
        { ids = { 2319 }, amount = 1 },
        { ids = { 2841 }, amount = 2 },
    }

    local recipe_MithrilTube = {
        yield = 2,
        { ids = { 3860 }, amount = 3 },
    }

    local recipe_MithrilCasing = {
        yield = 2,
        { ids = { 3860 }, amount = 3 },
    }

    local recipe_ThoriumTube = {
        yield = 2,
        { ids = { 12359 }, amount = 6 },
    }

    local recipe_CopperModulator = {
        yield = 2,
        { ids = { 2589 }, amount = 2 },
        { ids = { 2840 }, amount = 1 },
        { ids = { 4359 }, amount = 2 },
    }

    local recipe_IronStrut = {
        yield = 2,
        { ids = { 3575 }, amount = 2 },
    }

    local recipe_Gyrochronatom = {
        yield = 2,
        { ids = { 10558 }, amount = 1 },
        { ids = { 3575 }, amount = 1 },
    }

    local recipe_SilverContact = {
        yield = 6,
        { ids = { 2842 }, amount = 1 },
    }

    local recipe_GoldPowerCore = {
        yield = 4,
        { ids = { 3577 }, amount = 1 },
    }

    local recipe_UnstableTrigger = {
        yield = 2,
        { ids = { 10505 }, amount = 1 },
        { ids = { 4338 }, amount = 1 },
        { ids = { 3860 }, amount = 1 },
    }

    local recipe_ThoriumWidget = {
        yield = 2,
        { ids = { 14047 }, amount = 1 },
        { ids = { 12359 }, amount = 3 },
    }

    local recipe_TruesilverTransformer = {
        yield = 2,
        { ids = { 7069 }, amount = 1 },
        { ids = { 7067 }, amount = 2 },
        { ids = { 6037 }, amount = 2 },
    }

    ProfessionsHelperData['Forever'].RecipeDB = ProfessionsHelperData['Forever'].RecipeDB or {}
    ProfessionsHelperData['Forever'].RecipeDB['Engineering'] = {
        [279950] = recipe_RegentBot,
        [279949] = recipe_RepairBot,
        [279989] = recipe_AnarchistsWorkbench,
        [8067] = recipe_CraftedLightShot,
        [8068] = recipe_CraftedHeavyShot,
        [8069] = recipe_CraftedSolidShot,
        [10512] = recipe_HIImpactMithrilSlugs,
        [10513] = recipe_MithrilGyroShot,
        [15997] = recipe_ThoriumShells,
        [274387] = recipe_SwiftfeatherArrow,
        [274388] = recipe_SwiftstrikeShot,
        [4357] = recipe_RoughBlastingPowder,
        [4364] = recipe_CoarseBlastingPowder,
        [4377] = recipe_HeavyBlastingPowder,
        [10505] = recipe_SolidBlastingPowder,
        [15992] = recipe_DenseBlastingPowder,
        [4361] = recipe_CopperTube,
        [4371] = recipe_BronzeTube,
        [4382] = recipe_BronzeFramework,
        [10559] = recipe_MithrilTube,
        [10561] = recipe_MithrilCasing,
        [16000] = recipe_ThoriumTube,
        [4363] = recipe_CopperModulator,
        [4387] = recipe_IronStrut,
        [4389] = recipe_Gyrochronatom,
        [4404] = recipe_SilverContact,
        [10558] = recipe_GoldPowerCore,
        [10560] = recipe_UnstableTrigger,
        [15994] = recipe_ThoriumWidget,
        [18631] = recipe_TruesilverTransformer,
    }
end