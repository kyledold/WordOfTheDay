//
//  ExampleDTO.swift
//  NetworkKit
//
//  Created by Kyle Dold on 16/01/2021.
//

public struct ExampleDTO: Decodable {
    public let url: URL
    public let title: String
    public let text: String?
    public let id: Int
    
    public init(
        url: URL,
        title: String,
        text: String?,
        id: Int
    ) {
        self.url = url
        self.title = title
        self.text = text
        self.id = id
    }
}

