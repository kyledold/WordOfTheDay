//
//  FormattedDate.swift
//  NetworkKit
//
//  Created by Kyle Dold on 24/01/2021.
//

public protocol FormattedDate: Codable {
    static var formatter: DateFormatter { get }
    var date: Date { get }
    init(date: Date)
}

extension FormattedDate {

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)

        guard let date = Self.formatter.date(from: string) else {
            let debug = "Date string does not match format expected by formatter."
            throw DecodingError.dataCorruptedError(in: container, debugDescription: debug)
        }

        self.init(date: date)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        let string = Self.formatter.string(from: self.date)
        try container.encode(string)
    }
}
