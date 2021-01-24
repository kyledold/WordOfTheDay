//
//  API.swift
//  NetworkKit
//
//  Created by Kyle Dold on 16/01/2021.
//

import Alamofire
import Foundation

public struct API {
    
    // MARK: - Private Properties
    
    static let APIKey = "a2qxow9tr8xm3mtclhmeayell2hjcifc48mcez06hcelvmkev"

    // MARK: - Public Methods
    
    public static func getWordOfTheDay(for date: Date, completion: @escaping(_ result: Result<WordOfTheDayDTO?, Error>) -> Void) {
        
        AF.request(Endpoint.wordOfTheDay(date: date).url)
          .validate()
          .responseDecodable(of: WordOfTheDayDTO.self) { response in
            guard let wordOfTheDay = response.value else { return
                completion(.failure(ServiceError.serverError))
            }
            
            completion(.success(wordOfTheDay))
        }
    }
}

public enum ServiceError: Error {
    case badUrl
    case serverError
}

