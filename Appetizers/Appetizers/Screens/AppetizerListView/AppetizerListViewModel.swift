//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Bhumika Hirapara on 12/16/23.
//

import Foundation

//  @Published - ObservableObject and ViewModel need to broadcast their changes, and we will be setting up in ListView to listen to changes

enum Event {
    case loading
    case dataLoaded
}

@MainActor final class AppetizerListViewModel: ObservableObject {
    
    private let networkManager = NetworkManager()
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    @Published var eventHandler: Event = .loading
    @Published var alertItem: AlertItem?
    @Published var isShowingDetailView = false
    @Published var selectedAppetizer: Appetizer?
    
    var appetizers: [Appetizer] = [] {
        didSet {
            eventHandler = .dataLoaded
        }
    }
    
    func getAppetizers() {
        eventHandler = .loading
        Task {
            do {
                let response: AppetizerResponse = try await networkManager.request(url: appetizerURL)
                appetizers = response.appetizers
                eventHandler = .dataLoaded
            } catch {
                if let apError = error as? DataError {  /// we casted error as custom error
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse    /// we can write our generic error here and not the .invalidResponse
                }
                eventHandler = .dataLoaded
            }
        }
    }
}
