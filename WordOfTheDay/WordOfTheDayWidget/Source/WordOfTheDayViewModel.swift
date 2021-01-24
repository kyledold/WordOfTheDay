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
    
    let wordOfTheDay: WordOfTheDayDTO
    private let configuration: ConfigurationIntent
    
    public init(wordOfTheDay: WordOfTheDayDTO, configuration: ConfigurationIntent) {
        self.wordOfTheDay = wordOfTheDay
        self.configuration = configuration
    }
}

extension WordOfTheDayViewModel: TimelineEntry {
    
    var date: Date { wordOfTheDay.publishDate?.date ?? Date() }
}
