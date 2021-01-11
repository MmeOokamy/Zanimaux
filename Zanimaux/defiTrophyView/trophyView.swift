//
//  trophyView.swift
//  projet_simplon_v1.1
//
//  Created by emm on 25/06/2020.
//  Copyright © 2020 emm. All rights reserved.
//

import SwiftUI
import UIKit



/////////////////////////////////////////////////////    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

//struct Trophy: View {
//
//    var body: some View {
//        VStack{
//            Spacer()
//            Text("Hello")
//        }
//    }
//}
/////////////////////////////////////////////////////    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


struct MainTrophyVertical: View {
    @EnvironmentObject var setting: UserNuts

    var trophy: [ListTrophy]
    
    var body: some View{
        
        ScrollView(.vertical, showsIndicators:  false) {
            HStack {
            Text("\(setting.nuts)")
            Image("nut")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width:30)
            }
            
            VStack(spacing: 25){
                ForEach(trophy) { i in
                 TrophyRow(trophy: i)
                
                    
                }
            }.padding()
            
        }
    }
}

/////////////////////////////////////////////////////    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

struct TrophyRow: View {
    
    var trophy: ListTrophy

    @EnvironmentObject var setting: UserNuts
    
    func addTrophyNuts() {
        self.setting.nuts += trophy.cardValue
        self.setting.collectedTrophys.append (self.trophy)
    }

    var alreadyCollected: Bool { setting.collectedTrophys.contains(trophy)}
    
//    func addTrophyNuts() {
//
//        self.setting.nuts += trophy.cardValue
//        self.setting.collectedTrophys.append (self.ListTrophy)
//       }
//
//    var alreadyTrophyCollected: Bool { setting.collectedtrophys.contains(trophy)
//
//    }


    
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
               
            HStack {
                VStack (alignment: .leading){
                    trophy.image
                        .renderingMode(.original)
                        .resizable()
                        .frame(width:130, height: 120)
                }
                Spacer()
                
                VStack (alignment: .center){
                    Text(trophy.title)
                        .multilineTextAlignment(.leading)
                }
                   
                    
                    
                    
                
                Spacer()
                VStack (alignment: .trailing){
                    Button(action:
                    {self.addTrophyNuts()}) {
                        VStack (alignment: .center) {
                                Spacer()
                                Image("nuts")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 25)
                                Text("\(trophy.cardValue)")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                Text("Collecter")
                                    .foregroundColor(.white)
                                Spacer()
                        }.padding(.horizontal)
                           
                            
                        
                        
                        }
                    .disabled(alreadyCollected)
                    .opacity(alreadyCollected ? 0 : 1)
                    .background(alreadyCollected ? Color.white : Color.green )
                }
                
            }
        }
     
            
//        .padding(.trailing)
//        .background(Color.white.opacity(1).blur(radius: 0))
        .cornerRadius(20)
    .shadow(radius: 10)
          .padding(.horizontal)
        
        
    }
    
}




/////////////////////////////////////////////////////    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


