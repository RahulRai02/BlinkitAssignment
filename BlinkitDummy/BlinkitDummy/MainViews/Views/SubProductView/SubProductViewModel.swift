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
    @Published var previousCategoryIndex: Int? = 0
    @Published var nextCategoryIndex: Int? = 1

    
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
    
    func updateIndices() {
        guard let selectedCategoryId = selectedCategory?.id else { return }
        if let currentIndex = categories.firstIndex(where: { $0.id == selectedCategoryId }) {

            previousCategoryIndex = max(0, currentIndex - 1)
//            nextCategoryIndex = currentIndex < categories.count - 1 ? currentIndex + 1 : categories.count - 1
            nextCategoryIndex = min(categories.count - 1, currentIndex + 1)
        }
    }
    
}
