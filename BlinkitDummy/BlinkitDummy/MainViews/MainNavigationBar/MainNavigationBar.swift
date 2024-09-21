//
//  MainNavigationBar.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 21/09/24.
//


import SwiftUI

struct MainNavigationBar: View {
//    @State var isSurgeApplicable: Bool = true;
    @State var showLocationSheet: Bool = false;
    let showBackButton: Bool
    let title: String
    let Minutes: String
    let address: String
    let addressTag: String = "Others"
    let isSurgeApplicable: Bool
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
                        Text("\(addressTag) - \(address)")
                        
                        Image(systemName: "arrowtriangle.down.fill")
                    }
                    .font(.system(size: 14))
                    .foregroundStyle(Color.black)
                }
                Spacer()
                
                NavigationLink{
                    AccountScreen()
                }label:{
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .toolbar(.hidden)
                
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.lightGrey)
            .sheet(isPresented: $showLocationSheet, content: {
                LocationBottomSheet()
            })
    }
}

#Preview {
    MainNavigationBar(showBackButton: false, title: "Blinkit in", Minutes: "20", address: "1353 Sector 28, Faridabad", isSurgeApplicable: false)
}
