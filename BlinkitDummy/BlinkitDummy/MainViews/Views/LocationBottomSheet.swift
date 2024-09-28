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
    
//    @Binding var firstNameforDelivery: String
//    @Binding var lastNameforDelivery: String
//    @Binding var emailforDelivery: String
    
    
    @State private var isLocationEnabled: Bool = false

    var body: some View {
        ScrollView{
            VStack(spacing: 16) {
                // Status Header
                GroupBox {
                    HStack{
                        Text(isLocationEnabled ? "Location is enabled now! 😊" : "Location is not enabled. Enable for current location.")
                            .font(.headline)
                            .foregroundColor(isLocationEnabled ? .brandPrimary : .red)
                            .animation(.easeInOut, value: isLocationEnabled)
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
                        Button(action: {
                            // Handle dismiss sheet logic
                            dismiss()

                        }) {
                            Text("Use this Location")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.brandPrimary)
//                                .gradientBackground()
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    }
                }label: {
                    Label("Current Location", systemImage: isLocationEnabled ? "pin" : "pin.slash")
                        .animation(.easeInOut, value: isLocationEnabled)
                }
                GroupBox{
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("House Number")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            TextField("Enter your house number", text: $houseNumber)
                                .padding()
                                .background(Color.lightGrey)
                            //                            .gradientBackground()
                                .cornerRadius(10)
                                .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 5)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Address")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            TextField("Your address will appear here", text: $address)
                                .disabled(true)
                                .padding()
                            //                            .background(Color.white)
                                .background(Color.lightGrey)
                            //                            .gradientBackground()
                                .cornerRadius(10)
                                .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 5)
                        }
                        
                        
//                        VStack(alignment: .leading, spacing: 5) {
//                            Text("Address Tag")
//                                .font(.headline)
//                                .foregroundColor(.secondary)
                            Picker("Address Tag", selection: $addressTag) {
                                Text("HOME").tag("Home")
                                Text("OFFICE").tag("Office")
                                Text("OTHERS").tag("Others")
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            //                        .padding()
                            //                        .background(Color.white)
                            .background(Color.lightGrey)
//                            .gradientBackground()
                            .cornerRadius(10)

//                        }
                        Button(action: {
                            // Save address logic
                            print("Saving data")
                        }) {
                            Text("Save address")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.brandPrimary)
//                                .gradientBackground()
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                        
                    }
                }label: {
                    Label("My Address", systemImage: "house")
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
