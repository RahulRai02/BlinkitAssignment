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
//    @State private var newAddress = Address()  Temporary address for form input

    @State var houseNumber: String = ""
   @State var address: String = ""
   @State var sector: String = ""
   @State var pincode: String = ""
   @State var city: String = ""
   @State var state: String = ""
    
    @State var selectedEntity: AddressEntity? = nil

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

                    
//                     Add new address
                    Section{
                        TextField("House Number", text: $houseNumber)
                        TextField("Address", text: $address)
                        TextField("Sector", text: $sector)
                        TextField("Pincode", text: $pincode)
                        TextField("City", text: $city)
                        TextField("State", text: $state)
                        
                        HStack{
                            Button(action: {
                                // Ensure that all fields are non-empty before proceeding
                                guard !houseNumber.isEmpty,
                                      !address.isEmpty,
                                      !sector.isEmpty,
                                      !pincode.isEmpty,
                                      !city.isEmpty,
                                      !state.isEmpty else {
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
                                    viewModel.addAddress(houseNumber: houseNumber, address: address, sector: sector, city: city, state: state, pincode: pincode)
                                }
                                viewModel.saveData()
                                resetForm()
                            }) {
                                withAnimation(.easeInOut){
                                    Text(selectedEntity == nil ? "Add Address" : "Update Address")
                                }
                                
                            }
                            Spacer()
                            Button {
                                resetForm()
                            } label: {
                                Text("Clear address cells")
                            }

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
               
                Section{
                    List{
                        ForEach(viewModel.savedEntities){entity in
                            AddressCell(
                                houseNumber: entity.houseNumber ?? "No house no.",
                                address: entity.address ?? "No address found",
                                sector: entity.sector ?? "No sector found",
                                pincode: entity.pincode ?? "No pincode found",
                                city: entity.city ?? "No city found",
                                state: entity.state ?? "No state found"
//                                onEdit: {
//                                    loadAddressForEditing(entity: entity)
//                                }
                            )
                            .onTapGesture {
                                loadAddressForEditing(entity: entity)
                            }
//                                .listRowBackground(Color.clear)
                        }
                        .onDelete(perform: viewModel.deleteAddress)
                    }
                }header: {
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
    
    private func loadAddressForEditing(entity: AddressEntity) {
        selectedEntity = entity
        houseNumber = entity.houseNumber ?? ""
        address = entity.address ?? ""
        sector = entity.sector ?? ""
        pincode = entity.pincode ?? ""
        city = entity.city ?? ""
        state = entity.state ?? ""
    }
    
    private func resetForm() {
        houseNumber = ""
        address = ""
        sector = ""
        pincode = ""
        city = ""
        state = ""
        selectedEntity = nil
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

