-- Classic.lua 
-- ProfessionsHelper Item Data

local ADDON_NAME, _ = ...
ProfessionsHelperData = ProfessionsHelperData or {}
ProfessionsHelperData["Classic"] = {
    Config = {
        ParentMapIDs = { 
            -- Kalimdor 14
            [1] = true, -- Durotar
            [7] = true, -- Mulgore
            [10] = true, -- Nördliches Brachland
            [57] = true, -- Teldrassil
            [62] = true, -- Dunkelküste
            [63] = true, -- Eschental
            [64] = true, -- Tausend Nadeln
            [65] = true, -- Steinkrallengebirge
            [66] = true, -- Desolace
            [69] = true, -- Feralas
            [70] = true, -- Düstermarschen
            [71] = true, -- Tanaris
            [76] = true, -- Azshara
            [77] = true, -- Teufelswald
            [78] = true, -- Krater von Un'Goro
            [80] = true, -- Mondlichtung
            [81] = true, -- Silithus
            [83] = true, -- Winterquell
            [199] = true, -- Südliches Brachland
            [249] = true, -- Uldum
            [460] = true, -- Laubschattental
            [461] = true, -- Tal der Prüfungen
            [462] = true, -- Camp Narache
            [463] = true, -- Echoinseln
            [468] = true, -- Am'mental

            -- Eastern Kingdoms 12
            [14] = true, -- Arathihochland
            [15] = true, -- Ödland
            [17] = true, -- Verwüstete Lande
            [18] = true, -- Tirisfal
            [21] = true, -- Silberwald
            [22] = true, -- Westliche Pestländer
            [23] = true, -- Östliche Pestländer
            [25] = true, -- Vorgebirge des Hügellands
            [26] = true, -- Hinterland
            [27] = true, -- Dun Morogh
            [32] = true, -- Sengende Schlucht
            [36] = true, -- Brennende Steppe
            [37] = true, -- Wald von Elwynn
            [42] = true, -- Gebirgspass der Totenwinde
            [47] = true, -- Dämmerwald
            [48] = true, -- Loch Modan
            [49] = true, -- Rotkammgebirge
            [50] = true, -- Nördliches Schlingendorntal
            [51] = true, -- Sümpfe des Elends
            [52] = true, -- Westfall
            [56] = true, -- Sumpfland
            [94] = true, -- Immersangwald
            [95] = true, -- Geisterlande
            [205] = true, -- Schimmernde Weiten
            [210] = true, -- Das Schlingendornkap
            [224] = true, -- Schlingendorntal

        },
        CityMapIDs = { 
            [89] = true, -- Darnassus
            [85] = true, -- Orgrimmar
            [88] = true, -- Thunderbluff
            [90] = true, -- Undercity
            [84] = true, -- Stormwind City
            [87] = true, -- Ironforge
        },
    },
}

-- ========================================
-- Ressources
-- ==========================================
-- Gathered + Vendor (sources = Drop, Vendor, gatheringProf= Mining, Skinning, Herbalism, Fishing, Cooking)

