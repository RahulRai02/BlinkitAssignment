//
//  AccountViewModel.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 29/09/24.
//

import Foundation
import SwiftUI
import CoreData

final class AccountViewModel: ObservableObject{
    
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    
    //    @AppStorage("address") private var addressData: Data?
    //    @Published var address = Address()
    //    @Published var addresses: [Address] = []
    
    // Core data
    let container: NSPersistentContainer
    @Published var savedEntities: [AddressEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "AddressContainer")
        container.loadPersistentStores { description, error in
            if let error = error{
                print("Error loading core data. \(error)")
            }else{
                print("Successfully loaded Core data")
            }
        }
        //        fetchAddresses()
        fetchAddresses()
    }
    func fetchAddresses(){
        let request = NSFetchRequest<AddressEntity>(entityName: "AddressEntity")
        
        do{
            savedEntities =  try container.viewContext.fetch(request)
        }catch let error{
            print("Error fetching: \(error)")
        }
    }
    func addAddress(houseNumber: String, address: String, sector: String, city: String, state: String, pincode: String){
        let newAddress = AddressEntity(context: container.viewContext)
        
        newAddress.houseNumber = houseNumber
        newAddress.address = address
        newAddress.sector = sector
        newAddress.city = city
        newAddress.state = state
        newAddress.pincode = pincode
        saveData()
    }
    
    func deleteAddress(indexSet: IndexSet){
        guard let index = indexSet.first else {
            return
        }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func saveData(){
        do{
            try container.viewContext.save()
            fetchAddresses()
        }catch let error{
            print("Error saving the data \(error)")
        }
    }
    
//    func updateAddress(entity: AddressEntity){
//    }
//    
    
    // Alert Item
    @Published var alertItem: AlertItem?

    func saveChanges(){
        guard isValidForm else {
            return
        }
//        print("Changes have been saved successfully")
        do{
            let data = try JSONEncoder().encode(user)
            userData = data     // Set the data to app storage
            alertItem = AlertContext.userSaveSuccess
        }catch{
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retriveUser(){
        guard let userData = userData else {
            return
        }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        }catch{
            alertItem = AlertContext.invalidUserData
        }
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else{
            // Alert
            alertItem = AlertContext.invalidForm
            return false
        }
        
        return true
    }
    
}
