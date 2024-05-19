//
//  APIService.swift
//  iSport
//
//  Created by Elisa Kalil on 18/05/24.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    private init() {}
    
    func fetchSports(completion: @escaping ([Sport]?) -> Void) {
        guard let url = Bundle.main.url(forResource: "mock_data", withExtension: "json") else {
            completion(nil)
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let sports = try JSONDecoder().decode([Sport].self, from: data)
            completion(sports)
        } catch {
            print("Error decoding JSON: \(error)")
            completion(nil)
        }
    }
}

