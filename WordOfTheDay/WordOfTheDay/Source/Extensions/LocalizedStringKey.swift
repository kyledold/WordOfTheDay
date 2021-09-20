//
//  LocalizedStringKey.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 20/09/2021.
//

import SwiftUI

extension LocalizedStringKey {

    var stringKey: String {
        let description = "\(self)"
        let components = description.components(separatedBy: "key: \"").map { $0.components(separatedBy: "\",") }

        return components[1][0]
    }
    
    func stringValue() -> String {
        return NSLocalizedString(stringKey, comment: "")
    }
}
