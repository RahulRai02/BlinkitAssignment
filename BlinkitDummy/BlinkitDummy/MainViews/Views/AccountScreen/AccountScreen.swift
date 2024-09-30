//
//  AccountScreen.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 21/09/24.
//

import SwiftUI

struct AccountScreen: View {
    
    @StateObject var viewModel = AccountViewModel()

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

                    
//              Add/ update address
                Section {
                    TextField("House Number", text: $viewModel.houseNumber)
                    TextField("Address", text: $viewModel.address)
                    TextField("Sector", text: $viewModel.sector)
                    TextField("Pincode", text: $viewModel.pincode)
                    TextField("City", text: $viewModel.city)
                    TextField("State", text: $viewModel.state)
                    
                    HStack {
                        Button {
                            viewModel.addOrUpdateAddress()
                        } label: {
                            withAnimation(.easeInOut) {
                                Text(viewModel.selectedEntity == nil ? "Add Address" : "Update Address")
                            }
                        }
                        Spacer()
                        Button {
                            viewModel.resetForm()
                        } label: {
                            Text("Clear address cells")
                        }
                    }
                        } header: {
                            Text("Add/Update your address")
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
               
                Section {
                     List {
                         ForEach(viewModel.savedEntities) { entity in
                             AddressCell(
                                 houseNumber: entity.houseNumber ?? "No house no.",
                                 address: entity.address ?? "No address found",
                                 sector: entity.sector ?? "No sector found",
                                 pincode: entity.pincode ?? "No pincode found",
                                 city: entity.city ?? "No city found",
                                 state: entity.state ?? "No state found"
                             )
                             .onTapGesture {
                                 viewModel.loadAddressForEditing(entity: entity)
                             }
                         }
                         .onDelete(perform: viewModel.deleteAddress)
                     }
                 } header: {
                     Text("My addresses")
                 }

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

struct AddressCell: View {
    let houseNumber: String
    let address: String
    let sector: String
    let pincode: String
    let city: String
    let state: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("House No: \(houseNumber)")
                .font(.headline)
                .foregroundColor(.primary)
            
            Text("\(address), \(sector)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            HStack {
                Text("\(city), \(state)")
                Spacer()
                Text("Pincode: \(pincode)")
            }
            .font(.footnote)
            .foregroundColor(.gray)
            
//            HStack {
//                Button(action: onEdit) {
//                    Text("Edit")
//                        .foregroundColor(.blue)
//                        .padding(.horizontal)
//                        .padding(.vertical, 6)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 8)
//                                .stroke(Color.blue, lineWidth: 1)
//                        )
//                }
//            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

