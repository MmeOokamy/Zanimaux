//
//  ElementInventory.swift
//  Zanim
//
//  Created by Konrad Cureau on 24/06/2020.
//  Copyright © 2020 Konrad Cureau. All rights reserved.
//

import SwiftUI

struct ElementInventory: View {
    var item: Card
    var body: some View {
        NavigationLink (destination: CardView(item: item)){
            VStack {
                ZStack {
                Rectangle()
                    .frame (width:160, height:170)
                    .cornerRadius(20)
                    .foregroundColor(item.family.color)
            item.image
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 160)
                .cornerRadius(20.0)
                .clipped()
                
                    
                    
                
                
              
            
                
            }
            
            .padding(.top, 5)
                .padding(.bottom, 5)
            HStack {
                    Text(item.name.uppercased())
                        .font(.custom("HelveticaNeue-Medium", size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(6)
            }.background(item.family.color)
            .cornerRadius(10.0)
            .padding(6)
            
            }
            
            
    }
        .buttonStyle(PlainButtonStyle())
    
    }
}

