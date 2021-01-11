//
//  MapView.swift
//  Zanim
//
//  Created by Konrad Cureau on 24/06/2020.
//  Copyright © 2020 Konrad Cureau. All rights reserved.
//

import SwiftUI
import MapKit


struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
         let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
        uiView.addAnnotation(annotation)
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: itemData[1].locationCoordinate)
    }
}


