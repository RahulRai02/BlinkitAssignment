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
//        CategoryItem(category:  category)
        VStack(spacing:0) {
            Image(category.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .padding()

            Text(category.name)
                .font(.system(size: 11).weight(.medium))
                .lineLimit(2)
                .minimumScaleFactor(0.8)
        }
        .frame(width: 100, height: 120)
    }
}
let columns = [
    GridItem(.flexible(), spacing: 0),
    GridItem(.flexible(), spacing: 0),
    GridItem(.flexible(), spacing: 0),
    GridItem(.flexible(), spacing: 0)
]

struct CategorySection: View {
    var headerTitle: String
    var categories: [Category] // Use the Category model
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(headerTitle)
                .font(.headline)
                .fontWeight(.bold)
                .padding(.leading, 16)
            
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(categories) { category in
//                    CategoryItem(category: category)
                    CustomNavLink {
                        SubProductView()
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

    
    var body: some View {
        ScrollView{
            VStack(spacing: 5) {
                ForEach(viewModel.categories){ category in
                    CategorySection(headerTitle: category.name, categories: viewModel.categories)
                }
//                CategorySection(headerTitle: "Grocery & Kitchen", categories: [Category(name: "Sauces & Spreads", image: "ketchup", products: [])])
//                                
//            
                }
            .padding(.top, 16)
            .onAppear{
                viewModel.fetchCategoriesAndProducts()
            }
            .padding(.top, 16)
        }
    }
}

//#Preview {
//    GroceryView
//}
