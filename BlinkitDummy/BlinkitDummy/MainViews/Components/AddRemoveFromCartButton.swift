//
//  AddRemoveFromCartButton.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 25/09/24.
//

import SwiftUI

struct AddRemoveFromCartButton: View {
    @EnvironmentObject var order : Order
    var product: Product
    
    var body: some View {
        HStack {
            if order.isProductExpanded(product: product) {
//                customButton(width: 70, height: 20) {
                    HStack(spacing: 5) {
                        Button(action: {
                            if order.getProductQuantity(product: product) > 0 {
                                order.removeProduct(product: product)
                                print(order.items)
                            }
                        }) {
                            Image(systemName: "minus")
                                .foregroundColor(.white)
                                .frame(width: 15, height: 15)  // Adjusted size for smaller button
                                .contentShape(Rectangle())
                        }

                        // Quantity Display
                        Text("\(order.getProductQuantity(product: product))")
                            .font(.caption)
                            .frame(width: 20)
                            .foregroundColor(.white)

                        // Plus Button
                        Button(action: {
                            order.addProduct(product: product)
                            print(order.items)
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .frame(width: 15, height: 15)
                                .contentShape(Rectangle())
                        }
                    }
                    .frame(width: 70, height: 20)
//                    .background(Color.green)
                    .background(Color.brandPrimary.cornerRadius(5))
                
            } else {
                Button(action: {
                    withAnimation(.easeInOut) {
                        order.addProduct(product: product)
                        print(order.items)
                    }
                }) {
                    customButton(width: 60, height: 20) {
                        Text("ADD")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(.brandPrimary)
                    }
                }
            }
        }
        .padding(10)

    }
}

//#Preview {
//    AddRemoveFromCartButton(, product: )
//}
