//
//  ImageLoader.swift
//  Appetizers
//
//  Created by Bhumika Hirapara on 12/16/23.
//

import SwiftUI

/// Downside of AsyncImage - it doesn't cache for us, it downloads images every time

struct ImageLoader: View {
    
    let urlString: String
    
    var body: some View {
        /// since url is optional, we don't need to unwrap it
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
        } placeholder: {
//                ProgressView()
            Image("food-placeholder")
                .resizable()
        }
    }
}

struct ImageLoader_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoader(urlString: MockData.sampleAppetizer.imageURL)
    }
}
