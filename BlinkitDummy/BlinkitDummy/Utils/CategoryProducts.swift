//
//  Category.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 11/08/24.
//

import Foundation

struct CategoryReponse: Codable {
    let categories: [Category]
}

struct Category: Codable,Identifiable, Equatable{
    static func == (lhs: Category, rhs: Category) -> Bool {
           return lhs.id == rhs.id
       }
    enum CodingKeys: CodingKey{
        case name
        case image
        case products
    }
    
    var id = UUID()
    let name: String
    let image: String
    let products: [Product]
}

struct Product: Codable, Identifiable, Equatable {
 
    enum CodingKeys: CodingKey{
        case name
        case image
        case weight
        case tag
        case deliveryTime
        case mrp
        case title
    }
    
    let id = UUID()
    let name: String
    let image: String
    let weight: String
    let tag: String
    let deliveryTime: String
    let mrp: String
    let title: String
}
