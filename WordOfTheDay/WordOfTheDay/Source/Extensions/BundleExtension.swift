//
//  BundleExtension.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 14/01/2021.
//

import Foundation

extension Bundle {

    /// App's current version.
    static var version: String? { return main.infoDictionary?["CFBundleShortVersionString"] as? String }
}

