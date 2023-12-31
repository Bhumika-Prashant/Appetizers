//
//  AccountView.swift
//  Appetizers
//
//  Created by Bhumika Hirapara on 12/18/23.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    /// @FocusState - we are gonna use this to improve the UX of our keyboard
        
        enum FormTextField {
            case firstName, lastName, email
        }
        
        var body: some View {
            NavigationStack {
                Form {
                    Section(header: Text("Personal Info")) {
                        TextField("First Name", text: $viewModel.user.firstName)
                            /// we focus on the firstName
                            .focused($focusedTextField, equals: .firstName)
                            /// return button from keyboard fires up when .onSubmit calls
                            /// once the user presses return button, now the focusedTextField will be .lastName - good UX
                            /// it will automatically go to .lastName
                            .onSubmit { focusedTextField = .lastName }
                            .submitLabel(.next) /// instead of return - we would like .next
                        
                        TextField("Last Name", text: $viewModel.user.lastName)
                            .focused($focusedTextField, equals: .lastName)
                            .onSubmit { focusedTextField = .email }
                            .submitLabel(.next)
                        
                        TextField("Email", text: $viewModel.user.email)
                            .focused($focusedTextField, equals: .email)
                            .onSubmit { focusedTextField = nil }    /// keyboard will dismiss here
                            .submitLabel(.continue) /// not next here and instead .continue with the form
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        
                        DatePicker("Birthday",
                                   selection: $viewModel.user.birthdate,
                                   in: Date().oneHundredTenYearsAgo...Date().eighteenYearsAgo,
                                   displayedComponents: .date)
                        
                        Button {    /// We are saving our changes on button tap
                            viewModel.saveChanges()
                        } label: {
                            Text("Save Changes")
                        }
                    }
                    
                    Section(header: Text("Requests")) {
                        Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                        Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))    /// toggle color
                }
                .navigationTitle("🤣 Account")
                .toolbar {  /// we want to dismiss our keyboard (focusedTextField = nil), we have a toolbar (Dismiss Butoon) on top of keyboard
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("Dismiss") { focusedTextField = nil }
                    }
                }
            }
            .onAppear { /// we are retrieving our user with .onAppear
                viewModel.retrieveUser()
            }
            .alert(item: $viewModel.alertItem) { alertItem in   /// alert
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
        }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
