//
//  WordOfTheDayViewModel.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 04/02/2021.
//

import AVFoundation
import NetworkKit
import SwiftUI
import WidgetKit

class WordOfTheDayViewModel: ObservableObject {
    
    // Localized String Keys
      @Published var title: String = LocalizedStringsManager.shared.title
      @Published var definitionText: String = LocalizedStringsManager.shared.definitionText
      @Published var exampleText: String = LocalizedStringsManager.shared.exampleText
      @Published var originText: String = LocalizedStringsManager.shared.originText
      
      // Accessibility Labels
      @Published var definitionAccessibilityLabel: String?
      @Published var exampleAccessibilityLabel: String?
      @Published var originAccessibilityLabel: String?
      @Published var wordOfTheDayAccessibilityLabel: String?
      @Published var partOfSpeechAccessibilityLabel: String?
      @Published var audioButtonAccessibilityLabel: String = LocalizedStringsManager.shared.audioButtonAccessibilityLabel
      

    @Published var word = ""
    @Published var partOfSpeech = ""
    @Published var wordDescription = ""
    @Published var wordExample = ""
    @Published var origin = ""
    
    func fetchData() {
        print("WordOfTheDayViewModel: fetchData")
        API.getWordOfTheDay(for: Date()) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let wordOfTheDayResponse):
                
                if self.word != wordOfTheDayResponse.word {
                    self.refreshWidget()
                }
                
                self.word = wordOfTheDayResponse.word  ?? ""
                self.partOfSpeech = wordOfTheDayResponse.definitions?.first?.partOfSpeech ?? ""
                self.wordDescription = wordOfTheDayResponse.definitions?.first?.text ?? ""
                self.wordExample = wordOfTheDayResponse.examples?.first?.text ?? ""
                self.origin = wordOfTheDayResponse.note  ?? ""
                
                self.setupAccessibilityLabels()
                
            case .failure:
                break
            }
        }
    }
    
    func audioButtonTapped() {
        print("WordOfTheDayViewModel: audioButtonTapped")
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let error as NSError {
            print("WordOfTheDayViewModel AVAudioSession error: \(error.localizedDescription)")
        }
        
        let utterance = AVSpeechUtterance(string: word)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")

        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
    private func setupAccessibilityLabels() {
        guard !word.isEmpty else { return }
        
        wordOfTheDayAccessibilityLabel = LocalizedStringKey("word_of_the_day.word.\(word).accessibility_label")
        partOfSpeechAccessibilityLabel = LocalizedStringKey("word_of_the_day.part_of_speech.\(partOfSpeech).accessibility_label")
        definitionAccessibilityLabel = "\(definitionText.stringValue()), \(wordDescription)"
        exampleAccessibilityLabel = "\(exampleText.stringValue()), \(wordExample)"
        originAccessibilityLabel = "\(originText.stringValue()), \(origin)"
        
    }
    
    private func refreshWidget() {
        print("WordOfTheDayViewModel: refreshWidget")
        
        WidgetCenter.shared.reloadAllTimelines()
    }
}
