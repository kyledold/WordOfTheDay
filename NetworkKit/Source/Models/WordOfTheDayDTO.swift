//
//  WordOfTheDayDTO.swift
//  NetworkKit
//
//  Created by Kyle Dold on 16/01/2021.
//

import Foundation

public struct WordOfTheDayDTO: Decodable {
    public let word: String?
    public let category: String?
    public let note: String?
    public let definitions: [DefinitionDTO]?
    public let examples: [ExampleDTO]?
}
