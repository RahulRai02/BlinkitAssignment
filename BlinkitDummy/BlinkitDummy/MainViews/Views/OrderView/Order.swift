//
//  Order.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 22/09/24.
//

import Foundation

final class Order: ObservableObject {
    @Published var items: [Product] = []
    
    var totalPrice: Double {
        return 100
    }
}
