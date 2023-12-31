//
//  AppetizerTabView.swift
//  Appetizers
//
//  Created by Bhumika Hirapara on 12/16/23.
//

import SwiftUI

struct AppetizerTabView: View {
   
    /// If we inject our EnvironmentObject (Order) in TabView, then all its children can access it
    /// To get access to Order, we have to create EnvironmentObject variable everywhere when we need it
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem { Label("Home", systemImage: "house") }
            
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
            
            OrderView()
                .tabItem { Label("Order", systemImage: "bag") }
                .badge(order.items.count)
        }
    }
}

struct AppetizerTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView()
    }
}
