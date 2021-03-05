//
//  DateFormatterExtension.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 05/03/2021.
//

import Foundation

extension DateFormatter {
    
    static var defaultDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
        return dateFormatter
    }()
}
