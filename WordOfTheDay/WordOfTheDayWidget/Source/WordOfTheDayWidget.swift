//
//  WordOfTheDayWidget.swift
//  WordOfTheDayWidget
//
//  Created by Kyle Dold on 15/01/2021.
//

import WidgetKit
import SwiftUI
import Intents

@main
struct WordOfTheDayWidget: Widget {
    
    let kind: String = "WordOfTheDayWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: WordOfTheDayWidgetProvider()) { viewModel in
            WordOfTheDayWidgetEntryView(viewModel: viewModel)
        }
        .configurationDisplayName(LocalizedStringKey("display_name"))
        .description(LocalizedStringKey("description"))
        .supportedFamilies([.systemMedium, .systemLarge])
    }
}
