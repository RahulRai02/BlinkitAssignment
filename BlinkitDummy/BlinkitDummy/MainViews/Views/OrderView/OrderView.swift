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
                .foregroundStyle(.lightGrey.gradient.opacity(0.8))
                .ignoresSafeArea()
            VStack{
                GroupBox {
                    List{
                        VStack{
                            ForEach(order.items){ product in
                                orderItemCell(product: product)
                                    .overlay(AddRemoveFromCartButton(product: product), alignment: .bottomTrailing)
                                    
                            }
                        }
                        .listRowInsets(EdgeInsets())
                    }
                    .listStyle(PlainListStyle())
                    .frame(height: CGFloat(order.items.count) * CGFloat(80))
                    
                } label: {
                    Label("Delivery in 12 mins", systemImage: "clock")
                }
            .groupBoxStyle(.orderStyle)
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



