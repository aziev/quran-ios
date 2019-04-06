//
//  QariDataRetriever.swift
//  Quran
//
//  Created by Mohamed Afifi on 4/27/16.
//
//  Quran for iOS is a Quran reading application for iOS.
//  Copyright (C) 2017  Quran.com
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//

import PromiseKit

protocol QariDataRetrieverType {
    func getQaris() -> Guarantee<[Qari]>
}

struct QariDataRetriever: QariDataRetrieverType {

    func getQaris() -> Guarantee<[Qari]> {
        return Guarantee { resolver in
            DispatchQueue.global().async {
                resolver(Qari.qaris.sorted {
                    $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending
                })
            }
        }
    }
}

extension Qari {
    var name: String {
        return l(nameKey, table: "Readers")
    }
}
