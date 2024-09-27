//
//  orderItemCell.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 25/09/24.
//

import SwiftUI

struct orderItemCell: View {
    let product: Product
    @EnvironmentObject var order: Order
   
    var body: some View {
        HStack{
            RectangleImageCell(categoryOrProductImage: "\(product.image)")
            VStack(alignment: .leading){
                Text("\(product.name)")
                    .font(.system(size: 14).weight(.medium))
                    .lineLimit(2)
                    .minimumScaleFactor(0.8)
                Text("\(product.weight)")
                    .font(.system(size: 10).weight(.light))
                
//                Button {
//                    
//                } label: {
//                    Text("Save to later")
//                        .font(.system(size: 12).weight(.light)).underline()
//                }

            }
            Spacer()
            VStack{
                Text("₹ \(product.mrp)")
                    .font(.system(size: 15).weight(.semibold))
                Spacer()
                AddRemoveFromCartButton(product: product)
            }

        }

        .frame(maxWidth: .infinity, maxHeight: 40)
        .padding()
    }
}

//#Preview {
//    orderItemCell(product: Product(name: "Veeba Chef Special Tomato Ketchup", image: "veebaKetchup", weight: "500g", tag: "White", deliveryTime: "12", mrp: "100", title: "Veeba Chef Special"))
//}


