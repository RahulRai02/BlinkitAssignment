//
//  AccountScreen.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 21/09/24.
//

import SwiftUI
//
//final class AccountViewModel: ObservableObject{
//    @Published var firstName = ""
//    @Published var lastName = ""
//    @Published var email = ""
//    @Published var birthdate = Date()
//    @Published var extraNapkins = false
//    @Published var frequentRefills = false
//    
//    func saveChanges() {
//        // Logic for saving changes goes here
//        print("Changes saved")
//    }
//}

struct AccountScreen: View {
    
    @StateObject var viewModel = AccountViewModel()
    @State private var newAddress = Address() // Temporary address for form input

    
    var body: some View {
        NavigationView{
            Form{
                Section {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text:$viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization( .none)
                        .autocorrectionDisabled(true)
                    DatePicker("Birthday",
                               selection: $viewModel.user.birthdate,
                               displayedComponents: .date)
                    Button{
//                        print("Save")
                        viewModel.saveChanges()
                        
                    } label: {
                        Text("Save Changes")
                    }
                    
                } header: {
                    Text("Personal Info")
                }

                    
                    // Add new address
                    Section{
                        TextField("House Number", text: $newAddress.houseNumner)
                        TextField("Address", text: $newAddress.address)
                        TextField("Sector", text: $newAddress.sector)
                        TextField("Pincode", text: $newAddress.pincode)
                        TextField("City", text: $newAddress.city)
                        TextField("State", text: $newAddress.state)
                        
                        Button(action: {
                            viewModel.addAddress(newAddress)
                            newAddress = Address() // Reset the input fields
                        }) {
                            Text("Add Address")
                        }
                    }header: {
                        Text("ADD YOUR ADDRESS")
                    }

     
                Section{
                    Toggle(isOn: $viewModel.user.extraNapkins) {
                        Text("Extra Napkins")
                    }
                    Toggle(isOn: $viewModel.user.frequentRefills) {
                        Text("Frequent Refills")
                    }
                } header: {
                    Text("Requests")
                }
                .toggleStyle(SwitchToggleStyle(tint: .green))
                
            }
//            .background(Color.brandPrimary.opacity(0.1))
            .navigationTitle("My Account")
        }
        
        .onAppear{
            viewModel.retriveUser()
        }
        .alert(item: $viewModel.alertItem){ alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
    
}

#Preview {
    AccountScreen()
}
