//
//  Setting.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 14/01/2021.
//

import SwiftUI

enum Setting: Int {

    case feedback, openSource

    var title: LocalizedStringKey {
        switch self {
        case .feedback: return "settings.row.feedback.title"
        case .openSource: return "settings.row.open.source.title"
        }
    }

    var subtitle: LocalizedStringKey {
        switch self {
        case .feedback: return "settings.row.feedback.subtitle"
        case .openSource: return "settings.row.open.source.subtitle"
        }
    }

    var image: String {
        switch self {
        case .feedback: return "at"
        case .openSource: return "swift"
        }
    }

    var color: Color {
        switch self {
        case .feedback: return .green
        case .openSource: return .orange
        }
    }
}
