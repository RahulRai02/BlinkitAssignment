import Foundation
import SwiftUI

struct Category: Identifiable, Equatable {
    static func == (lhs: Category, rhs: Category) -> Bool {
           return lhs.id == rhs.id
       }
    
    let id: UUID
    let name: String
    let image: String // Local image name for the category
    let products: [Product]
}

struct Product: Identifiable {
    let id: UUID
    let name: String
    let image: String // Local image name
    let weight: String // e.g., "500g", "200ml"
    let tag: String
    let deliveryTime: Int // Random value between 10 and 15
    let mrp: String // Maximum Retail Price
    let title: String // A title for the product
}

let mockCategories: [Category] = [
    Category(id: UUID(), name: "Tomato Ketchup", image: "ketchup", products: [
        Product(id: UUID(), name: "Veeba Chef Special Tomato Ketchup", image: "veebaKetchup", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "100", title: "Veeba Chef Special"),
        Product(id: UUID(), name: "Kissan Fresh Tomato Ketchup", image: "kissanKetchup", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "95", title: "Kissan Fresh"),
        Product(id: UUID(), name: "Maggi Tomato Ketchup", image: "maggiKetchup", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "110", title: "Maggi Tomato"),
        Product(id: UUID(), name: "Maggi Hot and Sweet Tomato Ketchup", image: "maggiHotAndSweetKetchup", weight: "500g", tag: "Chili", deliveryTime: Int.random(in: 10...15), mrp: "115", title: "Maggi Hot and Sweet"),
        Product(id: UUID(), name: "Habenoro Hot Chilli Sauce", image: "habenaroKetchup", weight: "250ml", tag: "Chili", deliveryTime: Int.random(in: 10...15), mrp: "130", title: "Habenoro Hot Chilli")
    ]),
    Category(id: UUID(), name: "Asian Sauces", image: "asianSauceRealThaiCurry", products: [
        Product(id: UUID(), name: "Veeba Wok Tok Red Chilli Sauce", image: "asianSauceVeebaWokTok", weight: "250ml", tag: "Chili", deliveryTime: Int.random(in: 10...15), mrp: "140", title: "Veeba Wok Tok"),
        Product(id: UUID(), name: "Tops Premium Synthetic Vinegar", image: "asianSauceTopsVinegar", weight: "500ml", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "60", title: "Tops Premium Vinegar"),
        Product(id: UUID(), name: "Real Thai Red Curry Paste", image: "asianSauceRealThaiCurry", weight: "200g", tag: "Curry paste", deliveryTime: Int.random(in: 10...15), mrp: "180", title: "Real Thai Red Curry"),
        Product(id: UUID(), name: "Veeba Wok Tok Red Chilli Sauce", image: "asianSauceVeebaWokTok", weight: "250ml", tag: "Chili", deliveryTime: Int.random(in: 10...15), mrp: "140", title: "Veeba Wok Tok") // Repeated product
    ]),
    Category(id: UUID(), name: "Mayonnaise", image: "mayoOethkar", products: [
        Product(id: UUID(), name: "Hellmann's Real Mayonnaise", image: "mayoHellman", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "120", title: "Hellmann's Real"),
        Product(id: UUID(), name: "Kraft Classic Mayonnaise", image: "mayoVeeba", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "110", title: "Kraft Classic"),
        Product(id: UUID(), name: "Eggless Mayonnaise", image: "mayoOethkar", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "130", title: "Eggless Mayonnaise"),
        Product(id: UUID(), name: "Organic Mayonnaise", image: "mayoVeeba", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "150", title: "Organic Mayonnaise")
    ]),
    Category(id: UUID(), name: "Tomato Ketchup", image: "ketchup", products: [
        Product(id: UUID(), name: "Veeba Chef Special Tomato Ketchup", image: "veebaKetchup", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "100", title: "Veeba Chef Special"),
        Product(id: UUID(), name: "Kissan Fresh Tomato Ketchup", image: "kissanKetchup", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "95", title: "Kissan Fresh"),
        Product(id: UUID(), name: "Maggi Tomato Ketchup", image: "maggiKetchup", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "110", title: "Maggi Tomato"),
        Product(id: UUID(), name: "Maggi Hot and Sweet Tomato Ketchup", image: "maggiHotAndSweetKetchup", weight: "500g", tag: "Chili", deliveryTime: Int.random(in: 10...15), mrp: "115", title: "Maggi Hot and Sweet"),
        Product(id: UUID(), name: "Habenoro Hot Chilli Sauce", image: "habenaroKetchup", weight: "250ml", tag: "Chili", deliveryTime: Int.random(in: 10...15), mrp: "130", title: "Habenoro Hot Chilli")
    ]),
    Category(id: UUID(), name: "Asian Sauces", image: "asianSauceRealThaiCurry", products: [
        Product(id: UUID(), name: "Veeba Wok Tok Red Chilli Sauce", image: "asianSauceVeebaWokTok", weight: "250ml", tag: "Chili", deliveryTime: Int.random(in: 10...15), mrp: "140", title: "Veeba Wok Tok"),
        Product(id: UUID(), name: "Tops Premium Synthetic Vinegar", image: "asianSauceTopsVinegar", weight: "500ml", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "60", title: "Tops Premium Vinegar"),
        Product(id: UUID(), name: "Real Thai Red Curry Paste", image: "asianSauceRealThaiCurry", weight: "200g", tag: "Curry paste", deliveryTime: Int.random(in: 10...15), mrp: "180", title: "Real Thai Red Curry"),
        Product(id: UUID(), name: "Veeba Wok Tok Red Chilli Sauce", image: "asianSauceVeebaWokTok", weight: "250ml", tag: "Chili", deliveryTime: Int.random(in: 10...15), mrp: "140", title: "Veeba Wok Tok") // Repeated product
    ]),
    Category(id: UUID(), name: "Mayonnaise", image: "mayoOethkar", products: [
        Product(id: UUID(), name: "Hellmann's Real Mayonnaise", image: "mayoHellman", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "120", title: "Hellmann's Real"),
        Product(id: UUID(), name: "Kraft Classic Mayonnaise", image: "mayoVeeba", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "110", title: "Kraft Classic"),
        Product(id: UUID(), name: "Eggless Mayonnaise", image: "mayoOethkar", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "130", title: "Eggless Mayonnaise"),
        Product(id: UUID(), name: "Organic Mayonnaise", image: "mayoVeeba", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "150", title: "Organic Mayonnaise")
    ]),
    Category(id: UUID(), name: "Tomato Ketchup", image: "ketchup", products: [
        Product(id: UUID(), name: "Veeba Chef Special Tomato Ketchup", image: "veebaKetchup", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "100", title: "Veeba Chef Special"),
        Product(id: UUID(), name: "Kissan Fresh Tomato Ketchup", image: "kissanKetchup", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "95", title: "Kissan Fresh"),
        Product(id: UUID(), name: "Maggi Tomato Ketchup", image: "maggiKetchup", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "110", title: "Maggi Tomato"),
        Product(id: UUID(), name: "Maggi Hot and Sweet Tomato Ketchup", image: "maggiHotAndSweetKetchup", weight: "500g", tag: "Chili", deliveryTime: Int.random(in: 10...15), mrp: "115", title: "Maggi Hot and Sweet"),
        Product(id: UUID(), name: "Habenoro Hot Chilli Sauce", image: "habenaroKetchup", weight: "250ml", tag: "Chili", deliveryTime: Int.random(in: 10...15), mrp: "130", title: "Habenoro Hot Chilli")
    ]),
    Category(id: UUID(), name: "Asian Sauces", image: "asianSauceRealThaiCurry", products: [
        Product(id: UUID(), name: "Veeba Wok Tok Red Chilli Sauce", image: "asianSauceVeebaWokTok", weight: "250ml", tag: "Chili", deliveryTime: Int.random(in: 10...15), mrp: "140", title: "Veeba Wok Tok"),
        Product(id: UUID(), name: "Tops Premium Synthetic Vinegar", image: "asianSauceTopsVinegar", weight: "500ml", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "60", title: "Tops Premium Vinegar"),
        Product(id: UUID(), name: "Real Thai Red Curry Paste", image: "asianSauceRealThaiCurry", weight: "200g", tag: "Curry paste", deliveryTime: Int.random(in: 10...15), mrp: "180", title: "Real Thai Red Curry"),
        Product(id: UUID(), name: "Veeba Wok Tok Red Chilli Sauce", image: "asianSauceVeebaWokTok", weight: "250ml", tag: "Chili", deliveryTime: Int.random(in: 10...15), mrp: "140", title: "Veeba Wok Tok") // Repeated product
    ]),
    Category(id: UUID(), name: "Mayonnaise", image: "mayoOethkar", products: [
        Product(id: UUID(), name: "Hellmann's Real Mayonnaise", image: "mayoHellman", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "120", title: "Hellmann's Real"),
        Product(id: UUID(), name: "Kraft Classic Mayonnaise", image: "mayoVeeba", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "110", title: "Kraft Classic"),
        Product(id: UUID(), name: "Eggless Mayonnaise", image: "mayoOethkar", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "130", title: "Eggless Mayonnaise"),
        Product(id: UUID(), name: "Organic Mayonnaise", image: "mayoVeeba", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "150", title: "Organic Mayonnaise")
    ]),
    Category(id: UUID(), name: "Tomato Ketchup", image: "ketchup", products: [
        Product(id: UUID(), name: "Veeba Chef Special Tomato Ketchup", image: "veebaKetchup", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "100", title: "Veeba Chef Special"),
        Product(id: UUID(), name: "Kissan Fresh Tomato Ketchup", image: "kissanKetchup", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "95", title: "Kissan Fresh"),
        Product(id: UUID(), name: "Maggi Tomato Ketchup", image: "maggiKetchup", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "110", title: "Maggi Tomato"),
        Product(id: UUID(), name: "Maggi Hot and Sweet Tomato Ketchup", image: "maggiHotAndSweetKetchup", weight: "500g", tag: "Chili", deliveryTime: Int.random(in: 10...15), mrp: "115", title: "Maggi Hot and Sweet"),
        Product(id: UUID(), name: "Habenoro Hot Chilli Sauce", image: "habenaroKetchup", weight: "250ml", tag: "Chili", deliveryTime: Int.random(in: 10...15), mrp: "130", title: "Habenoro Hot Chilli")
    ]),
    Category(id: UUID(), name: "Asian Sauces", image: "asianSauceRealThaiCurry", products: [
        Product(id: UUID(), name: "Veeba Wok Tok Red Chilli Sauce", image: "asianSauceVeebaWokTok", weight: "250ml", tag: "Chili", deliveryTime: Int.random(in: 10...15), mrp: "140", title: "Veeba Wok Tok"),
        Product(id: UUID(), name: "Tops Premium Synthetic Vinegar", image: "asianSauceTopsVinegar", weight: "500ml", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "60", title: "Tops Premium Vinegar"),
        Product(id: UUID(), name: "Real Thai Red Curry Paste", image: "asianSauceRealThaiCurry", weight: "200g", tag: "Curry paste", deliveryTime: Int.random(in: 10...15), mrp: "180", title: "Real Thai Red Curry"),
        Product(id: UUID(), name: "Veeba Wok Tok Red Chilli Sauce", image: "asianSauceVeebaWokTok", weight: "250ml", tag: "Chili", deliveryTime: Int.random(in: 10...15), mrp: "140", title: "Veeba Wok Tok") // Repeated product
    ]),
    Category(id: UUID(), name: "Mayonnaise", image: "mayoOethkar", products: [
        Product(id: UUID(), name: "Hellmann's Real Mayonnaise", image: "mayoHellman", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "120", title: "Hellmann's Real"),
        Product(id: UUID(), name: "Kraft Classic Mayonnaise", image: "mayoVeeba", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "110", title: "Kraft Classic"),
        Product(id: UUID(), name: "Eggless Mayonnaise", image: "mayoOethkar", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "130", title: "Eggless Mayonnaise"),
        Product(id: UUID(), name: "Organic Mayonnaise", image: "mayoVeeba", weight: "500g", tag: "White", deliveryTime: Int.random(in: 10...15), mrp: "150", title: "Organic Mayonnaise")
    ])
    
    
]
