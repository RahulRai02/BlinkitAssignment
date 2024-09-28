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
    @State var address: String = "Not Available"
    @State var addressTag: String = "Home"
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
                VStack(alignment:.leading, spacing: 0){
//                    Text("Blinkit in")
                    Text(title)
                        .font(.caption)
                        .fontWeight(.bold)
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
                        HStack(spacing: 4) {
                            Text("\(addressTag): ")
                                .font(.caption.weight(.bold))  // Make the addressTag bold
                            Text(" \(houseNumber) - \(address)")
                                
                                .font(.caption.weight(.medium))
                                .lineLimit(1)
                            Image(systemName: "arrowtriangle.down.fill")
                        }
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
                    gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .sheet(isPresented: $showLocationSheet, content: {
                LocationBottomSheet(address: $address, addressTag: $addressTag, houseNumber: $houseNumber)
                    .presentationBackground(.thinMaterial)
//                    .presentationBackground(alignment: .bottom) {
//                            LinearGradient(colors: [Color.pink, Color.purple], startPoint: .bottomLeading, endPoint: .topTrailing)
//                    }
                    .presentationDetents([.fraction(0.9)])
                    .presentationDragIndicator(.visible)
            })

    }
}

//#Preview {
//    MainNavigationBar(showBackButton: false, title: "Blinkit in", Minutes: "20", address: "1353 Sector 28, Faridabad", isSurgeApplicable: false)
//}
