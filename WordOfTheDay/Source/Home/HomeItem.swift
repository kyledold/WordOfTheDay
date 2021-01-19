//
//  HomeItem.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 19/01/2021.
//

import SwiftUI

enum HomeItem: Int {

    case feedback, openSource

    var title: LocalizedStringKey {
        switch self {
        case .feedback: return LocalizedStringKey("home.feedback.title")
        case .openSource: return LocalizedStringKey("home.open_source.title")
        }
    }

    var subtitle: LocalizedStringKey {
        switch self {
        case .feedback: return LocalizedStringKey("home.feedback.subtitle")
        case .openSource: return LocalizedStringKey("home.open_source.subtitle")
        }
    }

    var systemImageName: String {
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

