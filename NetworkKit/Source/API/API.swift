//
//  API.swift
//  NetworkKit
//
//  Created by Kyle Dold on 16/01/2021.
//

import Alamofire
import Foundation

public struct API {
    
    public static func getWordOfTheDay(for date: Date) {
        AF.request("https://api.wordnik.com/v4/words.json/wordOfTheDay?date=2021-01-15&api_key=YOURAPIKEY'")
          .validate()
          .responseDecodable(of: WordOfTheDayDTO.self) { response in
            guard let wordOfTheDay = response.value else { return }
            
        }
    }
}