ProfessionsHelperData["Classic"].Herbs = {
	Silberblatt = { IDs = { 765 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Maguskoenigskraut = { IDs = { 785 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Winterbiss = { IDs = { 2044 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Friedensblume = { IDs = { 2447 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Erdwurzel = { IDs = { 2449 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Wilddornrose = { IDs = { 2450 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Flitzdistel = { IDs = { 2452 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Beulengras = { IDs = { 2453 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Wildstahlblume = { IDs = { 3355 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Koenigsblut = { IDs = { 3356 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Lebenswurz = { IDs = { 3357 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Khadgars_Schnurrbart = { IDs = { 3358 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Grabmoos = { IDs = { 3369 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Blassblatt = { IDs = { 3818 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Drachenzahn = { IDs = { 3819 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Wuergetang = { IDs = { 3820 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Golddorn = { IDs = { 3821 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Feuerbluete = { IDs = { 4625 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Wildranke = { IDs = { 8153 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Purpurlotus = { IDs = { 8827 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Lila_Lotus = { IDs = { 8831 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Arthas_Traene = { IDs = { 8836 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Sonnengras = { IDs = { 8838 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Blindkraut = { IDs = { 8839 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Geisterpilz = { IDs = { 8845 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Gromsblut = { IDs = { 8846 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Traumblatt = { IDs = { 13463 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Goldener_Sansam = { IDs = { 13464 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Bergsilbersalbei = { IDs = { 13465 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Trauermoos = { IDs = { 13466 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Eiskappe = { IDs = { 13467 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
	Schwarzer_Lotus = { IDs = { 13468 }, sources = { "Drop" }, gatheringProf = "Herbalism", processingProfs = { "Enchanting", "Tailoring", "Engineering", "Alchemy", "Leatherworking"}, displayCategory = 1 },
}

ProfessionsHelperData["Classic"].Ores = {
	-- Ores
	Kupfererz = { IDs = { 2770 }, color = "#ACFCF8", sources = { "Drop", "Vendor" }, gatheringProf = "Mining", processingProfs = { "Blacksmithing", "Engineering", "Alchemy", "Tailoring", "Leatherworking", "Enchanting" }, displayCategory = 1 },
	Zinnerz = { IDs = { 2771 }, color = "#ACFCF8", sources = { "Drop", "Vendor" }, gatheringProf = "Mining", processingProfs = { "Blacksmithing", "Engineering", "Alchemy", "Tailoring", "Leatherworking", "Enchanting" }, displayCategory = 1 },
	Eisenerz = { IDs = { 2772 }, color = "#ACFCF8", sources = { "Drop", "Vendor" }, gatheringProf = "Mining", processingProfs = { "Blacksmithing", "Engineering", "Alchemy", "Tailoring", "Leatherworking", "Enchanting" }, displayCategory = 1 },
	Silbererz = { IDs = { 2775 }, color = "#ACFCF8", sources = { "Drop", "Vendor" }, gatheringProf = "Mining", processingProfs = { "Blacksmithing", "Engineering", "Alchemy", "Tailoring", "Leatherworking", "Enchanting" }, displayCategory = 1 },
	Golderz = { IDs = { 2776 }, color = "#ACFCF8", sources = { "Drop", "Vendor" }, gatheringProf = "Mining", processingProfs = { "Blacksmithing", "Engineering", "Alchemy", "Tailoring", "Leatherworking", "Enchanting" }, displayCategory = 1 },
	Mithrilerz = { IDs = { 3858 }, color = "#ACFCF8", sources = { "Drop", "Vendor" }, gatheringProf = "Mining", processingProfs = { "Blacksmithing", "Engineering", "Alchemy", "Tailoring", "Leatherworking", "Enchanting" }, displayCategory = 1 },
	Echtsilbererz = { IDs = { 7911 }, color = "#ACFCF8", sources = { "Drop", "Vendor" }, gatheringProf = "Mining", processingProfs = { "Blacksmithing", "Engineering", "Alchemy", "Tailoring", "Leatherworking", "Enchanting" }, displayCategory = 1 },
	Thoriumerz = { IDs = { 10620 }, color = "#ACFCF8", sources = { "Drop", "Vendor" }, gatheringProf = "Mining", processingProfs = { "Blacksmithing", "Engineering", "Alchemy", "Tailoring", "Leatherworking", "Enchanting" }, displayCategory = 1 },
	Dunkeleisenerz = { IDs = { 11370 }, color = "#ACFCF8", sources = { "Drop", "Vendor" }, gatheringProf = "Mining", processingProfs = { "Blacksmithing", "Engineering", "Alchemy", "Tailoring", "Leatherworking", "Enchanting" }, displayCategory = 1 },
	Elementiumblock = { IDs = { 18562 }, color = "#ACFCF8", sources = { "Drop", "Vendor" }, gatheringProf = "Mining", processingProfs = { "Blacksmithing", "Engineering", "Alchemy", "Tailoring", "Leatherworking", "Enchanting" }, displayCategory = 1 },

	-- Stones
	Rauer_Stein = { IDs = { 2835 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Grober_Stein = { IDs = { 2836 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Schwerer_Stein = { IDs = { 2838 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Robuster_Stein = { IDs = { 7912 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Verdichteter_Stein = { IDs = { 12365 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },

	-- Jewels
	Malachit = { IDs = { 774 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Tigerauge = { IDs = { 818 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Moosachat = { IDs = { 1206 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Schattenedelstein = { IDs = { 1210 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Jade = { IDs = { 1529 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Geringer_Mondstein = { IDs = { 1705 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Citrin = { IDs = { 3864 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Blaue_Perle = { IDs = { 4611 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Kleine_irisierende_Perle = { IDs = { 5498 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Schillernde_Perle = { IDs = { 5500 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Aquamarin = { IDs = { 7909 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Sternrubin = { IDs = { 7910 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Schwarze_Perle = { IDs = { 7971 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Schwarzes_Vitriol = { IDs = { 9262 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Schwarzer_Diamant = { IDs = { 11754 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Blauer_Saphir = { IDs = { 12361 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Arkankristall = { IDs = { 12363 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Gewaltiger_Smaragd = { IDs = { 12364 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Grosser_Opal = { IDs = { 12799 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Azerothischer_Diamant = { IDs = { 12800 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Rechtschaffene_Kugel = { IDs = { 12811 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Goldene_Perle = { IDs = { 13926 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
	Makelloser_schwarzer_Diamant = { IDs = { 18335 }, sources = { "Drop", "Reagent" }, gatheringProf = "Mining", displayCategory = 2 },
}

ProfessionsHelperData["Classic"].Leather = {
    Verdorbene_Lederfetzen = { IDs = { 2934 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    Kernleder = { IDs = { 17012 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    Leichter_Balg = { IDs = { 783 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },

    Leichtes_Leder = { IDs = { 2318 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    Mittleres_Leder = { IDs = { 2319 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    Schweres_Leder = { IDs = { 4234 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    Dickes_Leder = { IDs = { 4304 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    Unverwuestliches_Leder = { IDs = { 8170 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },

    Mittlerer_Balg = { IDs = { 4232 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    Schwerer_Balg = { IDs = { 4235 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    Dicker_Balg = { IDs = { 8169 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },
    Unverwuestlicher_Balg = { IDs = { 8171 }, sources = { "Drop", "Crafted" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 1 },

    -- Beast Parts
    Abgenutzte_Drachenschuppe = { IDs = { 8165 }, sources = { "Drop" }, gatheringProf = "Skinning", extraCategories = { "Beast Part" }, processingProfs = { "Leatherworking", "Blacksmithing", "Tailoring" }, displayCategory = 2 },
    Glaenzende_chromatische_Schuppe = { IDs = { 12607 }, sources = { "Drop" }, gatheringProf = "Skinning", extraCategories = { "Beast Part" }, processingProfs = { "Leatherworking", "Blacksmithing", "Tailoring" }, displayCategory = 2 },
    Schuppe_von_Onyxia = { IDs = { 15410 }, sources = { "Drop" }, gatheringProf = "Skinning", extraCategories = { "Beast Part" }, processingProfs = { "Leatherworking", "Blacksmithing", "Tailoring" }, displayCategory = 2 },
    Gruene_Drachenschuppe = { IDs = { 15412 }, sources = { "Drop" }, gatheringProf = "Skinning", extraCategories = { "Beast Part" }, processingProfs = { "Leatherworking", "Blacksmithing", "Tailoring" }, displayCategory = 2 },
    Rote_Drachenschuppe = { IDs = { 15414 }, sources = { "Drop" }, gatheringProf = "Skinning", extraCategories = { "Beast Part" }, processingProfs = { "Leatherworking", "Blacksmithing", "Tailoring" }, displayCategory = 2 },
    Blaue_Drachenschuppe = { IDs = { 15415 }, sources = { "Drop" }, gatheringProf = "Skinning", extraCategories = { "Beast Part" }, processingProfs = { "Leatherworking", "Blacksmithing", "Tailoring" }, displayCategory = 2 },
    Schwarze_Drachenschuppe = { IDs = { 15416 }, sources = { "Drop" }, gatheringProf = "Skinning", extraCategories = { "Beast Part" }, processingProfs = { "Leatherworking", "Blacksmithing", "Tailoring" }, displayCategory = 2 },
    Kriegsbaerenleder = { IDs = { 15419 }, sources = { "Drop" }, gatheringProf = "Skinning", extraCategories = { "Beast Part" }, processingProfs = { "Leatherworking", "Blacksmithing", "Tailoring" }, displayCategory = 2 },
    Urzeitliches_Fledermausleder = { IDs = { 19767 }, sources = { "Drop" }, gatheringProf = "Skinning", extraCategories = { "Beast Part" }, processingProfs = { "Leatherworking", "Blacksmithing", "Tailoring" }, displayCategory = 2 },
    Urzeitliches_Tigerleder = { IDs = { 19768 }, sources = { "Drop" }, gatheringProf = "Skinning", extraCategories = { "Beast Part" }, processingProfs = { "Leatherworking", "Blacksmithing", "Tailoring" }, displayCategory = 2 },
    Traumschuppe = { IDs = { 20381 }, sources = { "Drop" }, gatheringProf = "Skinning", extraCategories = { "Beast Part" }, processingProfs = { "Leatherworking", "Blacksmithing", "Tailoring" }, displayCategory = 2 },

    -- Additional Leather / Scales
    Duennes_Kodoleder = { IDs = { 5082 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 0 },
    Deviatschuppe = { IDs = { 6470 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 0 },
    Perfekte_Deviatschuppe = { IDs = { 6471 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 0 },
    Schwarzwelpenschuppe = { IDs = { 7286 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 0 },
    Skorpidschuppe = { IDs = { 8154 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 0 },
    Schildkroetenschuppe = { IDs = { 8167 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 0 },
    Schwere_Skorpidschuppe = { IDs = { 15408 }, sources = { "Drop" }, gatheringProf = "Skinning", processingProfs = { "Leatherworking" }, displayCategory = 0 },
}

ProfessionsHelperData["Classic"].Cloth = {
    Leinenstoff = { IDs = { 2589 }, color = "#FFD700", sources = { "Drop" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 1 },
    Wollstoff = { IDs = { 2592 }, color = "#FFD700", sources = { "Drop" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 1 },
    Seidenstoff = { IDs = { 4306 }, color = "#FFD700", sources = { "Drop" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 1 },
    Magiestoff = { IDs = { 4338 }, color = "#FFD700", sources = { "Drop" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 1 },
    Runenstoff = { IDs = { 14047 }, color = "#FFD700", sources = { "Drop" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 1 },
    Teufelsstoff = { IDs = { 14256 }, color = "#FFD700", sources = { "Drop" }, gatheringProf = "Tailoring", processingProfs = { "Tailoring" }, displayCategory = 1 },
}

ProfessionsHelperData["Classic"].Fishing = {
    Roher_Tuepfelgelbschwanz = { IDs = { 4603 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Roher_langzahniger_Matschschnapper = { IDs = { 6289 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Roher_glaenzender_Kleinfisch = { IDs = { 6291 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Rohe_Glitschhautmakrele = { IDs = { 6303 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Roher_Stoppelfuehlerwels = { IDs = { 6308 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Roher_Lochfrenzy = { IDs = { 6317 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Oeliges_Schwarzmaul = { IDs = { 6358 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Feuerflossenschnapper = { IDs = { 6359 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Roher_Regenbogenflossenthunfisch = { IDs = { 6361 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Roher_Steinschuppenkabeljau = { IDs = { 6362 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Deviatfisch = { IDs = { 6522 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Rohe_Mithrilkopfforelle = { IDs = { 8365 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Steinschuppelaal = { IDs = { 13422 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Roher_glaenzender_Machtfisch = { IDs = { 13754 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Winterkalmar = { IDs = { 13755 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Roher_Sommerbarsch = { IDs = { 13756 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Roher_Rotkiemen = { IDs = { 13758 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Roher_Nachtflossenschnapper = { IDs = { 13759 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Roher_Sonnenschuppenlachs = { IDs = { 13760 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Dunkelklauenhummer = { IDs = { 13888 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Roher_Weissschuppenlachs = { IDs = { 13889 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Grosser_roher_Machtfisch = { IDs = { 13893 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Roher_Weisenfisch = { IDs = { 21071 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
    Roher_grosser_Weisenfisch = { IDs = { 21153 }, sources = { "Drop" }, gatheringProf = "Fishing", processingProfs = { "Cooking" }, displayCategory = 4 },
}

ProfessionsHelperData["Classic"].Enchanting = {
    Geringe_Magieessenz = { IDs = { 10938 }, color = "#FFD700", sources = { "Drop" }, gatheringProf = "Enchanting", processingProfs = { "Alchemy", "Tailoring", "Enchanting" }, displayCategory = 1 },
    Grosse_Magieessenz = { IDs = { 10939 }, color = "#FFD700", sources = { "Drop" }, gatheringProf = "Enchanting", processingProfs = { "Alchemy", "Tailoring", "Enchanting" }, displayCategory = 1 },
    Seltsamer_Staub = { IDs = { 10940 }, color = "#FFD700", sources = { "Drop" }, gatheringProf = "Enchanting", processingProfs = { "Alchemy", "Tailoring", "Enchanting" }, displayCategory = 1 },
    Kleiner_glaenzender_Splitter = { IDs = { 14343 }, color = "#FFD700", sources = { "Drop" }, gatheringProf = "Enchanting", processingProfs = { "Alchemy", "Tailoring", "Enchanting" }, displayCategory = 1 },
    Grosser_glaenzender_Splitter = { IDs = { 14344 }, color = "#FFD700", sources = { "Drop" }, gatheringProf = "Enchanting", processingProfs = { "Alchemy", "Tailoring", "Enchanting" }, displayCategory = 1 },
    Geringe_ewige_Essenz = { IDs = { 16202 }, color = "#FFD700", sources = { "Drop" }, gatheringProf = "Enchanting", processingProfs = { "Alchemy", "Tailoring", "Enchanting" }, displayCategory = 1 },
    Grosse_ewige_Essenz = { IDs = { 16203 }, color = "#FFD700", sources = { "Drop" }, gatheringProf = "Enchanting", processingProfs = { "Alchemy", "Tailoring", "Enchanting" }, displayCategory = 1 },
    Leichter_Illusionsstaub = { IDs = { 16204 }, color = "#FFD700", sources = { "Drop" }, gatheringProf = "Enchanting", processingProfs = { "Alchemy", "Tailoring", "Enchanting" }, displayCategory = 1 },
    Schwerer_Illusionsstaub = { IDs = { 156930 }, color = "#FFD700", sources = { "Drop" }, gatheringProf = "Enchanting", processingProfs = { "Alchemy", "Tailoring", "Enchanting" }, displayCategory = 1 },
}

ProfessionsHelperData["Classic"].VendorDrop = {
    -- Kreaturenmaterialien
    Grosser_Giftbeutel = { IDs = { 1288 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Kleiner_Giftbeutel = { IDs = { 1475 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Spinnenseide = { IDs = { 3182 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Dicke_Spinnenseide = { IDs = { 4337 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Kleiner_Flammenbeutel = { IDs = { 4402 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Raptorbalg = { IDs = { 4461 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Gluecksbringer = { IDs = { 5373 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Scharfe_Klaue = { IDs = { 5635 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Grosser_Fangzahn = { IDs = { 5637 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Schleimige_Murlocschuppe = { IDs = { 5784 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Dicke_Murlocschuppe = { IDs = { 5785 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Nagaschuppe = { IDs = { 7072 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Schattenseide = { IDs = { 10285 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Daemonische_Rune = { IDs = { 12662 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Maechtiges_Mojo = { IDs = { 12804 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Eisenweberseide = { IDs = { 14227 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Leichte_Feder = { IDs = { 17056 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Ogergerbemittel = { IDs = { 18240 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Riesiger_Giftbeutel = { IDs = { 19441 }, sources = {  "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Gewaltig_viel_Mojo = { IDs = { 19943 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Dunkelrune = { IDs = { 20520 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },

    -- Naturmaterialien
    Elementarerde = { IDs = { 7067 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Elementarfeuer = { IDs = { 7068 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Elementarluft = { IDs = { 7069 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Elementarwasser = { IDs = { 7070 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Erdenkern = { IDs = { 7075 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Herz_des_Feuers = { IDs = { 7077 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Kugel_des_Wassers = { IDs = { 7079 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Odem_des_Windes = { IDs = { 7081 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Sekret_des_Untodes = { IDs = { 7972 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Herz_der_Wildnis = { IDs = { 10286 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },

    Waechterstein = { IDs = { 12809 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Feuerkern = { IDs = { 17010 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Lavakern = { IDs = { 17011 }, sources = { "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },

    -- Essenzen
    Essenz_der_Erde = { IDs = { 7076 }, sources = { "Drop", "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Essenz_des_Feuers = { IDs = { 7078 }, sources = { "Drop", "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Essenz_des_Wassers = { IDs = { 7080 }, sources = { "Drop", "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Essenz_der_Luft = { IDs = { 7082 }, sources = { "Drop", "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Essenz_des_Lebens = { IDs = { 12803 }, sources = { "Drop", "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Essenz_des_Untodes = { IDs = { 12808 }, sources = { "Drop", "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },

    -- Material
    Kristallphiole = { IDs = { 3371 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Kohle = { IDs = { 3857 }, sources =  { "Vendor", "Drop" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Flaeschchen_Oel = { IDs = { 814 }, sources =  { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Ingenieurstinte = { IDs = { 10647 }, sources =  { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Elementarfluxus = { IDs = { 18567 }, sources =  { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Leichtes_Pergament = { IDs = { 39354 }, sources =  { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },

    -- Fäden
    Grober_Faden = { IDs = { 2320 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Feiner_Faden = { IDs = { 2321 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Seidenfaden = { IDs = { 4291 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Schwerer_Seidenfaden = { IDs = { 8343 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Runenfaden = { IDs = { 14341 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },

    -- Salze
    Salz = { IDs = { 4289 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Tiefsteinsalz = { IDs = { 8150 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },

    -- Holzarten
    Einfaches_Holz = { IDs = { 4470 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },
    Sternenholz = { IDs = { 11291 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 2 },

    -- Sonstige Materialien
    Holzgriff = { IDs = { 4399 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Schwerer_Griff = { IDs = { 4400 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Kupferrute = { IDs = { 6217 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },

    -- Farbstoffe
    Bleiche = { IDs = { 2324 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Schwarzer_Farbstoff = { IDs = { 2325 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Roter_Farbstoff = { IDs = { 2604 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Gruener_Farbstoff = { IDs = { 2605 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Grauer_Farbstoff = { IDs = { 4340 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Lila_Farbstoff = { IDs = { 4342 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Blauer_Farbstoff = { IDs = { 6260 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Orangefarbener_Farbstoff = { IDs = { 6261 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Geisterfarbstoff = { IDs = { 9210 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Rosa_Farbstoff = { IDs = { 10290 }, sources = { "Vendor" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },

    -- Kochzutaten
    Erfrischendes_Quellwasser = { IDs = { 159 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Eiskalte_Milch = { IDs = { 1179 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Milde_Gewuerze = { IDs = { 2678 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Runn_Tum_Knolle = { IDs = { 18255 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Herkoemmliches_Mehl = { IDs = { 30817 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },

    -- Getränke
    Flaeschchen_Sturmwinder_Goldtropfen = { IDs = { 2593 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Krug_Zwergenmet = { IDs = { 2594 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Schlauch_mit_zwergischem_Starkbier = { IDs = { 2596 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Fluechtiger_Rum = { IDs = { 9260 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },

    -- Fleisch und andere Kochzutaten
    Geiferzahnleber = { IDs = { 723 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Brocken_Eberfleisch = { IDs = { 769 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Magere_Wolfsflanke = { IDs = { 1015 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Zaehes_Kondorfleisch = { IDs = { 1080 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Murlocflosse = { IDs = { 1468 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Klebriges_Spinnenbein = { IDs = { 2251 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Sehniges_Wolfsfleisch = { IDs = { 2672 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Kojotenfleisch = { IDs = { 2673 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Kriecherfleisch = { IDs = { 2674 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Kriecherklaue = { IDs = { 2675 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Erberrippchen = { IDs = { 2677 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Klippeneberrippchen = { IDs = { 2886 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Krokiliskenfleisch = { IDs = { 2924 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Baerenfleisch = { IDs = { 3173 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Bussardfluegel = { IDs = { 3404 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Zartes_Krokiliskenfleisch = { IDs = { 3667 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Raptorei = { IDs = { 3685 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Schildkroetenfleisch = { IDs = { 3712 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Grossbaerenfleisch = { IDs = { 3730 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Loewenfleisch = { IDs = { 3731 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Riesenmuschelfleisch = { IDs = { 4655 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Grubenratte = { IDs = { 5051 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Kleines_Spinnenbein = { IDs = { 5465 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Skorpidstachel = { IDs = { 5466 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Kodofleisch = { IDs = { 5467 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Weiches_Frenzyfleisch = { IDs = { 5468 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Schreiterfleisch = { IDs = { 5469 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Donnerechsenschwanz = { IDs = { 5470 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Hirschfleisch = { IDs = { 5471 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Muschelfleisch = { IDs = { 5503 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Wuerziges_Muschelfleisch = { IDs = { 5504 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Kleines_Ei = { IDs = { 6889 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Scharfes_Muschelfleisch = { IDs = { 7974 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Eigenartiges_Fleisch = { IDs = { 12037 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Raptorfleisch = { IDs = { 12184 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Tigerfleisch = { IDs = { 12202 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Rotes_Wolfsfleisch = { IDs = { 12203 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Schweres_Kodofleisch = { IDs = { 12204 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Weisses_Spinnenfleisch = { IDs = { 12205 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Zartes_Krebsfleisch = { IDs = { 12206 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Riesenei = { IDs = { 12207 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Zartes_Wolfsfleisch = { IDs = { 12208 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Fleischiger_Fledermausfluegel = { IDs = { 12223 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Sandwurmfleisch = { IDs = { 20424 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Knuspriges_Spinnenbein = { IDs = { 22644 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Mondweidenhirschlenden = { IDs = { 23676 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Luchsfleisch = { IDs = { 27668 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Fledermausfleisch = { IDs = { 27669 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Baerenflanke = { IDs = { 35562 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
    Hirschflanke = { IDs = { 67229 }, sources = { "Vendor", "Drop" }, gatheringProf = { "Skinning", "Herbalism", "Mining" }, processingProfs = { "Enchanting", "Alchemy", "Engineering", "Tailoring", "Leatherworking", "Cooking", "FirstAid", "Blacksmithing" }, displayCategory = 0 },
}



-- ==========================================
-- Materials
-- ==========================================
-- Crafted - Items (sources = Crafted; gatheringProf = <Category> (Herbalism, Skinning, Cooking, Leatherworking, Blacksmithing, Engineering, Enchanting, Inscription, Tailoring, Jewelcrafting))

ProfessionsHelperData["Classic"].Mining = {
    -- Bars
    Kupferbarren = { IDs = { 2840 }, sources = { "Crafted" }, gatheringProf = "Mining", processingProfs = { "Mining", "Engineering", "Blacksmithing", "Enchanting", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Bronzebarren = { IDs = { 2841 }, sources = { "Crafted" }, gatheringProf = "Mining", processingProfs = { "Mining", "Engineering", "Blacksmithing", "Enchanting", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Silberbarren = { IDs = { 2842 }, sources = { "Crafted" }, gatheringProf = "Mining", processingProfs = { "Mining", "Engineering", "Blacksmithing", "Enchanting", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Eisenbarren = { IDs = { 3575 }, sources = { "Crafted" }, gatheringProf = "Mining", processingProfs = { "Mining", "Engineering", "Blacksmithing", "Enchanting", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Zinnbarren = { IDs = { 3576 }, sources = { "Crafted" }, gatheringProf = "Mining", processingProfs = { "Mining", "Engineering", "Blacksmithing", "Enchanting", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Goldbarren = { IDs = { 3577 }, sources = { "Crafted" }, gatheringProf = "Mining", processingProfs = { "Mining", "Engineering", "Blacksmithing", "Enchanting", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Stahlbarren = { IDs = { 3859 }, sources = { "Crafted" }, gatheringProf = "Mining", processingProfs = { "Mining", "Engineering", "Blacksmithing", "Enchanting", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Mithrilbarren = { IDs = { 3860 }, sources = { "Crafted" }, gatheringProf = "Mining", processingProfs = { "Mining", "Engineering", "Blacksmithing", "Enchanting", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Echtsilberbarren = { IDs = { 6037 }, sources = { "Crafted" }, gatheringProf = "Mining", processingProfs = { "Mining", "Engineering", "Blacksmithing", "Enchanting", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Dunkeleisenbarren = { IDs = { 11371 }, sources = { "Crafted" }, gatheringProf = "Mining", processingProfs = { "Mining", "Engineering", "Blacksmithing", "Enchanting", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Thoriumbarren = { IDs = { 12359 }, sources = { "Crafted" }, gatheringProf = "Mining", processingProfs = { "Mining", "Engineering", "Blacksmithing", "Enchanting", "Tailoring", "Leatherworking" }, displayCategory = 3 },
}

ProfessionsHelperData["Classic"].EnchantingCrafted = {
    -- Enchanted Materials
    Verzauberte_Thoriumbarren = { IDs = { 12655 }, sources = { "Crafted" }, gatheringProf = "Enchanting", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Verzaubertes_Leder = { IDs = { 12810 }, sources = { "Crafted" }, gatheringProf = "Enchanting", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
}

ProfessionsHelperData["Classic"].Blacksmithing = {
    -- Material
    Eiserne_Guertelschnalle = { IDs = { 7071 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Veredelter_Mithrilzylinder = { IDs = { 9060 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Verdichteter_Schleifstein = { IDs = { 12644 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Robuster_Schleifstein = { IDs = { 7966 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Schwerer_Schleifstein = { IDs = { 3486 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Grober_Schleifstein = { IDs = { 3478 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Rauer_Schleifstein = { IDs = { 3470 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },

    -- Weaponmods
    Elementarwetstein = { IDs = { 18262 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Stahlwaffenkette = { IDs = { 6041 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Eisengegengewicht = { IDs = { 6043 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Verdichteter_Gewichtstein = { IDs = { 12643 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Verdichteter_Wetzstein = { IDs = { 12404 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Robuster_Gewichtsstein = { IDs = { 7965 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Robuster_Wetzstein = { IDs = { 7964 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Schwerer_Gewichtsstein = { IDs = { 3241 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Schwerer_Wetzstein = { IDs = { 2871 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Grober_Gewichtsstein = { IDs = { 3240 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Grober_Wetzstein = { IDs = { 2863 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Rauer_Gewichtsstein = { IDs = { 3239 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Rauer_Wetzstein = { IDs = { 2862 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },

    -- Lockpiks
    Arkanitdietrich = { IDs = { 15872 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Echtsilberdietrich = { IDs = { 15871 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Golddietrich = { IDs = { 15870 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Silberdietrich = { IDs = { 15869 }, sources = { "Crafted" }, gatheringProf = "Blacksmithing", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
}

ProfessionsHelperData["Classic"].Engineering = {
    -- Parts
    Eine_Handvoll_Kupferbolzen = { IDs = { 4359 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 3 },
    Bronzeroehre = { IDs = { 4371 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 3 },
    Surrendes_bronzenes_Dingsda = { IDs = { 4375 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 3 },
    Eisenstrebe = { IDs = { 4387 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 3 },
    Gyrochronatom = { IDs = { 4389 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 3 },
    Silberkontakt = { IDs = { 4404 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 3 },
    Verschmorte_Verkabelung = { IDs = { 7191 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 3 },
    Goldkraftkern = { IDs = { 10558 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 3 },
    Mithrilroher = { IDs = { 10559 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 3 },
    Instabiler_Ausloeser = { IDs = { 10560 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 3 },
    Thoriumapparat = { IDs = { 15994 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 3 },
    Thoriumroehre = { IDs = { 16000 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 3 },
    Empfindlicher_Arkanitwandler = { IDs = { 16006 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 3 },
    Echtsilberumwandler = { IDs = { 18631 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 3 },

    -- Frames
    Bronzegeruest = { IDs = { 4382 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 3 },
    Mithrilgehaeuse = { IDs = { 10561 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 3 },

    -- Dusts
    Raues_Sprengpulver = { IDs = { 4357 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 3 },
    Grobes_Sprengpulver = { IDs = { 4364 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 3 },
    Schweres_Sprengpulver = { IDs = { 4377 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 3 },
    Robustes_Sprengpulver = { IDs = { 10505 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 3 },
    Dichtes_Sprengpulver = { IDs = { 15992 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 3 },

    -- Gadgets
    Grosse_Eisenbombe = { IDs = { 4394 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 0 },
    Kunstloses_Zielfernrohr = { IDs = { 4405 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 0 },
    Standardzielfernrohr = { IDs = { 4406 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 0 },
    Genaues_Zielfernrohr = { IDs = { 4407 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 0 },
    Robustes_Dynamit = { IDs = { 10507 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 0 },
    Toedliches_Zielfernrohr = { IDs = { 10546 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 0 },
    Dichtes_Dynamit = { IDs = { 18641 }, sources = { "Crafted" }, gatheringProf = "Engineering", processingProfs = { "Engineering", "Blacksmithing" }, displayCategory = 0 },
}

ProfessionsHelperData["Classic"].Tailoring = {
    -- Clothes
    Mondstoff = { IDs = { 14342 }, sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },

    -- Ball of Fabric
    Leinenstoffballen = { IDs = { 2996 }, sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Wollstoffballen = { IDs = { 2997 }, sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Seidenstoffballen = { IDs = { 4305 }, sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Magiestoffballen = { IDs = { 4339 }, sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Runenstoffballen = { IDs = { 14048 }, sources = { "Crafted" }, gatheringProf = "Tailoring", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
}

ProfessionsHelperData["Classic"].Leatherworking = {
    -- Fine Skins
    Geschmeidiger_leichter_Balg = { IDs = { 4231 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Geschmeidiger_mittlerer_Balg = { IDs = { 4233 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Geschmeidiger_schwerer_Balg = { IDs = { 4236 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Geschmeidiger_dicker_Balg = { IDs = { 8172 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Geschmeidiger_unverwuestlicher_Balg = { IDs = { 15407 }, sources = { "Crafted" }, gatheringProf = "Leatherworking", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
}

ProfessionsHelperData["Classic"].Alchemy = {
    -- Potions
    Heiltrank = { IDs = { 118 }, sources = { "Crafted" }, gatheringProf = "Alchemy", displayCategory = 3 },
    Hurtigkeitstrank = { IDs = { 2459 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Manatrank = { IDs = { 3827 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Grosser_Wuttrank = { IDs = { 5633 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Schattenschutztrank = { IDs = { 6048 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Trank_des_traumlosen_Schlafs = { IDs = { 20002 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },

    -- Elixirs
    Elixier_der_schwachen_Beweglichkeit = { IDs = { 2457 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Elixier_der_Weisheit = { IDs = { 3383 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Elixier_der_Verteidigung = { IDs = { 3389 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Elixier_der_geringen_Beweglichkeit = { IDs = { 3390 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Elixier_des_Daemonentoetens = { IDs = { 9224 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Katzenaugenelixier = { IDs = { 10592 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Maechtiges_Trollblutelixier = { IDs = { 20004 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },

    -- Oils
    Schattenoel = { IDs = { 3824 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Frostoel = { IDs = { 3829 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Schwarzmauloel = { IDs = { 6370 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Feueroel = { IDs = { 6371 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Steinschuppenoel = { IDs = { 13423 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },

    -- Bars
    Arkanitbarren = { IDs = { 12360 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },

    -- Mixed
    Goblinraketentreibstoff = { IDs = { 9061 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
    Mojowahnsinn_der_Gurubashi = { IDs = { 19931 }, sources = { "Crafted" }, gatheringProf = "Alchemy", processingProfs = { "Engineering", "Blacksmithing", "Tailoring", "Leatherworking" }, displayCategory = 3 },
}



ProfessionsHelperData["Classic"].AllProf = {}


-- ==========================================
-- Spells of professions
-- ==========================================

ProfessionsHelperData["Classic"].Skills = {
    
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
ProfessionsHelperData["Classic"].RecipeDB = {
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