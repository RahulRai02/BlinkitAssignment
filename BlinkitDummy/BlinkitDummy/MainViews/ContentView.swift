//
//  ContentView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 07/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            NavigationLink{
                SubProductView()
                    .navigationBarBackButtonHidden(true)
            }label: {
                Text("Sauces & Spreads")
            }
        }
    }
}

#Preview {
    ContentView()
}
