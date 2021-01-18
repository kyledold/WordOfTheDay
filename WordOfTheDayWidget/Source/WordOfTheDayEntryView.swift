//
//  WordOfTheDayEntryView.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 15/01/2021.
//

import SwiftUI
import InterfaceKit

struct WordOfTheDayWidgetEntryView: View {
    
    var entry: WordOfTheDayWidgetProvider.Entry

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Sample")
                .modifier(TitleStyle())
            Text("This is the sample definition")
                .modifier(SubTitleStyle())
            Text("\"This is the sameple example usage\"")
                .modifier(BodyStyle())
        }
    }
}
