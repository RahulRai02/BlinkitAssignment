//
//  CustomNavBarContainerView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 21/09/24.
//


import SwiftUI

struct CustomNavBarContainerView<Content: View> : View {
    let content: Content
    
    @State private var showBackButton: Bool = true
    @State private var title: String = ""
    @State private var minutes: String = ""
    @State private var address: String = ""
    @State private var isSurgeApplicable: Bool = false
    
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0){
           MainNavigationBar(showBackButton: showBackButton, title: title, Minutes: minutes, address: address, isSurgeApplicable: true)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self, perform: { value in
            self.title = value
        })
        .onPreferenceChange(CustomNavBarMinutesPreferenceKey.self, perform: { value in
            self.minutes = value
        })
        .onPreferenceChange(CustomNavBarAddressPreferenceKey.self, perform: { value in
            self.address = value
        })
        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKey.self, perform: { value in
            self.showBackButton = !value
        })
        .onPreferenceChange(CustomNavBarSurgePreferenceKey.self, perform: { value in
            self.isSurgeApplicable = value
        })
    }
}

#Preview {
    CustomNavBarContainerView{
        ZStack{
            Color.orange.ignoresSafeArea()
            Text("hello world")
                .foregroundStyle(Color.white)
        }
    }
}
