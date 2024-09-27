//
//  MainNavigationBar.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 21/09/24.
//


import SwiftUI

struct MainNavigationBar: View {
//    @State var isSurgeApplicable: Bool = true;
    
    @State var showLocationSheet: Bool = false
    @State var address: String = ""
    @State var addressTag: String = "Not available, Click to change location"
    @State var houseNumber: String = ""
    
    

    let showBackButton: Bool
    let title: String
    let Minutes: String
    let isSurgeApplicable: Bool
//    @State var showLocationSheet: Bool = false;
//    let showBackButton: Bool
//    let title: String
//    let Minutes: String
//    let address: String
//    let addressTag: String = "Others"
//    let isSurgeApplicable: Bool
//    let showLocationSheet: Bool
    
    
    var body: some View {
            HStack{
                VStack(alignment:.leading){
//                    Text("Blinkit in")
                    Text(title)
                        .font(.caption)
                        .fontWeight(.semibold)
                    HStack{
//                        Text("20 minutes")
                        Text("\(Minutes) minutes")
                            .font(.title)
                            .fontWeight(.heavy)
                        Image(systemName: "bolt.fill")
                    }
                    Button{
                        showLocationSheet.toggle()
                    }label:{
//                        Text("Home - 1353 Sector 28, Faridabad")"
                        Text("\(addressTag) - \(houseNumber), \(address)")
                            .font(.caption.weight(.medium))
                            .lineLimit(1)
                        
                        Image(systemName: "arrowtriangle.down.fill")
                    }
                    .font(.system(size: 14))
                    .foregroundStyle(Color.black)
                }
                Spacer()
                
                NavigationLink{
                    AccountScreen()
                }label:{
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .toolbar(.hidden)
                .foregroundStyle(Color.black)
                
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.pink.opacity(0.3), Color.yellow.opacity(0.3)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .sheet(isPresented: $showLocationSheet, content: {
                LocationBottomSheet(address: $address, addressTag: $addressTag, houseNumber: $houseNumber)
            })
//            .onPreferenceChange(AddressPreferenceKey.self) { newAddress in
//                self.address = newAddress
//            }
    }
}

//#Preview {
//    MainNavigationBar(showBackButton: false, title: "Blinkit in", Minutes: "20", address: "1353 Sector 28, Faridabad", isSurgeApplicable: false)
//}
