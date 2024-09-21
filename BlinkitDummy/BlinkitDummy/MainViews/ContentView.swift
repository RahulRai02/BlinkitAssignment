//
//  ContentView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 07/08/24.
//

import SwiftUI

struct ContentView: View {
//    @StateObject var viewModel = SubProductViewModel()
    
    var body: some View {
        TabView {
            CustomNavView {
                ZStack{
                    GroceryView()
                }
                .customNavBarItems(title: "Blinkit in", minutes: "9", address: "136 Sector - 28, Faridabad", backButtonHidden: false, isSurgeApplicable: true)
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            Text("Cart")
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Cart")
                }
            
            AccountScreen()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Account")
                }
        }
    }
}

#Preview {
    ContentView()
}

