//
//  LocationBottomSheet.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 21/09/24.
//



import SwiftUI

struct LocationBottomSheet: View {
    @StateObject private var locationManager = LocationManager()
    
    @Binding var address: String
    @Binding var addressTag: String 
    @Binding var houseNumber: String
    @Environment(\.dismiss) var dismiss
    
    

    var body: some View {
        ScrollView{
            VStack(spacing: 16) {
                // Status Header
                GroupBox {
                    HStack{
                        Text(locationManager.isLocationEnabled ? "Location is enabled now! 😊" : "Location is not enabled. Enable for current location.")
                            .font(.headline)
                            .foregroundColor(locationManager.isLocationEnabled ? .brandPrimary : .red)
                            .animation(.easeInOut, value: locationManager.isLocationEnabled)
                        Spacer()
                        Button(action: {
                            if !locationManager.isLocationEnabled {
                                locationManager.checkLocationAuthorization()
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // Adjust delay as needed
                                    self.address = locationManager.userAddress // Autofill the address
                                    self.locationManager.isLocationEnabled = true // Update the location status
                                }
                            }
                        }) {
                            Text(locationManager.isLocationEnabled ? "Enabled" : "Enable")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(locationManager.isLocationEnabled ? Color.brandPrimary : Color.blue)
                                .cornerRadius(8)
                        }
                    }
                }
                //                .padding()
                //                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
                // Map View
                MapView()
                    .frame(height: 300) // Set a height for the map
                    .cornerRadius(10)
                    .shadow(radius: 5)
                
                GroupBox {
                    VStack{
                        TextField("Your current location address", text: $address)
                            .font(.system(size: 13).weight(.medium))
                            .lineLimit(2)
                            .frame(alignment: .center)
                        
                        
                        TextField("Enter your house number", text: $houseNumber)
                            .padding(.vertical, 8) // Adjust vertical padding as needed
                            .padding(.horizontal, 12) // Horizontal padding
                            .background(Color.lightGrey)
                            .cornerRadius(10)
                            .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 5)
                            .frame(height: 40)
                        
                        Picker("Address Tag", selection: $addressTag) {
                            Text("HOME").tag("Home")
                            Text("OFFICE").tag("Office")
                            Text("OTHERS").tag("Others")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .background(Color.lightGrey)
                        .cornerRadius(10)
                        
                        Button(action: {
                            dismiss()
                        }) {
                            Text("Use this Location to browse app")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(height: 40)
                                .frame(maxWidth: .infinity)
                                .background(Color.brandPrimary)
//                                .gradientBackground()
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                        
                    }
                }label: {
                    Label("Current Location", systemImage: locationManager.isLocationEnabled ? "pin" : "pin.slash")
                        .animation(.easeInOut, value: locationManager.isLocationEnabled)
                }
                
                NavigationLink {
                    AccountScreen(gpsAddress: address)
                } label: {
                    HStack{
                        Text("Add or View saved addresses...")
                        Spacer()
                        Image(systemName: "arrowtriangle.forward.fill")
                    }
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.black)
                    .padding()
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .background(Color.lightGrey)
//                                .gradientBackground()
                    .cornerRadius(10)
                    
                }

                
            }
            .padding()
        }


    }
        
    
}

//#Preview {
//    LocationBottomSheet(address: .constant(""), addressTag: .constant("Home"), houseNumber: .constant(""))
//}

extension View {
    func gradientBackground() -> some View {
        self.background(
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
    }
}
