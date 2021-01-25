//
//  WordOfTheDayViewModel.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 15/01/2021.
//

import Foundation
import NetworkKit
import WidgetKit

struct WordOfTheDayViewModel {
    
    var word: String { wordOfTheDay.word  ?? "" }
    var wordDescription: String { wordOfTheDay.definitions?.first?.text ?? "" }
    var wordExample: String { wordOfTheDay.examples?.first?.text ?? "" }
    var origin: String { wordOfTheDay.note  ?? "" }
    
    private let wordOfTheDay: WordOfTheDayDTO
    private let configuration: ConfigurationIntent
    
    public init(wordOfTheDay: WordOfTheDayDTO, configuration: ConfigurationIntent) {
        self.wordOfTheDay = wordOfTheDay
        self.configuration = configuration
    }
}

extension WordOfTheDayViewModel: TimelineEntry {
    
    var date: Date { wordOfTheDay.publishDate?.date ?? Date() }
}
