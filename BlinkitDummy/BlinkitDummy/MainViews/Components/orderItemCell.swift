//
//  orderItemCell.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 25/09/24.
//

import SwiftUI

struct orderItemCell: View {
    let product: Product
   
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
                Button{
                    print("Tapped")
                }label: {
                    Text("Save for later")
                        .font(.system(size: 11).weight(.light)).underline()
                        .foregroundStyle(Color.black)
                }
            }
            Spacer()
            VStack{
                Text("₹ \(product.mrp)")
                    .font(.system(size: 15).weight(.semibold))
                Spacer()
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: 40)
        .padding()
    }
}

//#Preview {
//    orderItemCell(product: Product(name: "Veeba Chef Special Tomato Ketchup", image: "veebaKetchup", weight: "500g", tag: "White", deliveryTime: "12", mrp: "100", title: "Veeba Chef Special"))
//}


