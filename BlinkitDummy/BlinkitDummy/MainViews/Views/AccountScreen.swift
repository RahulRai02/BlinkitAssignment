//
//  AccountScreen.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 21/09/24.
//

import SwiftUI


import SwiftUI

final class AccountViewModel: ObservableObject{
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthdate = Date()
    @Published var extraNapkins = false
    @Published var frequentRefills = false
    
    func saveChanges() {
        // Logic for saving changes goes here
        print("Changes saved")
    }
}

struct AccountScreen: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView{
            Form{
                Section {
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text:$viewModel.lastName)
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization( .none)
                        .autocorrectionDisabled(true)
                    DatePicker("Birthday",
                               selection: $viewModel.birthdate,
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
                
                Section{
                    Toggle(isOn: $viewModel.extraNapkins) {
                        Text("Extra Napkins")
                    }
                    Toggle(isOn: $viewModel.frequentRefills) {
                        Text("Frequent Refills")
                    }
                } header: {
                    Text("Requests")
                }
                .toggleStyle(SwitchToggleStyle(tint: .green))
                
            }
            .navigationTitle("Account")
        }
//        .onAppear{
//            viewModel.retriveUser()
//        }
//        .alert(item: $viewModel.alertItem){ alertItem in
//            Alert(title: alertItem.title,
//                  message: alertItem.message,
//                  dismissButton: alertItem.dismissButton)
//        }
    }
}

#Preview {
    AccountScreen()
}
