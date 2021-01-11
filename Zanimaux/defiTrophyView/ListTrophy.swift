//
//  listTrophy.swift
//  projet_simplon_v1.1
//
//  Created by emm on 26/06/2020.
//  Copyright © 2020 emm. All rights reserved.
//

import SwiftUI

struct ListTrophy: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var body: String
    var number: String
    fileprivate var imageName: String
    var cardValue: Int
}

extension ListTrophy {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
