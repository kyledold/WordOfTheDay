//
//  API.swift
//  NetworkKit
//
//  Created by Kyle Dold on 16/01/2021.
//

import Alamofire
import Foundation

public struct API {

    // MARK: - Public Methods
    
    public static func getWordOfTheDay(for date: Date, completion: @escaping(_ result: Result<WordOfTheDayDTO, Error>) -> Void) {
        
        let endpoint = Endpoint.wordOfTheDay(date: date).url
        
        AF.request(endpoint)
          .responseDecodable(of: WordOfTheDayDTO.self) { response in
            guard let wordOfTheDay = response.value else {
                print("❌ \(endpoint) - \(String(describing: response.error))")
                return completion(.failure(ServiceError.serverError))
            }
            
            print("✅ \(endpoint)")
            completion(.success(wordOfTheDay))
        }
    }
}

public enum ServiceError: Error {
    case badUrl
    case serverError
}

