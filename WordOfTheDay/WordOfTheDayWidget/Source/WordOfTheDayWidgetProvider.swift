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
        print("WordOfTheDayWidgetProvider: placeholder")
        return ViewModel(date: Date(), wordOfTheDay: Self.sampleWordOfTheDay, configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (ViewModel) -> Void) {
        print("WordOfTheDayWidgetProvider: getSnapshot")
        
        let entry = ViewModel(date: Date(), wordOfTheDay: Self.sampleWordOfTheDay, configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<ViewModel>) -> Void) {
        print("WordOfTheDayWidgetProvider: getTimeline")
        
        let currentDate = Date()
        let startOfCurrentDate = calendar.startOfDay(for: currentDate)
        guard let refreshDate = calendar.date(byAdding: .hour, value: 4, to: startOfCurrentDate) else { return }
        
        API.getWordOfTheDay(for: currentDate) { result in
            var entry: ViewModel
            
            switch result {
            case .success(let wordOfTheDay):
                print("WordOfTheDayWidgetProvider: getTimeline success")
                entry = ViewModel(date: currentDate, wordOfTheDay: wordOfTheDay, configuration: configuration)
                
            case .failure(let error):
                print("WordOfTheDayWidgetProvider: getTimeline failure \(error.localizedDescription)")
                entry = ViewModel(date: currentDate, wordOfTheDay: nil, configuration: configuration)
            }
            
            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
            completion(timeline)
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
