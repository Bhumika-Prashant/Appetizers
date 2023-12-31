//
//  OrderView.swift
//  Appetizers
//
//  Created by Bhumika Hirapara on 12/16/23.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            ZStack {    /// we have to load everything in ZStack because if order items are empty, we have to show EmptyState on top of that VStack
                VStack {
                    /// we have to delete each row of the List and that's why we have written ForEach() here
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(.plain)
                    
                    Button {
                        print("order placed")
                    } label: {
//                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .modifier(StandardButtonStyle())    /// custom modifiers
                    .padding(.bottom, 25)
                }
                
                /// when deleting everything, then it redraws this list
                if order.items.isEmpty {    /// Empty State - when you don't have any items
                    EmptyState(imageName: "empty-order",
                               message: "You have no items in your order.\nPlease add an appetizer!")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
