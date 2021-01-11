//
//  ProfileView.swift
//  bebetologue
//
//  Created by Emmanuelle GOUGELET on 23/06/2020.
//  Copyright © 2020 Emmanuelle GOUGELET. All rights reserved.
//

import SwiftUI


struct ProfileView: View {
   
//    Variables du Toggle
    @State private var userChoiceVibration: Bool = true
    @State private var userChoiceGeoloc: Bool = true
    @State private var showingAlert = false
    @EnvironmentObject var setting: UserNuts
    
    
    var body: some View {
        ZStack {
        
//Photo utilisateur, nom et nombre de glands accumulés
            
        Image("backgroundJungle")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            
        VStack {
                VStack {
                    Image("UserPhoto")
                        .resizable()
                        .scaledToFill()
                        .background(Color.white)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .frame(width: 200, height: 200)
                        
                    Button(action: {}) {
                        
                        HStack {
                            Text("\(ProfileData.userName)")
                                .fontWeight(.heavy)
                            Image(systemName: "pencil")
                            
                        }
                        .foregroundColor(.white)
                        .padding()
                    }
                    .background((LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .trailing, endPoint: .leading)).opacity(0.8))
                    .cornerRadius(40)
                    
                    

                    
                    HStack {
                        Text("\(setting.nuts)")
                        Image("nut")
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFit()
                                .frame(width:30)
                        }
                    HStack {
    
                        Button(action: { self.showingAlert = true}) {
                            Text("Échange tes noisettes !")
                            Image(systemName: "cart.fill")
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("En travaux..."), message: Text("La boutique est en cours de construction. Reviens nous voir bientôt !"), dismissButton: .default(Text("Compris !")))
                        }
                        .opacity(0.8)
                        .padding()
                        .foregroundColor(.white)
                        .background((LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .trailing, endPoint: .leading)).opacity(0.8))
                        .cornerRadius(15.0)
                        .shadow(radius: 20)
                        
                    }
                    
            }
            .padding()
     
//encadré avec les statistiques et les options - mentions légales
            
            VStack {
                HStack  {
                    VStack (alignment: .leading,spacing: 6) {
                        Text("Nombre de km parcourus : ").fontWeight(.bold)
                        Text("Nombre de défis terminés : ").fontWeight(.bold)
                        Text("Nombre de trophées obtenus : ").fontWeight(.bold)
                        Text("Nombre de cartes obtenues : ").fontWeight(.bold)
        
                    }
                    .foregroundColor(.white)
                    VStack (alignment: .trailing,spacing: 7) {
                        Text("\(ProfileData.stepNumber)")
                        Text("\(ProfileData.challNumber)")
                        Text("\(ProfileData.nbrTrophy)")
                        Text("\(ProfileData.cardNumber)")
                    }
                    
                    VStack (spacing: 15) {
                        Image(systemName: "hare")
                        Image(systemName: "goforward.plus")
                        Image(systemName: "flag.circle")
                        Image(systemName: "rectangle.grid.2x2")
                    }
                
                }
                .font(.body)
            
            .padding()
        }
        
        .background((LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .trailing, endPoint: .leading)).opacity(0.8))
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
            
            VStack {
                VStack {
                                  Toggle("Activation des Vibrations", isOn: $userChoiceVibration)
                    
                                  Toggle("Activation du GPS", isOn: $userChoiceGeoloc)
                                  }
                              .padding()
                .foregroundColor(.white)
            }
            .background((LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .trailing, endPoint: .leading)).opacity(0.8))
            .cornerRadius(20)
                .shadow(radius: 10)
            .padding()
            
            VStack {
                VStack {
                    Text("Aide et Support")
                       
                    HStack {
                    Text("Mentions légales :")
                        
                    Text("signalement.gouv.fr")
                        .underline()
                    }
                    
                }.padding()
                .font(.footnote)
            }
            
            }
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
