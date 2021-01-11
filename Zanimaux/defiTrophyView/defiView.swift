//
//  defiView.swift
//  projet_simplon_v1.1
//
//  Created by emm on 25/06/2020.
//  Copyright © 2020 emm. All rights reserved.
//

import SwiftUI

struct DefiView: View {
    @State var selected = false
    @State private var offset = CGSize.zero

    var body: some View {
        
        ZStack {
            
        Image("backgroundJungle")
            .resizable()
            .edgesIgnoringSafeArea(.all)
        
        VStack(spacing: 8) {
            Spacer()
            Topbar(selected: self.$selected)
            .padding(1)
            .background(Color("Color").blur(radius: 1).opacity(0.6))
            .clipShape(Capsule())
            
            
            Spacer()
            if self.selected == false {
                VStack {
                    Text("Défis")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                    Home(defi: ListDefi.list)
                }
            }else {
                VStack {
                    Text("Trophées")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.yellow)
                    MainTrophyVertical(trophy: ListTrophy.list)
                }
            }
            }
            
        }
        .gesture(
            DragGesture(minimumDistance: 50)
                .onEnded { _ in
                    self.selected.toggle()
                }
        )
    }
}


struct Home: View {
    let defi: [ListDefi]
    
    var body: some View{
        
        ScrollView(.vertical, showsIndicators:  false) {
            VStack(spacing: 15){
                ForEach(defi) { i in
                  HomeRow(defi: i)
                
                    
                }
            }.padding()
        }
    }
}

struct HomeRow: View {
    
    let defi: ListDefi
    @State var percentage:CGFloat = 0
    
    func calcul()-> CGFloat{
        
        var result:CGFloat
        
        if defi.number == "5" {
         result = 100
        }else if defi.number == "4" {
           result = 80
        }else if defi.number == "3" {
            result = 60
        }else if defi.number == "2" {
            result = 40
        }else if defi.number == "1" {
            result = 20
        }else {
            result = 0
        }
        return result
    }
    
    
    var body: some View {
        ZStack {
            HStack(spacing: 15) {
                
                ZStack {
//                    Outline(percentage: percentage)
                    Loader(percent: calcul())
                    defi.image.renderingMode(.original)
                                      .resizable()
                                      .scaledToFit()
                                      .frame(width:60)
                }
                Spacer()
                
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(defi.action)
                        .bold()
                    Text(defi.target)
                    HStack{
                        
                        Text(defi.number).foregroundColor(defi.number == "5" ? .green : .black)
                        Text(defi.body).foregroundColor(defi.number == "5" ? .green : .black)
                        
                    }
//                    HStack {
//                        Slider(value: $percentage, in: 0...100)
//                    }
                    
                }
                Spacer()
            }
        }
        .padding(14)
        .padding(.leading)
        .padding(.trailing)
        .background(Color.white.opacity(1).blur(radius: 0))
        .cornerRadius(15)
        .shadow(radius: 10)
        
        
    }
    
}



struct defiView_Previews: PreviewProvider {
    static var previews: some View {
        DefiView()
    }
}
