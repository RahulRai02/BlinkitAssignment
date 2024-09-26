//
//  BlinkitDummyApp.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 07/08/24.
//

import SwiftUI

@main
struct BlinkitDummyApp: App {
//    @StateObject var viewModel = SubProductViewModel()
//    var order =  Order()
    @StateObject private var order = Order()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
               
        }
    }
}
