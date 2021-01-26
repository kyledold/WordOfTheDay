//
//  WordOfTheDayWidgetProvider.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 15/01/2021.
//

import WidgetKit
import SwiftUI
import NetworkKit
import Intents

struct WordOfTheDayWidgetProvider: IntentTimelineProvider {
    
    public typealias ViewModel = WordOfTheDayViewModel
    
    private let calendar = Calendar.current
    
    func placeholder(in context: Context) -> ViewModel {
        ViewModel(wordOfTheDay: Self.sampleWordOfTheDay, configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (ViewModel) -> Void) {
        let entry = ViewModel(wordOfTheDay: Self.sampleWordOfTheDay, configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<ViewModel>) -> Void) {
        // Generate a timeline with one entry that refreshes at midnight.
        let currentDate = Date()
        let startOfDay = calendar.startOfDay(for: currentDate)
        let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
        
        API.getWordOfTheDay(for: currentDate) { result in
            switch result {
            case .success(let wordOfTheDay):
                let entry = ViewModel(wordOfTheDay: wordOfTheDay, configuration: configuration)
                let timeline = Timeline(entries: [entry], policy: .after(endOfDay))
                completion(timeline)
                
            case .failure:
                break
            }
        }
    }
}

extension WordOfTheDayWidgetProvider {
    
    static var sampleWordOfTheDay: WordOfTheDayDTO {
        return WordOfTheDayDTO(
            word: "nomothetic",
            note: "The word 'nomothetic' comes from a Greek word meaning 'relating to legislation'",
            definitions: [
                DefinitionDTO(
                    source: "century",
                    text: "Noting a science which aims",
                    note: nil,
                    partOfSpeech: "adjective"
                )
            ],
            examples: [
                ExampleDTO(
                    title: "The Bass Handbook of Leadership",
                    text: "The nomothetic approach tries to draw inferences from a more limited exposure to a large number of cases.",
                    id: 1121006194
                )
            ]
        )
    }
}
