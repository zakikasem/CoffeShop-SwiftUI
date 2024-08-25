//
//  TrackOrderViewModel.swift
//  CoffeShop
//
//  Created by Mohamed Ali on 25/08/2024.
//

import SwiftUI
import MapKit

enum MapConstans {
    static let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
}

class TrackOrderViewModel: ObservableObject {
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 31.240992847173807, longitude: 32.323081633900344), span: MapConstans.span)

    
    var location = LocationManager()
    
    func fetchUserLocation() {
        location.checkLocationAuthorization()
        
        guard let coordinate = location.lastKnownLocation else { return }
        
        print(coordinate)
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude), span: MapConstans.span)
        }
        
        
    }
}
