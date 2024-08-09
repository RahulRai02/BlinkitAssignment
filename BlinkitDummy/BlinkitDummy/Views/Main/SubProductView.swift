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

    @State private var previousCategoryIndex: Int? = 0
//    @State private var nextCategoryIndex: Int? = mockCategories.count
    
    
    
    @State var offset: CGPoint = .zero
    

    var body: some View {
        VStack {
            NavigationBar()
                .frame(height: UIScreen.main.bounds.height * 0.05)
            HStack(spacing:0){
                ScrollViewReader { scrollViewProxy in
                    ScrollView{
                        VStack(spacing:0){
                            Text("Offset: \(String(format: "%.1f", offset.y))")
                            ForEach(mockCategories, id: \.id) { category in
//                                let index = mockCategories.firstIndex(where: { $0.id == category.id })!
                                CategoriesView(category: category,
                                               isSelected: category == selectedCategory )
                                
                                .onTapGesture {
//                                    print("Category at index \(index) tapped")
                                    withAnimation(.easeInOut) {
                                        selectedCategory = category
                                        scrollViewProxy.scrollTo(category.id,
                                                                 anchor: .center)
                                    }
                                    updateIndices()
                                }
                            }
                        }

                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.15)
                
                CustomScrollView(offset: $offset, showIndicators: true, axis: .vertical) {
                    LazyVGrid(columns: columns, spacing:0) {
                        if let selectedCategory = selectedCategory{
                            ForEach(selectedCategory.products){ product in
                                CategoryItemView(product: product)
                            }
                        }
                    }
                    
                }
                
                .onChange(of: offset.y, { oldValue, newValue in
                    handleDragPullDown(offset: newValue)
                    if offset.y == 0{
                        updateIndices()
                    }
                })
                
                .offset(x: 5)

                .frame(width: UIScreen.main.bounds.width * 0.85)
            }
        }

    }
    func handleDragPullDown(offset: CGFloat){
        let threshold: CGFloat = -80.0
            if offset < threshold {
                moveToPreviousCategory()
                
            }
    }
    
    func moveToPreviousCategory() {
        withAnimation(.easeInOut){
            if let prevVal = previousCategoryIndex {
                print("Final Prev Cat \(prevVal)")
                selectedCategory = mockCategories[prevVal]
            }
            
        }
    }
    
    func updateIndices(){
        guard let selectedCategoryId = selectedCategory?.id else { return }
        if let currentIndex = mockCategories.firstIndex(where: { $0.id == selectedCategoryId }){
            print("Current category item selected index is \(currentIndex)")
            previousCategoryIndex = currentIndex > 0 ? currentIndex - 1 : 0
            print("Previous category item selected index is \(previousCategoryIndex)")
        }
    }
    
}

//#Preview {
//    SubProductView(previousCategoryIndex: <#Int#>, nextCategoryIndex: <#Int#>)
//}
