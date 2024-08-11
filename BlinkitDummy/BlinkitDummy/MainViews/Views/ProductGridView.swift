//
//  ProductGridView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 11/08/24.
//

import SwiftUI

struct ProductGridView: View {
    @ObservedObject var viewModel: SubProductViewModel
    @ObservedObject var scrollViewModel: ScrollViewModel
    static let rightPanelWidthRatio: CGFloat = 0.85
    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    
    var body: some View {
        ScrollViewReader{ scrollProxy in
            CustomScrollView(offset: $scrollViewModel.offset,
                             contentHeight: $scrollViewModel.totalContentHeight,
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
                            // Delayed this operation because before loading contents, it was called so contents dont scroll back to Top
                            // BY adding a delay, content load first, then it moves to Top
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                withAnimation(.easeInOut(duration: 2)) {
                                    scrollProxy.scrollTo(firstProduct.id, anchor: .top)
                                }
                            }
                        }
                    }
                }
            }
             .onAppear {
                 // Assign callbacks
                 viewModel.onReachedTopCategory = {
                     scrollViewModel.isAtTop = true
                     print("Top category reached")
                 }
                 
                 viewModel.onReachedBottomCategory = {
                     scrollViewModel.isAtBottom = true
                     print("Bottom category reached")
                    
                 }
             }
            .onChange(of: scrollViewModel.offset.y, { oldValue, newValue in
                scrollViewModel.handleScroll()
                if (scrollViewModel.offset.y == 0){
//                    print("Updating indices")
                    viewModel.updateIndices()
                }
            })
            
            .overlay(
                scrollViewModel.isAtTop == false ?
                    ProgressBarWithPercentageView(progress: scrollViewModel.pullDownProgress)
                        .opacity(scrollViewModel.pullDownProgress)
                        .offset(y: max(-10, scrollViewModel.offset.y/3)) :
                    nil,
                alignment: .top
            )

//            .overlay(
//                ProgressBarWithPercentageView(progress: scrollViewModel.pullDownProgress)
//                    .opacity(scrollViewModel.pullDownProgress)
//                    .offset(y: max(-10, scrollViewModel.offset.y/3))
//                , alignment: .top
//                
//            )
            .overlay(
                ProgressBarWithPercentageView(progress: scrollViewModel.pullUpProgress)
                    .opacity(scrollViewModel.pullUpProgress)
                , alignment: .bottom
            )

        }
        .offset(x: 5)
        .frame(width: UIScreen.main.bounds.width * ProductGridView.rightPanelWidthRatio)
    }
}

