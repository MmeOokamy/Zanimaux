//
//  CardViewVerso.swift
//  Zanim
//
//  Created by Konrad Cureau on 24/06/2020.
//  Copyright © 2020 Konrad Cureau. All rights reserved.
//

import SwiftUI
import UIKit


struct CardViewVerso: View {
    var item: Card
     
    @EnvironmentObject var setting: UserNuts
  
    func addNuts() {
           
        self.setting.nuts += item.cardValue
        self.setting.collectedItems.append (self.item)
       }
    
    var alreadyCollected: Bool { setting.collectedItems.contains(item)}
    
    var body: some View {
   
        
        ZStack {
            VStack  {
                HStack  {
                    Spacer()
                    Text("Origines et Caractéristiques")
                        .font(.headline)
                        
                    Spacer()
                    Image(systemName: "arrow.uturn.right.circle.fill")
                        .foregroundColor(.gray)
                    .font(.headline)
                    
                }
                
                Text("\(item.bigDescription)")
                Spacer()
                Button(action: {self.addNuts()}) {
                    HStack {
                        Text("Collecter \(item.cardValue)")
                        
                            .foregroundColor(.white)
                        Image("nut")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width:30)
                    }
                    .padding()
                    .background(Color.green)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                }.disabled(alreadyCollected)
                    .opacity(alreadyCollected ? 0 : 1)
                
            }
        .padding()
        }
    .padding()
    }
}



