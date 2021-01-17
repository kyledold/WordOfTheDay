//
//  DateFormatter.swift
//  NetworkKit
//
//  Created by Kyle Dold on 17/01/2021.
//

import Foundation

extension DateFormatter {
    
    static var shortDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
}
