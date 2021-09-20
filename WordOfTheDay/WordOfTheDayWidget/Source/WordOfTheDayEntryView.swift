//
//  WordOfTheDayEntryView.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 15/01/2021.
//

import SwiftUI
import WidgetKit

struct WordOfTheDayWidgetEntryView: View {
    
    @Environment(\.widgetFamily) var widgetFamily
    @ObservedObject var viewModel: WordOfTheDayViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            if viewModel.word.isEmpty {
                Text(viewModel.errorText)
                    .modifier(BodyStyle())
            } else {
                Text(viewModel.word)
                    .modifier(TitleStyle())
                    .accessibility(label: Text(viewModel.wordOfTheDayAccessibilityLabel ?? ""))
                
                VStack(alignment: .leading) {
                    Text(viewModel.definitionText)
                        .modifier(SubTitleStyle())
                    Text(viewModel.wordDescription)
                        .modifier(BodyStyle())
                }
                .accessibilityElement(children: .combine)
                .accessibility(label: Text(viewModel.definitionAccessibilityLabel ?? ""))
                
                if case .systemLarge = widgetFamily {
                    VStack(alignment: .leading) {
                        Text(viewModel.exampleText)
                            .modifier(SubTitleStyle())
                        Text(viewModel.wordExample)
                            .modifier(BodyStyle())
                    }
                    .accessibilityElement(children: .combine)
                    .accessibility(label: Text(viewModel.exampleAccessibilityLabel ?? ""))
                    
                    VStack(alignment: .leading) {
                        Text(viewModel.originText)
                            .modifier(SubTitleStyle())
                        Text(viewModel.origin)
                            .modifier(BodyStyle())
                    }
                    .accessibilityElement(children: .combine)
                    .accessibility(label: Text(viewModel.originAccessibilityLabel ?? ""))
                }
                
                #if DEBUG
                Text(DateFormatter.defaultDateFormatter.string(from: viewModel.date))
                    .modifier(SubTitleStyle())
                #endif
                
                Spacer()
            }
        }.padding()
    }
}

struct WordOfTheDayWidgetEntryView_Preview: PreviewProvider {
    static var previews: some View {
        return WordOfTheDayWidgetEntryView(
            viewModel: WordOfTheDayViewModel(
                date: Date(),
                wordOfTheDay: WordOfTheDayWidgetProvider.sampleWordOfTheDay,
                configuration: ConfigurationIntent()
            )
        ).previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
