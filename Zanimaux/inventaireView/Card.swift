//
//  Data.swift
//  Zanim
//
//  Created by Konrad Cureau on 24/06/2020.
//  Copyright © 2020 Konrad Cureau. All rights reserved.
//

import SwiftUI
import CoreLocation


struct Card: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var smallDescription: String
    var bigDescription: String
    var family: Family
    var datePhoto: String
    var cardValue: Int

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    enum Family: String, CaseIterable, Codable, Hashable {
        case plants = "plants"
        case insects = "insects"
        case birds = "birds"
        case fishes = "fishes"
        case reptiles = "reptiles"
        case amphibians = "amphibians"
        case mammals = "mammals"
    }
}

extension Card {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

extension Card.Family {
    var name:String {
        switch self {
        case .plants:
            return "Plantes"
        case .insects:
            return "Insectes"
        case .birds:
            return "Oiseaux"
        case .fishes:
            return "Poissons"
        case .reptiles:
            return "Reptiles"
        case .amphibians:
            return "Amphibiens"
        case .mammals:
            return "Mammifères"
        }
    }
    var color:Color {
        switch self {
        case .plants:
            return Color.plants
        case .insects:
            return Color.insects
        case .birds:
            return Color.birds
        case .fishes:
            return Color.fishes
        case .reptiles:
            return Color.reptiles
        case .amphibians:
            return Color.gray
        case .mammals:
            return Color.pink
        }
    }
}

