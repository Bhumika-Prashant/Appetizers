//
//  Appetizer.swift
//  Appetizers
//
//  Created by Bhumika Hirapara on 12/16/23.
//

import Foundation

struct AppetizerResponse: Decodable {
    let appetizers: [Appetizer]
    
    enum CodingKeys: String, CodingKey {    /// CodingKey - type that can be used as a key for encoding and decoding.
        case appetizers = "request"
    }
}

struct Appetizer: Decodable, Identifiable {
    /// let : we are just reading data and we are not changing and send back to server
    /// we have to write exactly the same name as json if we want to use Codable to parse the json
    /// we can customize using CodingKeys though
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test Appetizer",
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let appetizers       = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItemOne     = Appetizer(id: 0001,
                                           name: "Test Appetizer One",
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let orderItemTwo     = Appetizer(id: 0002,
                                           name: "Test Appetizer Two",
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let orderItemThree   = Appetizer(id: 0003,
                                           name: "Test Appetizer Three",
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    /// we can [Appetizer] but it should have unique id so we have made 3 different Appetizers
    static let orderItems       = [orderItemOne, orderItemTwo, orderItemThree]
}
