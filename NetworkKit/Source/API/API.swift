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
    
    static let APIKey = ""
    
    static let baseURL = "https://api.wordnik.com/v4/words.json"

    private static var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()

    // MARK: - Public Methods
    
    public static func getWordOfTheDay(for date: Date, completion: @escaping(_ result: Result<WordOfTheDayDTO?, Error>) -> Void) {
        
        guard let url = wordOfTheDayURL(for: date) else {
            return completion(.failure(URLError(.badURL)))
        }
        
        AF.request(url)
          .validate()
          .responseDecodable(of: WordOfTheDayDTO.self) { response in
            guard let wordOfTheDay = response.value else { return
                completion(.failure(ServiceError.serverError))
            }
            
            completion(.success(wordOfTheDay))
        }
    }
    
    // MARK: - Private Methods

    private static func wordOfTheDayURL(for date: Date) -> URL? {
        guard let url = URL(string: "\(baseURL)/wordOfTheDay?date=\(dateFormatter.string(from: date))&api_key=\(APIKey)'") else {
            return nil
        }
        
        return url
    }
}

public enum ServiceError: Error {
    case badUrl
    case serverError
}

