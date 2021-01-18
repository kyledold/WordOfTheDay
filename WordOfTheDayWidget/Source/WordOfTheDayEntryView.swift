//
//  WordOfTheDayEntryView.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 15/01/2021.
//

import SwiftUI

struct WordOfTheDayWidgetEntryView: View {
    
    @Environment(\.widgetFamily) var widgetFamily
    var entry: WordOfTheDayWidgetProvider.Entry

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Sample")
                .modifier(TitleStyle())
            Text("This is the sample definition")
                .modifier(SubTitleStyle())
            
            if case .systemLarge = widgetFamily {
                Text("\"This is the sameple example usage\"")
                    .modifier(BodyStyle())
            }
        }
    }
}
