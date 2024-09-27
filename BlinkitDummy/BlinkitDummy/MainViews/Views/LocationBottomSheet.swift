//////
//////  LocationBottomSheet.swift
//////  BlinkitDummy
//////
//////  Created by Rahul Rai on 21/09/24.
//////
////
//import SwiftUI
////
//struct LocationBottomSheet: View {
//    @StateObject private var locationManager = LocationManager()
//    
//    @Binding var address: String
//    @Binding var addressTag: String
//    @Binding var houseNumber: String
//
//    var body: some View {
//        VStack {
//
////            if let coordinate = locationManager.lastKnownLocation {
//////                Text("Latitude: \(coordinate.latitude)")
//////                
//////                Text("Longitude: \(coordinate.longitude)")
//////                
//////                Text("ADDRESS: \(locationManager.userAddress)")
////            } else {
////                Text("Unknown Location")
////            }
//            
//            HStack{
//                Label("Located not enabled. Enable for current location", systemImage: "pin.slash")
//                Spacer()
//                Button("Get location") {
//                    locationManager.checkLocationAuthorization()
//
////                    }
//                }
////                .buttonStyle(.borderedProminent)
//                .background(Color.brandPrimary.cornerRadius(10))
//                .foregroundStyle(Color.white)
//            }
//            MapView()
//            Text("Current Address is: \(locationManager.userAddress)")
//                .font(.headline.weight(.semibold))
//            
//            Button("Save Address") {
//
////                    DispatchQueue.main.async {
//                    address = locationManager.userAddress // Autofill the address
//                    
//                    addressTag = "HOME" // or some logic to set this
//                    houseNumber = "123" // Example; modify based on your location fetch logic
////                    }
//            }
//
//        }
////        .customNavigationAddress(locationManager.userAddress)
//        .padding()
//
//    }
//}
////
////#Preview {
////    LocationBottomSheet()
////}
//
//
//

import SwiftUI

struct LocationBottomSheet: View {
    @StateObject private var locationManager = LocationManager()
    
    @Binding var address: String
    @Binding var addressTag: String
    @Binding var houseNumber: String
    
//    @Binding var firstNameforDelivery: String
//    @Binding var lastNameforDelivery: String
//    @Binding var emailforDelivery: String
    
    
    @State private var isLocationEnabled: Bool = false

    var body: some View {
        VStack(spacing: 16) {
            // Status Header
            HStack {
                Text(isLocationEnabled ? "Location is enabled now! 😊" : "Location is not enabled. Enable for current location.")
                    .font(.headline)
                    .foregroundColor(isLocationEnabled ? .brandPrimary : .red)
                Spacer()
                Button(action: {
                    if !isLocationEnabled {
                        locationManager.checkLocationAuthorization()

                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // Adjust delay as needed
                                  self.address = locationManager.userAddress // Autofill the address
                                  self.isLocationEnabled = true // Update the location status
                              }
                    }
                }) {
                    Text(isLocationEnabled ? "Enabled" : "Enable")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(isLocationEnabled ? Color.brandPrimary : Color.blue)
                        .cornerRadius(8)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            
            // Map View
            MapView()
                .frame(height: 300) // Set a height for the map
                .cornerRadius(10)
                .shadow(radius: 5)

            Form{
//                Section{
//                    TextField("First Name", text: $firstNameforDelivery)
//                    TextField("Last Name", text: $lastNameforDelivery )
//                    TextField("Email", text: $emailforDelivery)
//                    
//                }header: {
//                    Text("Personal Info")
//                }
                Section {
                    TextField("House Number", text: $houseNumber)
                    TextField("Address", text: $address)
                        .disabled(true)
                    Picker("Address Tag", selection: $addressTag) {
                        Text("Home").tag("Home")
                        Text("Office").tag("Office")
                        Text("Others").tag("Others")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                } header: {
                    Text("My Address")
                }

            }
  
//            // Save Button
//            Button(action: {
//                // Handle save logic
//                address = locationManager.userAddress
//                addressTag = addressTag
//                houseNumber = houseNumber
//                print("Address saved: \(address), \(addressTag), \(houseNumber)")
//            }) {
//                Text("Save Address")
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color.brandPrimary)
//                    .cornerRadius(10)
//            }
//            .padding(.horizontal)
            HStack(spacing: 16) {
                Button(action: {
                    // Handle Update Location logic
                    
                    address = locationManager.userAddress
                    addressTag = addressTag
                    houseNumber = houseNumber
                    print("Location updated to: \(address)")
                }) {
                    Text("Update Location")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                }

                Button(action: {
                    // Handle Save Address logic (e.g., save to a database in the future)
                    print("Address saved: \(address), \(addressTag), \(houseNumber)")
                }) {
                    Text("Save Address")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                }
            }
            .padding(.horizontal)
            .padding(.top, 16)
        }
        .padding()
    }
}

//#Preview {
//    LocationBottomSheet(address: .constant(""), addressTag: .constant("Home"), houseNumber: .constant(""))
//}
