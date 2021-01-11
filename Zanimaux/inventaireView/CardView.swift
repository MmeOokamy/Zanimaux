//
//  ContentView.swift
//  Zanim
//
//  Created by Konrad Cureau on 24/06/2020.
//  Copyright © 2020 Konrad Cureau. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    let item: Card
    
    @State private var isShowingVerso: Bool = false
    @EnvironmentObject var setting: UserNuts
    
    var body: some View {
    
    ZStack {
            
            Image("backgroundJungle")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            
            
    VStack {
               
        ZStack {
            
            Rectangle()
                .foregroundColor(item.family.color)
                .opacity(0.9)
                .cornerRadius(20)
                .shadow(radius: 5)
                .padding()
            if isShowingVerso == false {
                CardViewRecto(item: item)
                .contentShape(Rectangle())
                .onTapGesture {
                    self.isShowingVerso.toggle()
                }

            } else {
                CardViewVerso(item: item)
                    .rotation3DEffect(Angle(degrees: self.isShowingVerso ?
                    180 : 0), axis: (x: 0, y: 1, z: 0))
                .contentShape(Rectangle())
                .onTapGesture {
                    self.isShowingVerso.toggle()
                }
        }

    }    .rotation3DEffect(Angle(degrees: self.isShowingVerso ?
          180 : 0), axis: (x: 0, y: 1, z: 0))
              
        .animation(.default)
            }
            
    
        
        }
    .navigationBarTitle("", displayMode: .inline)
    .navigationBarItems(trailing:
        HStack{
            Text("\(setting.nuts)")
                Image("nut")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width:30)
        }
        )
    }
}
