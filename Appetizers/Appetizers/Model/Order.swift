//
//  OrderViewModel.swift
//  Appetizers
//
//  Created by Bhumika Hirapara on 12/18/23.
//

import Foundation

// ViewModel & EnvironmentObject - are similar however
// ViewModel - is very tightly coupled with a specific View
// Environment - object isn't attached to a single view, multiple views can access it
/// we have to use this EnvironmentObject in AppetizerListView and OrderView

final class Order: ObservableObject {   /// EnvironmentObject
    
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
