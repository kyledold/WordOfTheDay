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
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 15) {
                
                Text(viewModel.word)
                    .modifier(TitleStyle())
                
                VStack(alignment: .leading) {
                    Text(LocalizedStringKey("word_of_the_day.definition"))
                        .modifier(SubTitleStyle())
                    Text(viewModel.wordDescription)
                        .modifier(BodyStyle())
                }
                
                VStack(alignment: .leading) {
                    Text(LocalizedStringKey("word_of_the_day.example"))
                        .modifier(SubTitleStyle())
                    Text(viewModel.wordExample)
                        .modifier(BodyStyle())
                }
                VStack(alignment: .leading) {
                    Text(LocalizedStringKey("word_of_the_day.origin"))
                        .modifier(SubTitleStyle())
                    Text(viewModel.origin)
                        .modifier(BodyStyle())
                }
                Spacer()
            }.padding()
        }
    }
}

struct WordOfTheDayView_Previews: PreviewProvider {
    static var previews: some View {
        WordOfTheDayView(viewModel: WordOfTheDayViewModel())
    }
}
