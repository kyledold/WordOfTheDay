//
//  WordOfTheDayWidgetProvider.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 15/01/2021.
//

import WidgetKit
import SwiftUI
import Intents

struct WordOfTheDayWidgetProvider: IntentTimelineProvider {
    
    private let calendar = Calendar.current
    
    func placeholder(in context: Context) -> WordOfTheDayEntry {
        WordOfTheDayEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (WordOfTheDayEntry) -> ()) {
        let entry = WordOfTheDayEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<WordOfTheDayEntry>) -> ()) {
        // Generate a timeline with one entry that refreshes at midnight.
        let currentDate = Date()
        let startOfDay = calendar.startOfDay(for: currentDate)
        let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
        
        let entry = WordOfTheDayEntry(date: startOfDay, configuration: configuration)
        let timeline = Timeline(entries: [entry], policy: .after(endOfDay))
        completion(timeline)
    }
}
