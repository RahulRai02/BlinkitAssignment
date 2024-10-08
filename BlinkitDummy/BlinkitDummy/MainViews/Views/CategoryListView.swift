//
//  CategoryListView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 11/08/24.
//

import SwiftUI

struct CategoryListView: View {
    @ObservedObject var viewModel: SubProductViewModel
    @ObservedObject var scrollViewModel: ScrollViewModel
    @State private var hasAppearedCategory = false
    
    static let leftPanelWidthRatio: CGFloat = 0.15
    
    var body: some View {
        ScrollView{
            VStack(spacing:0){
//                Text("Offset: \(String(format: "%.1f", scrollViewModel.offset.y))")
//                Text("Height: \(String(format: "%.1f", scrollViewModel.totalContentHeight))")
//                Text("VisCont: \(String(format: "%.1f", scrollViewModel.visibleContentHeight))")
//                Text("End offset: \(scrollViewModel.endOffset)")
                ForEach(viewModel.categories, id: \.id) { category in
                    CategoriesView(category: category, isSelected: category == viewModel.selectedCategory)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            viewModel.selectedCategory = category
                        }
                        viewModel.updateIndices()
                    }
//                    .onAppear{
//                        viewModel.selectedCategory = viewModel.categories.first
//                    }
                }
            }
        }
        .onAppear{
            if !hasAppearedCategory{
                viewModel.fetchCategoriesAndProducts()
                hasAppearedCategory = true
            }     
        }
        .frame(width: UIScreen.main.bounds.width * CategoryListView.leftPanelWidthRatio)    // 15 percent criteria
    }
}

