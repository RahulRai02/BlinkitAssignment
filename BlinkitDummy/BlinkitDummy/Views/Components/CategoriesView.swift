//
//  CategoriesView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 07/08/24.
//

import SwiftUI

struct CategoriesView: View {
    let category: Category
    let isSelected: Bool
    
    var body: some View {

        VStack{
            Image(category.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            Text(category.name)
                .font(.caption.weight(.light))
                .multilineTextAlignment(.center)
                .lineLimit(3)
                .frame(maxWidth: 70)
                .padding(.bottom,5)
        }
        .frame(width: 70, height: 90)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(5)
        
//        .background(Color.gray)
    }
}


#Preview {
    CategoriesView(category:     Category(id: UUID(), name: "Tomato Ketchup", image: "ketchup", products: [
        Product(id: UUID(), name: "Veeba Chef Special Tomato Ketchup", image: "veebaKetchup", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "100", title: "Veeba Chef Special"),
        Product(id: UUID(), name: "Kissan Fresh Tomato Ketchup", image: "kissanKetchup", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "95", title: "Kissan Fresh"),
        Product(id: UUID(), name: "Maggi Tomato Ketchup", image: "maggiKetchup", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "110", title: "Maggi Tomato"),
        Product(id: UUID(), name: "Maggi Hot and Sweet Tomato Ketchup", image: "maggiHotAndSweetKetchup", weight: "500g", tag: "Chili", deliveryTime: Int.random(in: 10...15), mrp: "115", title: "Maggi Hot and Sweet"),
        Product(id: UUID(), name: "Habenoro Hot Chilli Sauce", image: "habenaroKetchup", weight: "250ml", tag: "Chili", deliveryTime: Int.random(in: 10...15), mrp: "130", title: "Habenoro Hot Chilli")
    ]), isSelected: true)
}
