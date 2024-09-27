//
//  MapView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 27/09/24.
//
//
import SwiftUI
import CoreLocation
import MapKit

struct MapView: View {

    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 28.4089, longitude: 77.3178), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))

    var body: some View {
        VStack {
            Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    if let location = LocationManager.shared.lastKnownLocation {
                        region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                    }
                }
        }
    }
}


#Preview {
    MapView()
}
