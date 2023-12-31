//
//  APButton.swift
//  Appetizers
//
//  Created by Bhumika Hirapara on 12/16/23.
//

import SwiftUI

struct APButton: View {
    
    /// Normal String doesn't have Specifier: %.2f, we need LocalizedStringKey if we want "specifier"
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)
    }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(title: "Test Title")
    }
}

