//
//  LoadingView.swift
//  Appetizers
//
//  Created by Bhumika Hirapara on 12/16/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            ProgressView("Fetching Data")
                .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
                .scaleEffect(2)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
