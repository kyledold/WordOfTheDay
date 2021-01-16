//
//  DefinitionDTO.swift
//  NetworkKit
//
//  Created by Kyle Dold on 16/01/2021.
//

public struct DefinitionDTO: Decodable {
    public let source: String
    public let text: String
    public let note: String?
    public let partOfSpeech: String
}
