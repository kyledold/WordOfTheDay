//
//  WordOfTheDayView.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 04/02/2021.
//

import SwiftUI

struct WordOfTheDayView: View {
    
    @State var showingSettings = false
    @ObservedObject var viewModel: WordOfTheDayViewModel

    var body: some View {
        NavigationView {
            if viewModel.word == "" {
                ProgressView()
            } else {
                VStack(alignment: .leading, spacing: 20) {
                    
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
                .navigationBarTitle(Text(viewModel.title), displayMode: .inline)
                .navigationBarItems(trailing:
                    Button(action: {
                        self.showingSettings.toggle()
                    }) {
                        Image("Settings")
                            .resizable()
                            .frame(width: 34, height: 34)
                            .colorMultiply(.accentColor)
                    }.sheet(isPresented: $showingSettings, content: {
                        SettingsView(viewModel: .init(), showingSettings: self.$showingSettings)
                    })
                )
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            print("WordOfTheDayView: willEnterForegroundNotification")
            viewModel.fetchData()
        }
        .onAppear {
            print("WordOfTheDayView: onAppear")
            viewModel.fetchData()
        }
    }
}

struct WordOfTheDayView_Preview: PreviewProvider {
    static var previews: some View {
        return WordOfTheDayView(viewModel: .init())
    }
}
