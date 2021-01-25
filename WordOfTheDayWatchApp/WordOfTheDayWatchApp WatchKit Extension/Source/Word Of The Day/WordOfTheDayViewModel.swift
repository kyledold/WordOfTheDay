//
//  WordOfTheDayViewModel.swift
//  WordOfTheDayWatchApp WatchKit Extension
//
//  Created by Kyle Dold on 25/01/2021.
//

import NetworkKit
import SwiftUI

class WordOfTheDayViewModel: ObservableObject {
    
    @Published var word = ""
    @Published var wordDescription = ""
    @Published var wordExample = ""
    @Published var origin = ""
    
    init() {
        loadData()
    }
    
    private func loadData() {
        
        API.getWordOfTheDay(for: Date()) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let wordOfTheDayResponse):
                self.word = wordOfTheDayResponse.word  ?? ""
                self.wordDescription = wordOfTheDayResponse.definitions?.first?.text ?? ""
                self.wordExample = wordOfTheDayResponse.examples?.first?.text ?? ""
                self.origin = wordOfTheDayResponse.note  ?? ""
                
            case .failure:
                break
            }
        }
    }
}
