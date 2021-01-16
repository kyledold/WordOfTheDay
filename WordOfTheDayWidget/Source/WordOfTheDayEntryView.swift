//
//  WordOfTheDayEntryView.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 15/01/2021.
//

import SwiftUI

struct WordOfTheDayWidgetEntryView: View {
    
    var entry: WordOfTheDayWidgetProvider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}
