//
//  ContentView.swift
//  SwiftUICamera
//
//  Created by Mohammad Azam on 2/10/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct CameraView: View {
    @EnvironmentObject var setting: UserNuts
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage?
    
    
    func getImage() -> some View {
        if self.image != nil {
            return AnyView(ElementInventory(item: itemData.last!))
        } else {
            return AnyView(Image(uiImage: UIImage(named: "placeholder")!)
            .resizable()
                .cornerRadius(20)
            .frame(width: 300, height: 300))
            
            
        }
    }
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Image("backgroundJungle")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                VStack {
                    
                 
                    
                    getImage()
                        
                    
                    Button("Choisis ta photo !") {
                        self.showSheet = true
                        self.setting.doFilter = false
                    }.padding()
                        .actionSheet(isPresented: $showSheet) {
                            ActionSheet(title: Text("Sélectionne une photo"), buttons: [
                                .default(Text("Album Photo")) {
                                    self.showImagePicker = true
                                    self.sourceType = .photoLibrary
                                },
                                .default(Text("Appareil Photo")) {
                                    self.showImagePicker = true
                                    self.sourceType = .camera
                                },
                                .cancel()
                            ])
                    }
                    
                }
                    
                    
                .navigationBarTitle("Caméra")
            }
            
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
            
        }
    }
}
