//
//  EmptyState.swift
//  Appetizers
//
//  Created by Bhumika Hirapara on 12/18/23.
//

import SwiftUI

/// we will show EmptyState if there isn't any order in OrderView

struct EmptyState: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {    /// For systemBackground - we have taken ZStack
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -50) /// if we want to push everything up to look better in center (push up -> negative, down -> positive)
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState(imageName: "empty-order",
                   message: "This is our test message.\nI'm making it a little long for testing.")
    }
}
