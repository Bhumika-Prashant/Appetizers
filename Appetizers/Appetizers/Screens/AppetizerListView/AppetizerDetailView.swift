//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Bhumika Hirapara on 12/16/23.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    /// Beacuse AppetizerDetailView is a child of TabView, it can use it
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        VStack {
            ImageLoader(urlString: appetizer.imageURL)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)    /// default - .leading
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", value: "\(appetizer.calories)")
                    NutritionInfo(title: "Carbs", value: "\(appetizer.carbs) g")
                    NutritionInfo(title: "Protein", value: "\(appetizer.protein) g")
                }
            }
            
            Spacer()
            
            Button {    /// Add to Order Button
                order.add(appetizer)
                isShowingDetailView = false
            } label: {
//                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .modifier(StandardButtonStyle())    /// custom modifiers
//            .standardButtonStyle()    // if we want to simplify further but .modifier() looks readable
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        
        .overlay(Button {   /// x button to cancel
            isShowingDetailView = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

struct NutritionInfo: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text(value)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer,
                            isShowingDetailView: .constant(true))
    }
}



