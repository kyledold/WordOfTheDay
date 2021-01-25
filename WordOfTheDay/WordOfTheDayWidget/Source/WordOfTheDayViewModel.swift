//
//  WordOfTheDayViewModel.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 15/01/2021.
//

import Foundation
import NetworkKit
import WidgetKit

class WordOfTheDayViewModel: ObservableObject {
    
    @Published var word = ""
    @Published var wordDescription = ""
    @Published var wordExample = ""
    @Published var origin = ""
    
    private let publishDate: Date
    private let configuration: ConfigurationIntent
    
    public init(wordOfTheDay: WordOfTheDayDTO, configuration: ConfigurationIntent) {
        self.word = wordOfTheDay.word  ?? ""
        self.wordDescription = wordOfTheDay.definitions?.first?.text ?? ""
        self.wordExample = wordOfTheDay.examples?.first?.text ?? ""
        self.origin = wordOfTheDay.note  ?? ""
        self.publishDate = wordOfTheDay.publishDate?.date ?? Date()
        self.configuration = configuration
    }
}

extension WordOfTheDayViewModel: TimelineEntry {
    
    var date: Date { publishDate }
}
