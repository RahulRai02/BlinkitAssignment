//
//  SubProductView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 07/08/24.
//

import SwiftUI

struct SubProductView: View {
    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
        ]
    @State private var selectedCategory: Category? = mockCategories.first
//    @State private var selectedCategory: Category
//    let mockCategories: [Category] = mockCategories
        
    var body: some View {
        VStack {
            NavigationBar()
                .frame(height: UIScreen.main.bounds.height * 0.05)
            GeometryReader{ geometry in
                HStack(spacing:0){
                    ScrollView{
                        VStack(spacing:0){
                            ForEach(mockCategories) { category in
                                CategoriesView(category: category, isSelected: selectedCategory == category)
                                    .onTapGesture {
                                        selectedCategory = category
                                        print(selectedCategory?.products ?? Text("No products"))
                                    }
                            }
                        }

                    }
                    .frame(width: geometry.size.width * 0.15)
                    
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing:0) {
                            if let selectedCategory = selectedCategory{
                                ForEach(selectedCategory.products){ product in
                                    CategoryItemView(product: product)
                                }
                            }
                        }
                        
                    }
                    .frame(width: geometry.size.width * 0.85)
                    
                }
                
            }
        }


    }
}

#Preview {
    SubProductView()
}
