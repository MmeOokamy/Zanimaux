//
//  ContentView.swift
//  projet_simplon_v1.1
//
//  Created by emm on 23/06/2020.
//  Copyright © 2020 emm. All rights reserved.
//

import SwiftUI



//////////////////////////////////////////////////////////////////////////    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

struct ContentView: View {
    
//    init() {
//        let segmentAppearance = UISegmentedControl.appearance()
//        segmentAppearance.selectedSegmentTintColor = .clear
//    }
    @State var index = 0
    
    @State var selected = 1
  
    var body: some View {
        
        
        
        TabView(selection: $selected) {
           
                TodayListView()
                .tabItem {
                    
                    if selected == 1 {
                        Image("today")
                    }else {
                        Image("todayGray")
                    }
                    Text("Aujourd'hui")
            }.tag(1)
            
            //////////////////////////////////
            
            InventoryList(item: itemData)
                
                .tabItem {
                    if selected == 2 {
                        Image("collection")
                    }else {
                        Image("collectionGray")
                    }
                    Text("Collection")
                    
            }.tag(2)
            
            
            //////////////////////////////////
            
            CameraView()
                .tabItem {
                    if selected == 3 {
                        Image("camera")
                    }else {
                        Image("cameraGray")
                    }
                    Text("Caméra")
            }.tag(3)
            
            //////////////////////////////////
            DefiView()
                .tabItem {
                    if selected == 4 {
                        Image("challenge")
                    }else {
                        Image("challengeGray")
                    }
                    Text("Défis")
            }.tag(4)
            //////////////////////////////////
            ProfileView()
                .tabItem {
                    if selected == 5 {
                        Image("profile")
                    }else {
                        Image("profileGray")
                    }
                    Text("Profil")
            }.tag(5)
            //////////////////////////////////
        }
        
        
    }
    
    
}



////////////////////////////////////////////////////////////////////////////
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}




//////////////////////////////////////////////////////////////////////////  top button defi & trophy   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


struct Topbar : View {
    
    @Binding var selected : Bool
     var image: Image {
        self.selected == false ? Image("defi").renderingMode(.original) : Image("defi").renderingMode(.template)
        
    }
    
    var body: some View {
        
        HStack {
            Button(action: {
                self.selected = false
                
            }) {
                image
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 30)
                    .background(self.selected == false ? Color.white : Color.clear)
                    .clipShape(Capsule())
            }
            .foregroundColor(self.selected == false ? .blue : .gray)
            
            
            Button(action: {
                self.selected = true
            }) {
                Image("trophy")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 30)
                    .background(self.selected == true ? Color.white : Color.clear)
                    .clipShape(Capsule())
            }
            .foregroundColor(self.selected == true ? .yellow : .gray)
            
        }
    }
}



