//
//  Reading+Resources.swift
//  Quran
//
//  Created by Mohamed Afifi on 2023-02-19.
//  Copyright © 2023 Quran.com. All rights reserved.
//

import Foundation
import Localization
import QuranGeometry
import QuranKit
import UIKit

extension Reading {
    var title: String {
        switch self {
        case .hafs_1405:
            return l("reading.hafs-1405.title")
        case .hafs_1421:
            return l("reading.hafs-1421.title")
        case .hafs_1440:
            return l("reading.hafs-1440.title")
        case .tajweed:
            return l("reading.tajweed.title")
        }
    }

    var description: String {
        switch self {
        case .hafs_1405:
            return l("reading.hafs-1405.description")
        case .hafs_1421:
            return l("reading.hafs-1421.description")
        case .hafs_1440:
            return l("reading.hafs-1440.description")
        case .tajweed:
            return l("reading.tajweed.description")
        }
    }

    var propertiesDescription: String {
        switch self {
        case .hafs_1405:
            return l("reading.hafs-1405.properties")
        case .hafs_1421:
            return l("reading.hafs-1421.properties")
        case .hafs_1440:
            return l("reading.hafs-1440.properties")
        case .tajweed:
            return l("reading.tajweed.properties")
        }
    }

    var imageName: String {
        switch self {
        case .hafs_1405:
            return "hafs_1405"
        case .hafs_1421:
            return "hafs_1421"
        case .hafs_1440:
            return "hafs_1440"
        case .tajweed:
            return "tajweed"
        }
    }

    var pageMarkers: PageMarkers {
        guard self == .hafs_1421 else {
            return PageMarkers(suraHeaders: [], ayahNumbers: [])
        }

        let suraHeaders = [
            SuraHeaderLocation(sura: Sura(quran: quran, suraNumber: 112)!, x: 14, y: 93, width: 1092, height: 116),
            SuraHeaderLocation(sura: Sura(quran: quran, suraNumber: 113)!, x: 14, y: 557, width: 1092, height: 116),
            SuraHeaderLocation(sura: Sura(quran: quran, suraNumber: 114)!, x: 14, y: 1148, width: 1092, height: 116),
        ]
        let ayahNumbers = [
            AyahNumberLocation(ayah: AyahNumber(quran: quran, sura: 112, ayah: 1)!, x: 747, y: 322),
            AyahNumberLocation(ayah: AyahNumber(quran: quran, sura: 112, ayah: 2)!, x: 425, y: 322),
            AyahNumberLocation(ayah: AyahNumber(quran: quran, sura: 112, ayah: 3)!, x: 78, y: 317),
            AyahNumberLocation(ayah: AyahNumber(quran: quran, sura: 112, ayah: 4)!, x: 289, y: 434),
            AyahNumberLocation(ayah: AyahNumber(quran: quran, sura: 113, ayah: 1)!, x: 656, y: 793),
            AyahNumberLocation(ayah: AyahNumber(quran: quran, sura: 113, ayah: 2)!, x: 276, y: 794),
            AyahNumberLocation(ayah: AyahNumber(quran: quran, sura: 113, ayah: 3)!, x: 722, y: 910),
            AyahNumberLocation(ayah: AyahNumber(quran: quran, sura: 113, ayah: 4)!, x: 70, y: 909),
            AyahNumberLocation(ayah: AyahNumber(quran: quran, sura: 113, ayah: 5)!, x: 288, y: 1019),
            AyahNumberLocation(ayah: AyahNumber(quran: quran, sura: 114, ayah: 1)!, x: 584, y: 1379),
            AyahNumberLocation(ayah: AyahNumber(quran: quran, sura: 114, ayah: 2)!, x: 164, y: 1376),
            AyahNumberLocation(ayah: AyahNumber(quran: quran, sura: 114, ayah: 3)!, x: 874, y: 1495),
            AyahNumberLocation(ayah: AyahNumber(quran: quran, sura: 114, ayah: 4)!, x: 187, y: 1493),
            AyahNumberLocation(ayah: AyahNumber(quran: quran, sura: 114, ayah: 5)!, x: 237, y: 1614),
            AyahNumberLocation(ayah: AyahNumber(quran: quran, sura: 114, ayah: 6)!, x: 323, y: 1728),
        ]
        return PageMarkers(suraHeaders: suraHeaders, ayahNumbers: ayahNumbers)
    }
}
