//
//  CustomTabBarView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 26/09/24.
//

import SwiftUI

struct CustomTabBarView: View {
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    
    var body: some View {
        HStack{
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        
        
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [
        .home, .cart, .profile
    ]
    
    static var previews: some View{
        VStack{
            Spacer()
        CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!))
        }
    }
}

extension CustomTabBarView {
    private func tabView(tab: TabBarItem) -> some View {
        VStack{
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(selection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(selection == tab ? tab.color.opacity(0.2) : Color.clear)
        .cornerRadius(10)
    }
    
    private func switchToTab(tab: TabBarItem){
        withAnimation(.easeInOut){
            selection = tab
        }
    }
}


