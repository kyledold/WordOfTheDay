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

    /// App's current build number.
    static var build: String? { return Bundle.main.infoDictionary?["CFBundleVersion"] as? String }

    /// App's current version and build number.
    static var fullVersion: String? {
        guard let version = version else { return nil }
        guard let build = build else { return version }
        return "\(version) (\(build))"
    }
}

