//
//  ContentView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 07/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomNavView {
            ZStack{
                CustomNavLink {
                    SubProductView()
                } label: {
                    Text("Sauces & Spreads")
                }

            }
            .customNavBarItems(title: "Blinkit in", minutes: "9", address: "136 Sector - 28, Faridabad", backButtonHidden: false, isSurgeApplicable: true)
        }
//        NavigationView{
//            NavigationLink{
//                SubProductView()
//                    .navigationBarBackButtonHidden(true)
//            }label: {
//                Text("Sauces & Spreads")
//            }
//        }
        

    }
}

#Preview {
    ContentView()
}
