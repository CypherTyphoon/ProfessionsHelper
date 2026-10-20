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

ProfessionsHelperData["Forever"].Cooking = {

}

ProfessionsHelperData["Forever"].Leatherworking = {
LightLeather = { IDs = { 2318 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Blacksmithing", "Leatherworking", "Engineering", "Skinning", "Tailoring" }, displayCategory = 3 },
CuredLightHide = { IDs = { 4231 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Leatherworking" }, displayCategory = 3 },
MediumLeather = { IDs = { 2319 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Blacksmithing", "Leatherworking", "Engineering", "Skinning", "Tailoring" }, displayCategory = 3 },
CuredMediumHide = { IDs = { 4233 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Leatherworking" }, displayCategory = 3 },
HeavyLeather = { IDs = { 4234 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Leatherworking", "Engineering", "Tailoring", "Blacksmithing", "Skinning" }, displayCategory = 3 },
CuredHeavyHide = { IDs = { 4236 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Leatherworking", "Skinning" }, displayCategory = 3 },
ThickLeather = { IDs = { 4304 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Blacksmithing", "Leatherworking", "Engineering", "Skinning", "Tailoring", "FirstAid" }, displayCategory = 3 },
CuredThickHide = { IDs = { 8172 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Leatherworking", "Skinning" }, displayCategory = 3 },
RuggedLeather = { IDs = { 8170 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Blacksmithing", "Leatherworking", "Engineering", "Skinning", "Tailoring" }, displayCategory = 3 },
CuredRuggedHide = { IDs = { 15407 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Leatherworking", "Enchanting", "Tailoring", "Engineering" }, displayCategory = 3 },



}

ProfessionsHelperData["Forever"].Blacksmithing = {

}

ProfessionsHelperData["Forever"].Engineering = {

}

ProfessionsHelperData["Forever"].Tailoring = {

}

ProfessionsHelperData["Forever"].Alchemy = {

}

ProfessionsHelperData["Forever"].Enchanting = {

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

ProfessionsHelperData["Forever"].AllProf = {}


-- ==========================================
-- Spells of professions
-- ==========================================

ProfessionsHelperData["Forever"].Skills = {
}


-- ==========================================
-- Recipes of professions
-- ==========================================

-- Leatherworking


local recipe_LightLeather = {
    yield = 1,
    { ids = { 2934 }, amount = 3 },
}

local recipe_CuredLightHide = {
    yield = 1,
    { ids = { 783 }, amount = 1 },
    { ids = { 4289 }, amount = 1 },
}

local recipe_CampTent = {
    yield = 1,
    { ids = { 2318 }, amount = 5 },
}

local recipe_LightArmorKit = {
    yield = 1,
    { ids = { 2318 }, amount = 1 },
}

-- First Aid Bandages
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
-- First Aid Potions

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

-- FirstAidOthers
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


ProfessionsHelperData["Forever"].RecipeDB = {
-- Leatherworking
[2318] = recipe_LightLeather,
[4231] = recipe_CuredLightHide,

[279978] = recipe_CampTent,
[2304] = recipe_LightArmorKit,

-- First Aid Bandages
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

-- FirstAid Potions
[118] = recipe_MinorHealingPotion,
[858] = recipe_LesserHealingPotion,
[929] = recipe_HealingPotion,
[1710] = recipe_GreaterHealingPotion,
[3928] = recipe_SuperiorHealingPotion,
[13446] = recipe_MajorHealingPotion,

-- First Aid Others
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