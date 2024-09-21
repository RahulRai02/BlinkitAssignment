//
//  CustomNavLink.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 21/09/24.
//


import SwiftUI

// From apple Nav Link API
//struct NavigationLink<Label, Destination> : View where Label : View, Destination : View

struct CustomNavLink<Label: View, Destination: View>: View {
    let destination: Destination
    let label: Label
    
    init(@ViewBuilder destination: () -> Destination, @ViewBuilder label: () -> Label){
        self.destination = destination()
        self.label = label()
    }
    
    var body: some View {
        NavigationLink {
            destination
//            CustomNavBarContainerView {
//                destination
//            }
            .toolbar(.hidden)
        } label: {
            label
        }

    }
}

#Preview {
    CustomNavView {
        CustomNavLink{
            Text("Destination")
        }label:{
            Text("gOTO")
        }
    }

}
