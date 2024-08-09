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
    private let pullDownThreshold: CGFloat = -80
    private let pullUpThreshold: CGFloat = 200

    @State private var previousCategoryIndex: Int? = 0

    
    @State private var nextCategoryIndex: Int? = 1

    
    @State var currentDragOffset: CGFloat = 0
    
    @State var offset: CGPoint = .zero
    @State var contentHeight: CGFloat = 0
    @State var visibleContentHeight: CGFloat = 0
    


    var body: some View {
        VStack {
            NavigationBar()
                .frame(height: UIScreen.main.bounds.height * 0.05)
            HStack(spacing:0){
//                ScrollViewReader { scrollViewProxy in
                    ScrollView{
                        VStack(spacing:0){
                            
//                            Text("Offset: \(String(format: "%.1f", offset.y))")
//                            Text("Height: \(String(format: "%.1f", contentHeight))")
//                            Text("VisCont: \(String(format: "%.1f", visibleContentHeight))")
                                
                            ForEach(mockCategories, id: \.id) { category in
//                                let index = mockCategories.firstIndex(where: { $0.id == category.id })!
                                CategoriesView(category: category,
                                               isSelected: category == selectedCategory )

                                
                                .onTapGesture {
//                                    print("Category at index \(index) tapped")
                                    withAnimation(.easeInOut) {
                                        selectedCategory = category
//                                        scrollViewProxy.scrollTo(category.id,
//                                                                 anchor: .center)
                                    }
                     
                                    updateIndices()
                                }
                            }
                        }

                    }
//                }
                .frame(width: UIScreen.main.bounds.width * 0.15)
                
                ScrollViewReader{ scrollProxy in
                    CustomScrollView(offset: $offset,contentHeight: $contentHeight, visibleContentHeight: $visibleContentHeight, showIndicators: true, axis: .vertical) {
                        LazyVGrid(columns: columns, spacing:0) {
                            if let selectedCategory = selectedCategory{
//                                withAnimation(.easeInOut(duration: 1.5)){
                                    ForEach(selectedCategory.products, id: \.id){ product in
                                        CategoryItemView(product: product)
                                    }
                                }
//                            }
                        }
  
//                        .onChange(of: selectedCategory) { _,_ in
//                            // Scroll to top when category changes
//                            scrollProxy.scrollTo(selectedCategory?.products.first?.id, anchor: .top)
//                        }
                            
                    }
                }
                
                
                .onChange(of: offset.y, { oldValue, newValue in
                    if newValue < pullDownThreshold {
                        // Handle pull down
                        print("Pull down detected")
                        handleDragPullDown()
                        // Your logic for pull down, e.g., refresh content
                    } else if ((visibleContentHeight - contentHeight) + offset.y) >= 140 && (visibleContentHeight - contentHeight < 0) {
                        // Handle pull up
                        print("\(((visibleContentHeight - contentHeight) + offset.y))")
                        print("Pull up detected")
                        handleDragPullUp()
                        // Your logic for pull up, e.g., load more data
                    }else if(((visibleContentHeight - contentHeight) + offset.y) >= 140 && (visibleContentHeight - contentHeight > 0)){
                        if newValue < pullDownThreshold{
                            print("Pull down detected")
                            handleDragPullDown()
                        }else if(newValue > 140){
                            print("Pull up detected")
                            handleDragPullUp()
                        }
                    }
                    
                        if offset.y == 0 {
                            print("Updating indices")
                            updateIndices() // Update indices if offset is 0 after interaction
                        }
                    

                })
                
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
            
            guard let previousCategoryIndex = previousCategoryIndex else { return }
        withAnimation(.easeInOut(duration: 0.7)){
                selectedCategory = mockCategories[previousCategoryIndex]
            }
        }

        func moveToNextCategory() {
            
            
                guard let nextCategoryIndex = nextCategoryIndex else { return }
                if nextCategoryIndex < mockCategories.count{
                    withAnimation(.easeInOut(duration: 0.7)){
                        selectedCategory = mockCategories[nextCategoryIndex]
                    }
                    
                }
                
        }

    func updateIndices(){
        guard let selectedCategoryId = selectedCategory?.id else { return }
            if let currentIndex = mockCategories.firstIndex(where: { $0.id == selectedCategoryId }){
                print("Current category item selected index is \(currentIndex)")
                previousCategoryIndex = currentIndex > 0 ? currentIndex - 1 : 0
                nextCategoryIndex = currentIndex < mockCategories.count ? currentIndex + 1 : mockCategories.count - 1
                print("Previous category item selected index is \(String(describing: previousCategoryIndex))")
                print("Next category item selected index is \(String(describing: nextCategoryIndex))")
            }
        }
}

//#Preview {
//    SubProductView(previousCategoryIndex: <#Int#>, nextCategoryIndex: <#Int#>)
//}
