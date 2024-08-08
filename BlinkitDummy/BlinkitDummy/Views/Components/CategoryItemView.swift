//
//  CategoryItemView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 08/08/24.
//

import SwiftUI

struct CategoryItemView: View {
    let product: Product
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.white)
//                .shadow(color: Color.gray.opacity(0.3), radius: 5)
                .aspectRatio(1/1.7, contentMode: .fit) // dynamix height karne ke liye
            //1/1.8 rakha tha pehle
                
            
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
                .overlay(Button{
                    print("Added to Cart")
                }label: {
                    customButton(buttonTitle: "ADD", width: 45, height: 15)
                }, alignment: .bottomTrailing)
                

                HStack {
                    CategoryItemTag(text: product.weight, backgroundColor: Color.lightGrey, textColor: .blue)
                    CategoryItemTag(text: product.tag, backgroundColor: Color.lightGrey, textColor: .blue)
                }

                Text(product.name)
                    .font(.system(size: 14).weight(.medium))

                Text("\(product.deliveryTime) mins")
                    .font(.system(size: 10).weight(.light))
                Text("₹\(product.mrp)")
                    .font(.system(size: 15).weight(.bold))
            }
            .padding()
            .padding(.top, -45)
        }
//        .padding(.vertical, 10)
//        .padding(.horizontal, 5)
    }
}


#Preview {
    CategoryItemView(product: Product(id: UUID(), name: "Maggi Hot and Sweet Tomato Ketchup", image: "maggiHotAndSweetKetchup", weight: "500g", tag: "Chili", deliveryTime: Int.random(in: 10...15), mrp: "115", title: "Maggi Hot and Sweet"))
}
