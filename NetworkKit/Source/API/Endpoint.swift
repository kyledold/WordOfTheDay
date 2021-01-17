//
//  Endpoint.swift
//  NetworkKit
//
//  Created by Kyle Dold on 17/01/2021.
//

enum Endpoint {
    case wordOfTheDay(date: Date)
}

extension Endpoint {
    var url: URL {
        switch self {
        case .wordOfTheDay(let date):
            let endpoint = "wordOfTheDay?date=\(DateFormatter.shortDateFormatter.string(from: date))&api_key=\(API.APIKey)'"
            return .makeForEndpoint(endpoint)
        }
    }
}

extension URL {
    static func makeForEndpoint(_ endpoint: String) -> URL {
        URL(string: "https://api.wordnik.com/v4/words.json\(endpoint)")!
    }
}
