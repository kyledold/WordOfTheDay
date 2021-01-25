//
//  WordOfTheDayViewModel.swift
//  WordOfTheDayWatchApp WatchKit Extension
//
//  Created by Kyle Dold on 25/01/2021.
//

import NetworkKit

struct WordOfTheDayViewModel {
    
    var word: String { wordOfTheDay.word  ?? "" }
    var wordDescription: String { wordOfTheDay.definitions?.first?.text ?? "" }
    var wordExample: String { wordOfTheDay.examples?.first?.text ?? "" }
    var origin: String { wordOfTheDay.note  ?? "" }
    
    private let wordOfTheDay: WordOfTheDayDTO
    
    public init(wordOfTheDay: WordOfTheDayDTO) {
        self.wordOfTheDay = wordOfTheDay
    }
}
