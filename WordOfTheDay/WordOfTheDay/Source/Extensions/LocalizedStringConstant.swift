//
//  LocalizedStringConstant.swift
//  WordOfTheDay
//
//  Created by MacBook AIR on 05/07/2024.
//

import Foundation
class LocalizedStringConstant {
    static let shared = LocalizedStringConstant()
    
    // Localized String Keys
    let title = "app.title"
    let definitionText = "word_of_the_day.definition"
    let exampleText = "word_of_the_day.example"
    let originText = "word_of_the_day.origin"
    let audioButtonAccessibilityLabel = "word_of_the_day.audio.button.accessibility_label"
    
    // Accessibility Labels
    var definitionAccessibilityLabel: String?
    var exampleAccessibilityLabel: String?
    var originAccessibilityLabel: String?
    var wordOfTheDayAccessibilityLabel: String?
    var partOfSpeechAccessibilityLabel: String?
    
    private init() {
        // Initialize accessibility labels with localized strings
        self.definitionAccessibilityLabel = NSLocalizedString("definition.accessibility_label", comment: "")
        self.exampleAccessibilityLabel = NSLocalizedString("example.accessibility_label", comment: "")
        self.originAccessibilityLabel = NSLocalizedString("origin.accessibility_label", comment: "")
        self.wordOfTheDayAccessibilityLabel = NSLocalizedString("word_of_the_day.accessibility_label", comment: "")
        self.partOfSpeechAccessibilityLabel = NSLocalizedString("part_of_speech.accessibility_label", comment: "")
    }
}
