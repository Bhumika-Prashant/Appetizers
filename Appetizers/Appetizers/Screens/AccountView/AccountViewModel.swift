//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Bhumika Hirapara on 12/16/23.
//

import SwiftUI

//  @AppStorage - its SwiftUI ways of monitoring UserDefaults
/// We don't want to store user into UserDefaults because if users delete their account then it will also delete from UserDefaults, so user might want to store into server

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data? /// user (custom object) store into AppStorage
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    func saveChanges() {
        guard isValidForm else { return }
        do {
            userData = try JSONEncoder().encode(user)
            alertItem = AlertContext.userSaveSuccess    /// we want to show users, hey you are successfully saved
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retrieveUser() {
        guard let userData else { return }
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    var isValidForm: Bool { /// check before saving 
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        guard user.email.isValidEmail else {    /// String+Ext -> Regex
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
}
