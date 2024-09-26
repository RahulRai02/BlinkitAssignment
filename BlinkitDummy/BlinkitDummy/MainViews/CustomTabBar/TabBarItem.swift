//
//  TabBarItem.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 26/09/24.
//


import Foundation
import SwiftUI
//
//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}

enum TabBarItem: Hashable {
    case home, cart, profile
    
    var iconName: String {
        switch self {
        case .home:
            return "house.fill"
        case .cart:
            return "cart.fill"
        case .profile:
            return "person.fill"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .cart:
            return "Order"
        case .profile:
            return "Profile"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
            return Color.red
        case .cart:
            return Color.green
        case .profile:
            return Color.blue
        }
    }
}

//
//static let tabs: [TabBarItem] = [
//    TabBarItem(iconName: "house", title: "Home", color: Color.red),
//    TabBarItem(iconName: "heart", title: "Favorites", color: Color.green),
//    TabBarItem(iconName: "person", title: "Profile", color: Color.blue)
//]
