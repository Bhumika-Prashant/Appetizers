//
//  AppetizerCell.swift
//  Appetizers
//
//  Created by Bhumika Hirapara on 12/16/23.
//

import SwiftUI

struct AppetizerListCell: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            ImageLoader(urlString: appetizer.imageURL)
                .frame(width: 120, height: 90)
                .scaledToFit()
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appetizer.price, specifier: "%.2f")") /// -> $9.99, if %.f -> $10
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

struct AppetizerCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListCell(appetizer: MockData.sampleAppetizer)
    }
}
