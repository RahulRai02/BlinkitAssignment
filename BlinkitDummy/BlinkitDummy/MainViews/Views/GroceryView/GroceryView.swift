//
//  GroceryView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 21/09/24.
//

import SwiftUI

struct CategoryItem: View {
    var category: Category
    
    
    var body: some View {
        VStack(spacing: 2) {
            RectangleImageCell(categoryOrProductImage: category.image)
            Text(category.name)
                .font(.system(size: 12).weight(.semibold))
//                .lineLimit(2)
//                .minimumScaleFactor(1)
                .foregroundStyle(Color.black)
        }
        .padding()
//        .padding(.top, -45)
    }
}

let columns = [
    GridItem(.flexible(), spacing: 0),
    GridItem(.flexible(), spacing: 0),
    GridItem(.flexible(), spacing: 0),
    GridItem(.flexible(), spacing: 0)
]

struct CategorySection: View {
    var navTitle: String
    var categories: [Category] // Use the Category model
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(navTitle)
                .font(.headline)
                .fontWeight(.bold)
                .padding(.leading, 16)
            
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(categories) { category in
                    CustomNavLink {
                        SubProductView(navTitle: category.name)
                    } label: {
                        CategoryItem(category: category)
                    }


                }
                
                
            }
            .padding(.horizontal)
        }
    }
}
struct GroceryView: View {
    @StateObject var viewModel = GroceryViewModel()
    @State private var isFirstTimeAppearance = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 5) {
                    ForEach(viewModel.categories){ category in
                        CategorySection(navTitle: "Sauces & Spreads", categories: viewModel.categories)
                    }
//                
//                CategorySection(navTitle: "Snacks & Drinks", categories: [Category(name: "Tomato Ketchup", image: "ketchup", products: []),
//                                                                         Category(name: "Asian Sauces", image: "asianSauceRealThaiCurry", products: []),
//                                                                         Category(name: "Mayonnaise", image: "mayoOethkar", products: [])])
                }
            .padding(.top, 16)
            .onAppear{
                if !isFirstTimeAppearance{
                    viewModel.fetchCategoriesAndProducts()
                    isFirstTimeAppearance = true

                }
                
            }
            .padding(.top, 16)
        }
    }


}

//#Preview {
//    GroceryView
//}
