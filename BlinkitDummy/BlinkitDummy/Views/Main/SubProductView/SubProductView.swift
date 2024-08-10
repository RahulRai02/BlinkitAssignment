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
    
//    @State private var selectedCategory: Category? = mockCategories.first
    private let pullDownThreshold: CGFloat = -80
    private let pullUpThreshold: CGFloat = 180

//    @State private var previousCategoryIndex: Int? = 0
//    @State private var nextCategoryIndex: Int? = 1


    @State var offset: CGPoint = .zero
    @State var contentHeight: CGFloat = 0
    @State var visibleContentHeight: CGFloat = 0
    
    var body: some View {
        VStack {
            NavigationBar()
                .frame(height: UIScreen.main.bounds.height * 0.05)
                
            HStack(spacing:0){
                    ScrollView{
                        VStack(spacing:0){
                            Text("Offset: \(String(format: "%.1f", offset.y))")
                            Text("Height: \(String(format: "%.1f", contentHeight))")
                            Text("VisCont: \(String(format: "%.1f", visibleContentHeight))")
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
                    CustomScrollView(offset: $offset,contentHeight: $contentHeight, visibleContentHeight: $visibleContentHeight, showIndicators: true, axis: .vertical) {
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
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                        withAnimation(.easeInOut(duration: 0.4)) {
                                            scrollProxy.scrollTo(firstProduct.id, anchor: .top)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .onChange(of: offset.y, { oldValue, newValue in
                     
                        if newValue < pullDownThreshold {
                            // Handle pull down
                            print("Pull down detected")
                            handleDragPullDown()
                            
                        } else if ((visibleContentHeight - contentHeight) + offset.y) >= pullUpThreshold && (visibleContentHeight - contentHeight < 0) {
                            // Handle pull up
                            print("\(((visibleContentHeight - contentHeight) + offset.y))")
                            print("Pull up detected")
                            
                            handleDragPullUp()
                            
                        }else if(((visibleContentHeight - contentHeight) + offset.y) >= pullUpThreshold && (visibleContentHeight - contentHeight > 0)){
                            if newValue < pullDownThreshold{
                                print("Pull down detected")
                               
                                handleDragPullDown()
                            }else if(newValue > 140){
                                print("Pull up detected")
                               
                                handleDragPullUp()
                            }
                        }
            
                        if (offset.y == 0){
//                            Update indices if offset is 0 after interaction
                                print("Updating indices")
                                updateIndices()  
                            
                            }
                    })
                
                    
                }
                .offset(x: 5)
                .frame(width: UIScreen.main.bounds.width * 0.85)
            }
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
