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
}

