//
//  TodayStructure.swift
//  TodayList
//
//  Created by Emmanuelle GOUGELET on 24/06/2020.
//  Copyright © 2020 Emmanuelle GOUGELET. All rights reserved.
//


import SwiftUI


struct TodayStructure : Hashable, Codable, Identifiable{
    
    var id : Int
    var imageName: String
    var todayTitle: String
    var todayIcon: String
    var todayDescription: String

}
