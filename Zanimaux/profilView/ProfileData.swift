//
//  ProfileData.swift
//  bebetologue
//
//  Created by Julien Dabert on 25/06/2020.
//  Copyright © 2020 Emmanuelle GOUGELET. All rights reserved.
//

import SwiftUI

struct ProfileData: Hashable, Codable, Identifiable {
    var id = UUID()
    
    static var stepNumber: Int = 12
    static var challNumber: Int = 2
    static var cardNumber: Int = 6
    static var userName: String = "Sophie"
    static var nbrTrophy: Int = 3
//    static var userNuts: Int = 15000
    
}


