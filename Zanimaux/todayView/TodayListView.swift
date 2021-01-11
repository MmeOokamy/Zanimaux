//
//  TodayListView.swift
//  TodayList
//
//  Created by Emmanuelle GOUGELET on 24/06/2020.
//  Copyright © 2020 Emmanuelle GOUGELET. All rights reserved.
//

import SwiftUI

struct TodayListView: View {
  
    //Solution is this method!
         init(){
            UITableView.appearance().backgroundColor = .clear
            UITableViewCell.appearance().backgroundColor = .clear
            UITableView.appearance().tableFooterView = UIView()
         }
    @EnvironmentObject var setting: UserNuts
      
   var body: some View {
         
         ZStack {
                         Image("backgroundJungle")
                             .resizable()
                             .edgesIgnoringSafeArea(.all)


                 VStack(alignment: .leading) {

                     HStack {
                    //    titre + gland
                                    Text("Aujourd'hui") //titre Ecran ?
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.black)
                                        .multilineTextAlignment(.leading)
                                        
                                    Spacer()
                        Text("\(setting.nuts)")
                                    Image("nut")
                                        .renderingMode(.original)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:30)
                                }
                     .padding()
                     .padding(.top, 32)
                      // appele de la liste
                  
      List(todayData) { TodayStructure in TodayRow( listToday: TodayStructure)
        
                              }
                     
          
      }
      
          }
    }
}

struct TodayListView_Previews: PreviewProvider {
    static var previews: some View {
        TodayListView()
    }
}
