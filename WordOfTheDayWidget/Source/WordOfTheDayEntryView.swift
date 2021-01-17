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
        LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.vertical)
            .overlay(
                VStack(alignment: .leading, spacing: 10) {
                    Text("Sample")
                        .foregroundColor(Color.white)
                        .bold()
                    Text("This is the sample definition").italic()
                        .foregroundColor(Color.white)
                    Text("This is the sameple example usage")
                        .foregroundColor(Color.white)
                }
            )
    }
}
