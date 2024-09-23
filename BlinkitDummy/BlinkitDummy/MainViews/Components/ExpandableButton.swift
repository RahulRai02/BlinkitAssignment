//
//  ExpandableButton.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 24/09/24.
////
//import SwiftUI
//
//struct ExpandableButtonPanel: View {
//    @State private var isExpanded = false
//    @State private var quantity: Int = 0
//    
//    var body: some View {
//        HStack {
//            if isExpanded {
//                // Adjusted width to 120 to ensure enough space for +, -, and quantity
//                customButton(width: 120, height: 40) {
//                    HStack {
//                        // Minus Button
//                        Button(action: {
//                            if quantity > 0 {
//                                quantity -= 1
//                            }
//                            if quantity == 0 {
//                                // Collapse back to "ADD" state
//                                withAnimation {
//                                    isExpanded = false
//                                }
//                            }
//                        }) {
//                            Image(systemName: "minus")
//                                .foregroundColor(.green)
//                                .padding(10)  // Increase padding for larger clickable area
//                        }
//                        .frame(width: 40, height: 40)  // Ensure the button stays within bounds
//
//                        // Quantity Display
//                        Text("\(quantity)")
//                            .font(.caption)
//                            .frame(width: 30)
//                            .foregroundColor(.green)
//
//                        // Plus Button
//                        Button(action: {
//                            quantity += 1
//                            // Add to cart functionality can go here
//                        }) {
//                            Image(systemName: "plus")
//                                .foregroundColor(.green)
//                                .padding(10)  // Increase padding for larger clickable area
//                        }
//                        .frame(width: 40, height: 40)  // Ensure the button stays within bounds
//                    }
//                }
//            } else {
//                // ADD Button (collapsed state)
//                Button(action: {
//                    withAnimation(.easeInOut) {
//                        isExpanded.toggle()
//                        quantity = 1  // Start with quantity 1 when expanded
//                        // Add to cart functionality can go here
//                    }
//                }) {
//                    customButton(width: 80, height: 40) {
//                        Text("ADD")
//                            .font(.caption)
//                            .fontWeight(.medium)
//                            .foregroundColor(.green)
//                    }
//                }
//            }
//        }
//        .padding(10)
//        .background(Color.clear)
//    }
//}
//
//struct ExpandableButton: View {
//    var body: some View {
//        NavigationView {
//            ZStack {
//                List(1...10, id: \.self) { i in
//                    Text("Row \(i)")
//                }
//                
//                VStack {
//                    Spacer()
//                    HStack {
//                        Spacer()
//                        ExpandableButtonPanel()
//                            .padding()
//                    }
//                }
//            }
//        }
//    }
//}
//
////#Preview {
////    ExpandableButton()
////}
//
