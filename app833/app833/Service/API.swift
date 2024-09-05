//
//  API.swift
//  app833
//
//  Created by Dias Atudinov on 05.09.2024.
//

import Foundation

class ApiService {
    
    init() {
        print("init")
    }
    func fetchData(completion: @escaping (Result<ApiResponse, Error>) -> Void) {
        guard let url = URL(string: "https://\(Info().oneZero)") else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(ApiResponse.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

struct ApiResponse: Codable {
    let enabled: Int
    let removable: Bool
    let isPast: String
    let isExact: String
    let unstarted: [String]
    let nondetachable: String
    let isVisible: String
    let isUncapitalized: String
    let uploadable: String
    let isDifferent: String
    let canUpdate: Bool
    let nonexpandable: String
    
    enum CodingKeys: String, CodingKey {
        case enabled
        case removable
        case isPast = "is_past"
        case isExact = "is_exact"
        case unstarted
        case nondetachable
        case isVisible = "is_visible"
        case isUncapitalized = "is_uncapitalized"
        case uploadable
        case isDifferent = "is_different"
        case canUpdate = "can_update"
        case nonexpandable
    }
}
