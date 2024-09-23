//
//  CategoryItemView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 08/08/24.
//

import SwiftUI

struct CategoryItemView: View {
    let product: Product
    @EnvironmentObject var order : Order
    
    @State private var isExpanded = false
    @State private var quantity: Int = 0
    
    func addToCart(){
        order.items.append(product)

    }
    
    func removeFromCart(){
        if let index = order.items.firstIndex(of: product){
            order.items.remove(at: index)
        }
      
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.white)
                .aspectRatio(1/1.7, contentMode: .fit)  // Used aspect ratio because height will vary based on device

            VStack(alignment: .leading, spacing: 2) {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.lightGrey)
                        .frame(height: 150)
                    Image(product.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 120)
                }
                .overlay(
                    HStack {
                        if isExpanded {
                          
                            customButton(width: 70, height: 20) {
                                HStack(spacing: 5) {
                                  
                                    Button(action: {
                                        if quantity > 0 {
                                            quantity -= 1
                                            removeFromCart()
                                            print(order.items)
                                        }
                                        if quantity == 0 {
                                            
                                            withAnimation {
                                                isExpanded = false
                                            }
                                        }
                                    }) {
                                        Image(systemName: "minus")
                                            .foregroundColor(.green)
                                            .frame(width: 15, height: 15)  // Adjusted size for smaller button
                                            .contentShape(Rectangle())
                                    }

                                    // Quantity Display
                                    Text("\(quantity)")
                                        .font(.caption)
                                        .frame(width: 20)
                                        .foregroundColor(.green)

                                    // Plus Button
                                    Button(action: {
                                        quantity += 1
                                        addToCart()
                                        print(order.items)
                                    }) {
                                        Image(systemName: "plus")
                                            .foregroundColor(.green)
                                            .frame(width: 15, height: 15)
                                            .contentShape(Rectangle())
                                    }
                                }
                                .frame(height: 20)
                            }
                        } else {
                            
                            Button(action: {
                                withAnimation(.easeInOut) {
                                    isExpanded = true
                                    quantity = 1
                                    addToCart()
                                    print(order.items)
                                }
                            }) {
                               
                                customButton(width: 60, height: 20) {
                                    Text("ADD")
                                        .font(.caption)
                                        .fontWeight(.medium)
                                        .foregroundColor(.green)
                                }
                            }
                        }
                    }
                    .padding(10)
                    .background(Color.clear),
                    alignment: .bottomTrailing
                )


                HStack {
                    CategoryItemTag(text: product.weight, backgroundColor: Color.lightGrey, textColor: .blue)
                    CategoryItemTag(text: product.tag, backgroundColor: Color.lightGrey, textColor: .blue)
                }

                Text(product.name)
                    .font(.system(size: 14).weight(.medium))
                    .lineLimit(2)
                    .minimumScaleFactor(0.8)

                Text("\(product.deliveryTime) mins")
                    .font(.system(size: 10).weight(.light))
                Text("₹\(product.mrp)")
                    .font(.system(size: 15).weight(.bold))
            }
            .padding()
            .padding(.top, -45)
        }
    }
}

