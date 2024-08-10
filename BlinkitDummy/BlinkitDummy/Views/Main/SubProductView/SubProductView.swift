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
    
    @StateObject var viewModel = SubProductViewModel()
    @StateObject private var scrollViewModel = ScrollViewModel()

    var body: some View {
        VStack {
            NavigationBar()
                .frame(height: UIScreen.main.bounds.height * 0.05)
                
            HStack(spacing:0){
                    ScrollView{
                        VStack(spacing:0){
//                            Text("Offset: \(String(format: "%.1f", scrollViewModel.offset.y))")
//                            Text("Height: \(String(format: "%.1f", scrollViewModel.contentHeight))")
//                            Text("VisCont: \(String(format: "%.1f", scrollViewModel.visibleContentHeight))")
                            ForEach(viewModel.categories, id: \.id) { category in
                                // Display category fetched in the scrollView
                                // isSelected for detecting which category item is selected
                                CategoriesView(category: category, isSelected: category == viewModel.selectedCategory)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        viewModel.selectedCategory = category
                                    }
                                    updateIndices()
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
                .frame(width: UIScreen.main.bounds.width * 0.15)
                
                ScrollViewReader{ scrollProxy in
                    CustomScrollView(offset: $scrollViewModel.offset,
                                     contentHeight: $scrollViewModel.contentHeight,
                                     visibleContentHeight: $scrollViewModel.visibleContentHeight,
                                     showIndicators: true,
                                     axis: .vertical) {
                        withAnimation(.easeInOut(duration: 2)) {
                            LazyVGrid(columns: columns, spacing:0) {
                                if let selectedCategory = viewModel.selectedCategory{
                                    ForEach(selectedCategory.products, id: \.id){ product in
                                        CategoryItemView(product: product)
                                            .id(product.id)
                                           
                                    }
                                }
                            }
                            .onChange(of: viewModel.selectedCategory) { oldValue, newValue in
                                if let firstProduct = viewModel.selectedCategory?.products.first {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                        withAnimation(.easeInOut(duration: 0.4)) {
                                            scrollProxy.scrollTo(firstProduct.id, anchor: .top)
                                        }
                                    }
                                }
                            }
                        }
                    }
//                    .safeAreaInset(edge: .top) {
//                        CircularPercentageView(progress: scrollViewModel.pullDownProgress)
//                    }
                    
                    .onChange(of: scrollViewModel.offset.y, { oldValue, newValue in
                        scrollViewModel.handleScroll()
                        if (scrollViewModel.offset.y == 0){
                            // Update indices if offset is 0 after interaction
                                print("Updating indices")
                                updateIndices()
                            }
                    })
                    .overlay(
                        CircularPercentageView(progress: scrollViewModel.pullDownProgress)
//                            .scaleEffect(scrollViewModel.pullDownProgress / 100)
                            .opacity(scrollViewModel.pullDownProgress > 0 ? 1 : 0)
                            .offset(y: max(-10, scrollViewModel.offset.y/3))
                        , alignment: .top
                    )
//                    .overlay(
//                        CircularPercentageView(progress: scrollViewModel.pullUpProgress)
//                        , alignment: .bottom
//                    )

                }
                .offset(x: 5)
                .frame(width: UIScreen.main.bounds.width * 0.85)
            }
        }
        .onAppear{
            scrollViewModel.onPullDown = handleDragPullDown
            scrollViewModel.onPullUp = handleDragPullUp
        }
    }
    func handleDragPullDown(){
        moveToPreviousCategory()
            
    }
    
    func handleDragPullUp(){
        moveToNextCategory()
        
    }

    func moveToPreviousCategory() {
            
        guard let previousCategoryIndex = viewModel.previousCategoryIndex else { return }
//        withAnimation(.easeInOut(duration: 0.7)){
        viewModel.selectedCategory = viewModel.categories[previousCategoryIndex]
//            }
        }

        func moveToNextCategory() {
            guard let nextCategoryIndex = viewModel.nextCategoryIndex else { return }
            if nextCategoryIndex < viewModel.categories.count{
                    viewModel.selectedCategory = viewModel.categories[nextCategoryIndex]
                }
                
        }

    func updateIndices(){
        guard let selectedCategoryId = viewModel.selectedCategory?.id else { return }
        if let currentIndex = viewModel.categories.firstIndex(where: { $0.id == selectedCategoryId }){
                print("Current category item selected index is \(currentIndex)")
                viewModel.previousCategoryIndex = currentIndex > 0 ? currentIndex - 1 : 0
                viewModel.nextCategoryIndex = currentIndex < viewModel.categories.count ? currentIndex + 1 : viewModel.categories.count - 1
                print("Previous category item selected index is \(String(describing: viewModel.previousCategoryIndex))")
                print("Next category item selected index is \(String(describing: viewModel.nextCategoryIndex))")
            }
        }

}

//#Preview {
//    SubProductView(previousCategoryIndex: <#Int#>, nextCategoryIndex: <#Int#>)
//}
