//
//  Order.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 22/09/24.
//

import Foundation

final class Order: ObservableObject {
    @Published var items: [Product] = []  // List of products in the cart
    @Published var quantities: [Product: Int] = [:]  // Stores quantity for each product
    @Published var expandedStates: [Product: Bool] = [:]  // Stores whether the button is expanded for each product

    
    // Add product to the cart and update its quantity and expanded state
    func addProduct(product: Product) {
        print("Trying to Adddddddd")
        print(product)
        // Check if the product is already in the cart
        if quantities[product] != nil {
            
            print("product already present in cart")
            // Product is already in cart, increase quantity
            quantities[product]! += 1
        } else {
            // Product is not present in the cart, add it and set expanded state to true
            print("product not present in cart")
            items.append(product)  // Add to the cart
            quantities[product] = 1
            expandedStates[product] = true  // Set expanded state to true
        }
    }

    // Remove product from the cart and update its state
    func removeProduct(product: Product) {
        print("Trying to removeeeeeee")
        print(product)
        // Check if the product is in the cart
        if let currentQuantity = quantities[product], currentQuantity > 0 {
            print("product already present in cart")
            // Decrease the quantity
            quantities[product]! -= 1
            
            // If quantity becomes zero, collapse the button and remove the product
            if quantities[product]! == 0 {
                quantities.removeValue(forKey: product)  // Remove from quantities dictionary
                expandedStates.removeValue(forKey: product)  // Remove from expandedStates dictionary

                if let index = items.firstIndex(of: product) {
                    items.remove(at: index)  // Remove product from the cart
                }

            }
        }
    }

    // Helper function to get the current quantity of a product
    func getProductQuantity(product: Product) -> Int {
        return quantities[product] ?? 0
    }

    // Helper function to check if a product's button is expanded
    func isProductExpanded(product: Product) -> Bool {
        return expandedStates[product] ?? false
    }
    
    var totalPrice: Double {
        items.reduce(0) { (total, product) in
            let quantity = quantities[product] ?? 0 // Provide a default of 0 if nil
            let productPrice = Double(product.mrp) ?? 0.0 // Ensure product.mrp can be converted to Double
            return total + (productPrice * Double(quantity))
        }
    }
}
