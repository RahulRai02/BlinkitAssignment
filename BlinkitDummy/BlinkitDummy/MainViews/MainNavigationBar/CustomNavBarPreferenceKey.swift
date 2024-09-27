//
//  CustomNavBarPreferenceKey.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 21/09/24.
//


import Foundation
import SwiftUI

struct CustomNavBarBackButtonHiddenPreferenceKey: PreferenceKey {
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

struct CustomNavBarTitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

struct CustomNavBarMinutesPreferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

//struct CustomNavBarAddressPreferenceKey: PreferenceKey {
//    static var defaultValue: String = ""
//    
//    static func reduce(value: inout String, nextValue: () -> String) {
//        value = nextValue()
//    }
//}

struct CustomNavBarSurgePreferenceKey: PreferenceKey {
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}


extension View {
    func customNavigationBarBackButtonHidden(_ hidden: Bool) -> some View {
        self
            .preference(key: CustomNavBarBackButtonHiddenPreferenceKey.self, value: hidden)
    }
    
    func customNavigationTitle(_ title: String) -> some View {
        self
            .preference(key: CustomNavBarTitlePreferenceKey.self, value: title)
    }
    
    func customNavigationMinutes(_ minutes: String) -> some View {
        self
            .preference(key: CustomNavBarMinutesPreferenceKey.self, value: minutes)
    }
    
//    func customNavigationAddress(_ address: String) -> some View {
//        self
//            .preference(key: CustomNavBarAddressPreferenceKey.self, value: address)
//    }

    func customNavigationSurge(_ isSurgeApplicable: Bool) -> some View {
        self
            .preference(key: CustomNavBarSurgePreferenceKey.self, value: isSurgeApplicable)
    }
    
    func customNavBarItems(title: String = "", minutes: String = "NA", address: String = "" , backButtonHidden: Bool = false, isSurgeApplicable: Bool = false) -> some View {
        self
            .customNavigationTitle(title)
            .customNavigationMinutes(minutes)
//            .customNavigationAddress(address)
            .customNavigationBarBackButtonHidden(backButtonHidden)
            .customNavigationSurge(isSurgeApplicable)
    }
    
}
