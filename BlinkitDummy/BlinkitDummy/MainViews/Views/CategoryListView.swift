//
//  CategoryListView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 11/08/24.
//

import SwiftUI

struct CategoryListView: View {
    @ObservedObject var viewModel: SubProductViewModel
    static let leftPanelWidthRatio: CGFloat = 0.15
    
    var body: some View {
        ScrollView{
            VStack(spacing:0){
//              Text("Offset: \(String(format: "%.1f", scrollViewModel.offset.y))")
//              Text("Height: \(String(format: "%.1f", scrollViewModel.contentHeight))")
//              Text("VisCont: \(String(format: "%.1f", scrollViewModel.visibleContentHeight))")
                ForEach(viewModel.categories, id: \.id) { category in
                    CategoriesView(category: category, isSelected: category == viewModel.selectedCategory)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            viewModel.selectedCategory = category
                        }
                        viewModel.updateIndices()
                    }
                    .onAppear{
                        viewModel.selectedCategory = viewModel.categories.first
                    }
                }
            }
        }
        .onAppear{
            viewModel.fetchCategoriesAndProducts()
        }
        .frame(width: UIScreen.main.bounds.width * CategoryListView.leftPanelWidthRatio)    // 15 percent criteria
    }
}

