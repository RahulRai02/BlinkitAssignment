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
    
    // Address form data
    @Published var houseNumber: String = ""
    @Published var address: String = ""
    @Published var sector: String = ""
    @Published var pincode: String = ""
    @Published var city: String = ""
    @Published var state: String = ""
    
    @Published var selectedEntity: AddressEntity? = nil
    
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
//    func addAddress(houseNumber: String, address: String, sector: String, city: String, state: String, pincode: String){
//        let newAddress = AddressEntity(context: container.viewContext)
//        
//        newAddress.houseNumber = houseNumber
//        newAddress.address = address
//        newAddress.sector = sector
//        newAddress.city = city
//        newAddress.state = state
//        newAddress.pincode = pincode
//        saveData()
//    }
    
    func addOrUpdateAddress() {
        guard !houseNumber.isEmpty, !address.isEmpty, !sector.isEmpty, !pincode.isEmpty, !city.isEmpty, !state.isEmpty else {
            return
        }
        
        if let entity = selectedEntity {
            // Editing existing address
            entity.houseNumber = houseNumber
            entity.address = address
            entity.sector = sector
            entity.pincode = pincode
            entity.city = city
            entity.state = state
        } else {
            // Adding a new address
            let newAddress = AddressEntity(context: container.viewContext)
            newAddress.houseNumber = houseNumber
            newAddress.address = address
            newAddress.sector = sector
            newAddress.city = city
            newAddress.state = state
            newAddress.pincode = pincode
        }
        saveData()
        resetForm()
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
    
    
    func loadAddressForEditing(entity: AddressEntity) {
        selectedEntity = entity
        houseNumber = entity.houseNumber ?? ""
        address = entity.address ?? ""
        sector = entity.sector ?? ""
        pincode = entity.pincode ?? ""
        city = entity.city ?? ""
        state = entity.state ?? ""
    }
    
    func resetForm() {
        houseNumber = ""
        address = ""
        sector = ""
        pincode = ""
        city = ""
        state = ""
        selectedEntity = nil
    }
    func loadAddress(gpsAddress: String){
        self.address = gpsAddress
    }
    
}
