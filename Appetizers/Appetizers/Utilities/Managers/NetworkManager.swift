//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Bhumika Hirapara on 12/16/23.
//

import Foundation

final class NetworkManager {
    
    func request<T: Decodable>(url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw DataError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw DataError.invalidResponse
        }
        
//        do {
//            return try JSONDecoder().decode(T.self, from: data)
//        } catch {
//            throw DataError.invalidData
//        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
