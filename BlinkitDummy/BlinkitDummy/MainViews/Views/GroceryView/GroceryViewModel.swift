//
//  GroceryViewModel.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 22/09/24.
//

import Foundation

class GroceryViewModel: ObservableObject{
    @Published var categories: [Category] = []
    
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
