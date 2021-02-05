//
//  WordOfTheDayView.swift
//  WordOfTheDayWatchApp WatchKit Extension
//
//  Created by Kyle Dold on 25/01/2021.
//

import SwiftUI

struct WordOfTheDayView: View {
    
    @ObservedObject var viewModel: WordOfTheDayViewModel
    
    var body: some View {
        VStack {
            if viewModel.word == "" {
                ProgressView()
            } else {
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 15) {
                        Text(viewModel.word)
                            .modifier(TitleStyle())

                        VStack(alignment: .leading) {
                            Text(viewModel.definitionText)
                                .modifier(SubTitleStyle())
                            Text(viewModel.wordDescription)
                                .modifier(BodyStyle())
                        }
                        
                        VStack(alignment: .leading) {
                            Text(viewModel.exampleText)
                                .modifier(SubTitleStyle())
                            Text(viewModel.wordExample)
                                .modifier(BodyStyle())
                        }
                        VStack(alignment: .leading) {
                            Text(viewModel.originText)
                                .modifier(SubTitleStyle())
                            Text(viewModel.origin)
                                .modifier(BodyStyle())
                        }
                        Spacer()
                    }
                    .padding()
                }
            }
        }.onAppear() {
            viewModel.fetchData()
        }
    }
}

struct WordOfTheDayView_Previews: PreviewProvider {
    static var previews: some View {
        WordOfTheDayView(viewModel: WordOfTheDayViewModel())
    }
}
