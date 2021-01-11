//
//  TodayRow.swift
//  TodayList
//
//  Created by Emmanuelle GOUGELET on 24/06/2020.
//  Copyright © 2020 Emmanuelle GOUGELET. All rights reserved.
//

import SwiftUI

struct TodayRow: View {
    
    var listToday: TodayStructure
    
    var body: some View {
     
                VStack {
                           HStack {
                               Text(listToday.todayTitle)
                               .font(.largeTitle)
                               .multilineTextAlignment(.leading)
                                .foregroundColor(.black)
                               Spacer()
                            Image(systemName: listToday.todayIcon)
                           }
                           
                    VStack {
                        if listToday.imageName.isEmpty {
                        Text(listToday.todayDescription)
                            .foregroundColor(.white)
                               .multilineTextAlignment(.trailing)
                               .padding()
                                
                            } else {
                            Image(listToday.imageName)
                            .resizable()
                            .renderingMode(.original)
                                .scaledToFit()
                        
                            Text(listToday.todayDescription)
                                .foregroundColor(.white)
                               .multilineTextAlignment(.trailing)
                               .padding()
                 
                            }
                    }
//                    .background(Color.todayProfil.opacity(0.8))
                        .background((LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .trailing, endPoint: .leading)).opacity(0.8))
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    
                         
        }
    }
}

