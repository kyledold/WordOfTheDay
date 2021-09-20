//
//  WordOfTheDayViewModel.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 15/01/2021.
//

import Foundation
import NetworkKit
import WidgetKit
import SwiftUI

class WordOfTheDayViewModel: ObservableObject, TimelineEntry {
    
    var date: Date
    
    let definitionText = LocalizedStringKey("entry_view.definition")
    let exampleText = LocalizedStringKey("entry_view.example")
    let originText = LocalizedStringKey("entry_view.origin")
    let errorText = LocalizedStringKey("entry_view.error")
    
    var wordOfTheDayAccessibilityLabel: LocalizedStringKey?
    var definitionAccessibilityLabel: LocalizedStringKey?
    var exampleAccessibilityLabel: LocalizedStringKey?
    var originAccessibilityLabel: LocalizedStringKey?
    
    @Published var word = ""
    @Published var wordDescription = ""
    @Published var wordExample = ""
    @Published var origin = ""
    
    private let publishDate: Date
    private let configuration: ConfigurationIntent
    
    public init(date: Date, wordOfTheDay: WordOfTheDayDTO?, configuration: ConfigurationIntent) {
        self.date = date
        self.word = wordOfTheDay?.word  ?? ""
        self.wordDescription = wordOfTheDay?.definitions?.first?.text ?? ""
        self.wordExample = wordOfTheDay?.examples?.first?.text ?? ""
        self.origin = wordOfTheDay?.note  ?? ""
        self.publishDate = wordOfTheDay?.publishDate?.date ?? Date()
        self.configuration = configuration
        
        self.setupAccessibilityLabels()
    }
    
    private func setupAccessibilityLabels() {
        guard !word.isEmpty else { return }
        
        wordOfTheDayAccessibilityLabel = LocalizedStringKey("\(word).accessibility_label")
        definitionAccessibilityLabel = "\(definitionText.stringValue()), \(wordDescription)"
        exampleAccessibilityLabel = "\(exampleText.stringValue()), \(wordExample)"
        originAccessibilityLabel = "\(originText.stringValue()), \(origin)"
    }
}
