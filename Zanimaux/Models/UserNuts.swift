//
//  UserNuts.swift
//  TodayList
//
//  Created by Emmanuelle GOUGELET on 26/06/2020.
//  Copyright © 2020 Emmanuelle GOUGELET. All rights reserved.
//
import SwiftUI

class UserNuts: ObservableObject {
    
    @Published var nuts: Int {
        didSet {
            UserDefaults.standard.save(nuts, for: "nuts")
        }
    }
    @Published var collectedItems : [Card] {
        didSet {
            UserDefaults.standard.save(collectedItems, for: "cards")
        }
    }
    @Published var collectedTrophys: [ListTrophy] {
        didSet {
            UserDefaults.standard.save(collectedTrophys, for: "trophys")
        }
    }
   
    @Published var doFilter = true

//    init(nuts: Int, collectedItems: [Card], collectedTrophys: [ListTrophy]) {
//        self.nuts = nuts
//        self.collectedItems = collectedItems
//        self.collectedTrophys = collectedTrophys
//
//    }
// POUR RESET LES DONNNNNNNNEEEEEESSSSSSS MAIS EN FAITE NON CEST DLA MERDE
//
    init(nuts: Int, collectedItems: [Card], collectedTrophys: [ListTrophy]) {
           self.nuts = 0
           self.collectedItems = [ ]
           self.collectedTrophys = [ ]

       }


}


