//
//  CardViewRecto.swift
//  Zanim
//
//  Created by Konrad Cureau on 24/06/2020.
//  Copyright © 2020 Konrad Cureau. All rights reserved.
//

import SwiftUI

struct CardViewRecto: View {
    var item: Card
    var body: some View {
        
        
        
        ZStack {
                
                
                VStack {
                    HStack(alignment: .top) {
                        Text("Famille des \(item.family.name)")
                        Spacer()
                        Image(systemName: "arrow.uturn.right.circle.fill")
                            .foregroundColor(.gray)
                        .font(.headline)
                    }
                        .padding([.top, .leading, .trailing])

                    item.image
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 10)
                        .cornerRadius(20)
                    VStack {
                        Text("\(item.name)")
                            .font(.largeTitle)
                        Spacer()
                        HStack {
                            Text("Le savais-tu ?")
                                .font(.title)
                            Spacer()
                        }
                        Text("\(item.smallDescription)")
                            .font(.headline)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.trailing)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    MapView(coordinate: item.locationCoordinate)
                        
                        .frame(height: 200)
                        .cornerRadius(20)
                        .padding(.horizontal)
                    Text("Photographié le \(item.datePhoto)")
                        .font(.caption)
                        .padding(.bottom)
                }

            }
        .padding()
        
    }
}





