//
//  SubProductView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 07/08/24.
//

import SwiftUI

enum CategoryDirection {
    case previous
    case next
}

struct SubProductView: View {
    @StateObject var viewModel = SubProductViewModel()
    @StateObject private var scrollViewModel = ScrollViewModel()
    let navTitle: String
    @State private var hasAppeared = false

    var body: some View {
        VStack {
            NavigationBar(navTitle: navTitle)
                .frame(height: UIScreen.main.bounds.height * 0.06)
            HStack(spacing:0){
                CategoryListView(viewModel: viewModel, scrollViewModel: scrollViewModel)
                ProductGridView(viewModel: viewModel, scrollViewModel: scrollViewModel)
            }
        }
        .onAppear{
            if !hasAppeared {
                scrollViewModel.onPullDown = handleDragPullDown
                scrollViewModel.onPullUp = handleDragPullUp
                viewModel.selectedCategory = viewModel.categories.first
                hasAppeared = true // Set the flag to true after the first appearance
            }
        }
    }
    
    // Drag handling
    private func handleDragPullDown(){
        moveToCategory(direction: .previous)
    }

    private func handleDragPullUp(){
        moveToCategory(direction: .next)
    }
    // Move to next or preivous
    private func moveToCategory(direction: CategoryDirection){
        let index: Int?
        switch direction{
        case .previous:
            index = viewModel.previousCategoryIndex
        case .next:
            index = viewModel.nextCategoryIndex
        }
        guard let index = index, index >= 0, index < viewModel.categories.count else { return }
        withAnimation(.easeInOut(duration: 0.7)) {
            viewModel.selectedCategory = viewModel.categories[index]
        }
    }
}

