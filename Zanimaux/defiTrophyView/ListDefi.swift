//
//  dataDefi.swift
//  projet_simplon_v1.1
//
//  Created by emm on 25/06/2020.
//  Copyright © 2020 emm. All rights reserved.
//

import SwiftUI

struct ListDefi: Codable, Identifiable, Hashable {
    var id: Int
    var action: String
    var target: String
    var body: String
    var number: String
    fileprivate var imageName: String
}

extension ListDefi {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

