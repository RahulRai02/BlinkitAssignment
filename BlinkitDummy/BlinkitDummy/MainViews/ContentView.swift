//
//  ContentView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 07/08/24.
//

import SwiftUI

struct ContentView: View {
//    @StateObject var viewModel = SubProductViewModel()
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            CustomNavView {
                ZStack{
                    GroceryView()
                }
                .customNavBarItems(title: "Blinkit in", minutes: "9", address: "136 Sector - 28, Faridabad", backButtonHidden: false, isSurgeApplicable: true)
            }
            .tabBarItem(tab: .home,
                        selection: $tabSelection)

            
            OrderView()
                .tabBarItem(tab: .cart,
                            selection: $tabSelection)
            
            AccountScreen()
                .tabBarItem(tab: .profile,
                            selection: $tabSelection)
        }
        .tint(.green)
        .background(Color.lightGrey)
    }
}

#Preview {
    ContentView()
}

