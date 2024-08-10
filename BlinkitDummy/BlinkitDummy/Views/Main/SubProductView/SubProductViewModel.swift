//
//  SubProductViewModel.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 10/08/24.
//

import Foundation

class SubProductViewModel: ObservableObject{
    @Published var categories: [Category] = []
    @Published var selectedCategory: Category?
//    @Published var isSelected = false
//    @Published var selectedCategoryId: UUID?
    
    @Published var previousCategoryIndex: Int? = 0
    @Published var nextCategoryIndex: Int? = 1
//    @Published var offset: CGPoint = .zero
//    @Published var contentHeight: CGFloat = 0
//    @Published var visibleContentHeight: CGFloat = 0
    
    
    func fetchCategoriesAndProducts(){
        // If network logic comes, we can add here
        guard let url = Bundle.main.url(forResource: "mockJson", withExtension: "json")
            else{
                print("json file not found")
                return
            }
     
        do {
            let data = try Data(contentsOf: url)
            let categoryProducts = try JSONDecoder().decode(CategoryReponse.self, from: data)
            
            // Assign the categories array to the @Published property
            self.categories = categoryProducts.categories
            
        } catch {
            print("Failed to decode JSON: \(error.localizedDescription)")
        }
    }
    

    
}
