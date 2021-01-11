//
//  UserDefaultsStored.swift
//  Zanimaux
//
//  Created by Emmanuelle GOUGELET on 30/06/2020.
//  Copyright © 2020 Emmanuelle GOUGELET. All rights reserved.
//

import Foundation

 extension UserDefaults {
    func save<Object: Codable>(_ object: Object, for key: String) {
        let encoder = JSONEncoder()
        let encoded = try? encoder.encode(object)
        set(encoded, forKey: key)
    }
    func getObject<Object: Codable>(for key: String) -> Object? {
        let decoder = JSONDecoder()
        let data = self.object(forKey: key) as? Data
        return try? data.map { try decoder.decode(Object.self, from: $0) }
    }
}


