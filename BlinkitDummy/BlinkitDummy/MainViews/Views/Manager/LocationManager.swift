//
//  LocationManager.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 27/09/24.
//

import Foundation
import CoreLocation
//
//class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
//    private let locationManager = CLLocationManager()
//
//    
//    
//    @Published var userLocation: CLLocationCoordinate2D?
//    @Published var userAddress: String = ""
//    
//    override init() {
//        super.init()
//        self.locationManager.delegate = self
//        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        self.locationManager.requestWhenInUseAuthorization()
//        self.locationManager.startUpdatingLocation()
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else {return}
//        self.userLocation = location.coordinate
//        reverseGeocode(location: location)
//    }
//    func reverseGeocode(location: CLLocation){
//        let geocoder = CLGeocoder()
//        geocoder.reverseGeocodeLocation(location) { placemarks, error in
//            if let _ = error {
//                self.userAddress = "Unable to find address"
//                return
//            }
//            
//            if let placemark = placemarks?.first {
//                self.userAddress = "\(placemark.name ?? ""), \(placemark.locality ?? ""), \(placemark.country ?? "")"
//            }
//        }
//    }
//    
//}
import Foundation
import CoreLocation

final class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    @Published var lastKnownLocation: CLLocationCoordinate2D?
    var manager = CLLocationManager()
    @Published var userAddress: String = ""
    static let shared = LocationManager()
    @Published var isLocationEnabled: Bool = false
    
    
    func checkLocationAuthorization() {
        
        manager.delegate = self
        manager.startUpdatingLocation()
        
        switch manager.authorizationStatus {
        case .notDetermined://The user choose allow or denny your app to get the location yet
            manager.requestWhenInUseAuthorization()
            isLocationEnabled = false
            
        case .restricted://The user cannot change this app’s status, possibly due to active restrictions such as parental controls being in place.
            print("Location restricted")
            isLocationEnabled = false
            
        case .denied://The user dennied your app to get location or disabled the services location or the phone is in airplane mode
            print("Location denied")
            isLocationEnabled = false
            
        case .authorizedAlways://This authorization allows you to use all location services and receive location events whether or not your app is in use.
            print("Location authorizedAlways")
            isLocationEnabled = false
            
        case .authorizedWhenInUse://This authorization allows you to use all location services and receive location events only when your app is in use
            print("Location authorized when in use")
            lastKnownLocation = manager.location?.coordinate
            isLocationEnabled = true
            
        @unknown default:
            print("Location service disabled")
            isLocationEnabled = false
        
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {//Trigged every time authorization status changes
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        lastKnownLocation = locations.first?.coordinate
        reverseGeocoding(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    }
    func reverseGeocoding(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
            let geocoder = CLGeocoder()
            let location = CLLocation(latitude: latitude, longitude: longitude)
            geocoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
                if error != nil {
                    print("Failed to retrieve address")
                    return
                }
                
//                if let placemarks = placemarks, let placemark = placemarks.first {
//                    self.userAddress = placemark.address!
//                    print(placemark.address!)
//                }
//                else
//                {
//                    print("No Matching Address Found")
//                }
                if let placemark = placemarks?.first {
                    // Use the safe optional handling to build the address
                    
                    self.userAddress = placemark.address ?? "No Matching Address Found"
                    print(self.userAddress)
                } else {
                    self.userAddress = "No Matching Address Found"
                    print("No Matching Address Found")
                }
            })
        }
    
}

extension CLPlacemark {

    var address: String? {
        if let name = name {
            var result = name

            if let street = thoroughfare {
                result += ", \(street)"
            }

            if let city = locality {
                result += ", \(city)"
            }

            if let country = country {
                result += ", \(country)"
            }

            return result
        }

        return nil
    }

}

