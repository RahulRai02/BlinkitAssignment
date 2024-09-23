//
//  OrderView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 22/09/24.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        Text("No orders yet, no items in the cart ")
    }
}

#Preview {
    OrderView()
}
