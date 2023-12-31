//
//  User.swift
//  Appetizers
//
//  Created by Bhumika Hirapara on 12/17/23.
//

import Foundation

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthdate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
