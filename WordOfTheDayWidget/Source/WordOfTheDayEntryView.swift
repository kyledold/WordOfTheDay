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
        VStack(alignment: .leading, spacing: 10) {
            Text("Sample")
                .foregroundColor(Color.black)
                .bold()
            Text("This is the sample definition").italic()
                .foregroundColor(Color.black)
            Text("\"This is the sameple example usage\"")
                .foregroundColor(Color.black)
        }
    }
}
