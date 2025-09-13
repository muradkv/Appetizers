//
//  NetworkManager.swift
//  Appetizers
//
//  Created by murad on 13.09.2025.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    static let baseURL = "https://api.npoint.io/"
    private let appetizerURL = baseURL + "dabf00be3f645918e015"
//    let appetizerURL2 = "https://gist.githubusercontent.com/muradkv/6eb8451094b7685e672fd0724e612868/raw/cb15ee481865d7ae482154d3332d72225a9968bc/appetizers.json"
    
    private init() {}
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
