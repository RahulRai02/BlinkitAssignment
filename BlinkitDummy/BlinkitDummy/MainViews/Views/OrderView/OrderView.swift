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
        ZStack {
            Rectangle()
                .foregroundStyle(Color.brandPrimary.opacity(0.1))
                .ignoresSafeArea()
            VStack{
                GroupBox {
                    ScrollView{
                        if order.items.isEmpty {
                            // Display an image when the cart is empty
                            VStack(alignment:.center){
                                Image(systemName: "cart")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.gray)
                                Text("Your cart is empty")
                                    .font(.title3)
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                        } else {
                            // Display the cart items when there are items in the cart
                            VStack {
                                ForEach(order.items) { product in
                                    orderItemCell(product: product)
                                }
                            }
                        }
                    }
                } label: {
                    Label("Delivery in 12 mins", systemImage: "clock")
                }
            .groupBoxStyle(.orderStyle)
//            .frame(maxWidth: .infinity)
            .padding()
                
                Spacer()
                GroupBox {
                    HStack{
                        VStack{
                            Label("PAY USING", systemImage: "creditcard")
                            
                            Text("Credit Card")
                        }
                        .font(.system(size: 12))
                        .fontWeight(.light)
                        Spacer()
                        
                        Button {
                            print("Order placed")
                        } label: {
                            HStack {
                                VStack{
//                                    Text("₹\(order.totalPrice)")
                                    Text("₹\(order.totalPrice, specifier: "%.2f")")
                                        .font(.system(size: 14))
                                        .fontWeight(.semibold)
                                    Text("TOTAL")
                                        .font(.system(size: 10))
                                        .fontWeight(.light)
                                }
                     
                                Spacer()
                                Text("Place order")
                                Image(systemName: "arrowtriangle.forward.fill")
                                    
                                    
                            }
                            .padding()
                        }
                        .frame(width: 250, height: 50)
                        .background(Color.brandPrimary.cornerRadius(10))
                        .foregroundStyle(Color.white)

                    }
                }
            }

        }
        
    }
}

struct OrderViewGroupBoxStyle: GroupBoxStyle{
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment:.leading){
            configuration.label
                .bold()
                
                .foregroundColor(Color.brandPrimary)
            
            configuration.content
        }
        .padding()
        .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 12))
    }
}

extension GroupBoxStyle where Self == OrderViewGroupBoxStyle {
    static var orderStyle: OrderViewGroupBoxStyle {
        .init()
    }
}



