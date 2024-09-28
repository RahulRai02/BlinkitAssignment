//
//  AccountViewModel.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 29/09/24.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject{
    
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    
    @AppStorage("address") private var addressData: Data?
//    @Published var address = Address()
    @Published var addresses: [Address] = []
    
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
    
    func saveAddress(){
        guard isValidForm else {
            return
        }
//        addresses.append(newAddress)
        
        do{
            let data = try JSONEncoder().encode(addresses)
            addressData = data
            alertItem = AlertContext.addressSaveSuccess
        }catch{
            alertItem = AlertContext.invalidAddressData
        }
        
        print("Address array is: \(addresses)")
    }
    
    func retrieveAddress(){
        guard let addressData = addressData else {
            return
        }
        do{
            addresses = try JSONDecoder().decode([Address].self, from: addressData)
        }catch{
            alertItem = AlertContext.invalidAddressData
        }
    }
    
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else{
            // Alert
            alertItem = AlertContext.invalidForm
            return false
        }
//        guard user.email else{
//            alertItem = AlertContext.invalidEmail
//            return false
//        }
        
        
        return true
    }
    
    func addAddress(_ address: Address) {
        addresses.append(address)
        saveAddress()
    }

    func deleteAddress(at offsets: IndexSet) {
        addresses.remove(atOffsets: offsets)
        saveAddress()
    }

    
}
