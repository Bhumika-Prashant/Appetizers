//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Bhumika Hirapara on 12/16/23.
//

import SwiftUI

//  @State (inside View) - View is watching this variable
//  @Binding - reference between views
//  @StateObject - If you are initialized ViewModel
//  @ObservedObject - If you are passing the ViewModel in from another previous View because you need data from that view
//  @AppStorage - its SwiftUI ways of monitoring UserDefaults (Downside of UserDefaults - UserDefaults gets deleted when the app gets deleted)

// ViewModel & EnvironmentObject - are similar however
// ViewModel - is very tightly coupled with a specific View
// Environment - object isn't attached to a single view, multiple views attached to it
// If we inject our EnvironmentObject in any Parent View, then all its children can access it

// @FocusState - we are gonna use this to improve the UX of our keyboard

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                switch viewModel.eventHandler {
                case .loading:
                    LoadingView()
                case .dataLoaded:
                    List(viewModel.appetizers) { appetizer in
                        AppetizerListCell(appetizer: appetizer)
                            .listRowSeparator(.hidden)
//                            .listRowSeparatorTint(.brandPrimary)
                            .onTapGesture {
                                viewModel.selectedAppetizer = appetizer
                                viewModel.isShowingDetailView = true
                            }
                    }
                    .navigationTitle("🍟 Appetizers")
                    .listStyle(.plain)
                    /// disable List when isShowingDetailView - true -> so that we cannot scroll the list in blur
                    .disabled(viewModel.isShowingDetailView)
                }
            }
            .task { /// we have to call this method to get Appetizers
                viewModel.getAppetizers()
            }   /// we want blur if isShowingDetailView is enabled
            .blur(radius: viewModel.isShowingDetailView ? 20 : 0)
            
            /// we can do it by NavigationLink in List
            if viewModel.isShowingDetailView {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!,
                                    isShowingDetailView: $viewModel.isShowingDetailView)
            }
        }
        /// because @alertItem is broadcasting - we have to listen to it somewhere in View
        /// item should be identifiable
        /// we are $Binding this alertItem from the ViewModel
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,  /// because we have set title -> Text, we don't need to convert
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
