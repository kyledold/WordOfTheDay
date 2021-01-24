//
//  WordOfTheDayDTO.swift
//  NetworkKit
//
//  Created by Kyle Dold on 16/01/2021.
//

import Foundation

public struct WordOfTheDayDTO: Decodable {
    
    public let word: String?
    public let note: String?
    public let definitions: [DefinitionDTO]?
    public let examples: [ExampleDTO]?
    public let publishDate: ISO8601DateFormat?
    
    public init(
        word: String?,
        note: String?,
        definitions: [DefinitionDTO]?,
        examples: [ExampleDTO]?
    ) {
        self.word = word
        self.note = note
        self.definitions = definitions
        self.examples = examples
        self.publishDate = nil
    }
}
