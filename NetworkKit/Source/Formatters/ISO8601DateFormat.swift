//
//  ISO8601DateFormat.swift
//  NetworkKit
//
//  Created by Kyle Dold on 24/01/2021.
//

public struct ISO8601DateFormat: FormattedDate {
    
    public static var formatter: DateFormatter = .iso8601Full
    public let date: Date
    
    public init(date: Date) {
        self.date = date
    }
}
