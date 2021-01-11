//
//  InventoryView.swift
//  Zanim
//
//  Created by Konrad Cureau on 24/06/2020.
//  Copyright © 2020 Konrad Cureau. All rights reserved.
//

import SwiftUI

private func orderItems(_ items:[Card]) -> [Card] {
    items.sorted { (lhs, rhs) -> Bool in
        lhs.name < rhs.name
    }
}



struct InventoryList: View {
    
    @EnvironmentObject var setting: UserNuts
    
    let item:[Card]
    
    init (item:[Card]) {
        self.item = item
        self.orderedItems = orderItems(self.item)
    }
    
    var filteredItems : [Card] {
        if setting.doFilter {
        return orderedItems.filter { (card) -> Bool in
            card.id != 1006
            }
        } else {
            return orderedItems
            
        }
    }

    let orderedItems: [Card]
    func createRow(index : Int) -> AnyView {
        if index.isMultiple(of: 2) {
            return AnyView(HStack {
                
                ElementInventory(item: filteredItems[index])
                    .frame(minWidth: 0, maxWidth: .infinity)
                    
                if index+1 < filteredItems.count { ElementInventory(item: filteredItems[index+1])
                    .frame(minWidth: 0, maxWidth: .infinity)
                } else {
                    Spacer()
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
            })
        } else {
            return AnyView(EmptyView())
        }
    }
    @State private var searchText = ""
    
    var body: some View {
        
      
            
        NavigationView {
                
    
               
                ScrollView {
                    
       
                 
                SearchBar(text: $searchText)
                    .padding(.top)
                ForEach(0..<item.count) { index in
                    self.createRow(index: index)
                    }
                   
                
                
               
            
                    }.padding()
                .background( Image("backgroundJungle")
                .resizable()
                .edgesIgnoringSafeArea(.all))
                .navigationBarTitle("Ma Collection")
            
        }
    }
}

struct InventoryList_Previews: PreviewProvider {
    static var previews: some View {
        InventoryList(item: itemData)
    }
    
}





