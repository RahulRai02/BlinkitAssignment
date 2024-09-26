//
//  CustomTabBarContainerView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 26/09/24.
//

import SwiftUI

// We will be follwing the the way TabView is implemented in apple docs
//struct TabView3<SelectionValue, Content> : View where SelectionValue : Hashable, Content : View {
//
//}


struct CustomTabBarContainerView<Content: View >: View {
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content){
        self._selection = selection         // Referring the binding the actual wrapped value of the selection
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                content
            }
            CustomTabBarView(tabs: tabs, selection: $selection)
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self, perform: { value in
            self.tabs = value
        })
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [
        .home, .cart, .profile
    ]
    
    static var previews: some View{
        CustomTabBarContainerView(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}


