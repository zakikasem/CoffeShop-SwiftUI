//
//  LocationManager.swift
//  CoffeShop
//
//  Created by Mohamed Ali on 25/08/2024.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    @Published var lastKnownLocation: CLLocationCoordinate2D?
    @Published var locationError: String?
    var manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func checkLocationAuthorization() {
        manager.requestWhenInUseAuthorization()
        
        manager.startUpdatingLocation()
        
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .restricted:
            locationError = "Location restricted"
            print("Location restricted")
            manager.requestWhenInUseAuthorization()
        case .denied:
            locationError = "Location denied"
            print("Location denied")
        case .authorizedAlways, .authorizedWhenInUse:
            lastKnownLocation = manager.location?.coordinate
        @unknown default:
            locationError = "Location service disabled"
            print("Location service disabled")
            manager.requestWhenInUseAuthorization()
        }
    }
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        locationStatusSubject.send(manager.authorizationStatus)
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastKnownLocation = locations.first?.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationError = error.localizedDescription
        print("Failed to get user's location: \(error.localizedDescription)")
    }
}
