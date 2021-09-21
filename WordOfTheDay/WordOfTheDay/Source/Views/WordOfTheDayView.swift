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
                ScrollView {
                    wordInformationView
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
    
    private var wordInformationView: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            VStack(alignment: .leading) {
                HStack(alignment: .firstTextBaseline) {
                    Text(viewModel.word)
                        .accessibility(label: Text(viewModel.wordOfTheDayAccessibilityLabel ?? ""))
                        .modifier(TitleStyle())
                    
                    Button(action: {
                        viewModel.audioButtonTapped()
                    }, label: {
                        Image(systemName: "speaker.2")
                            .accessibility(label: Text(viewModel.audioButtonAccessibilityLabel))
                    })
                    .disabled(viewModel.word.isEmpty)
                }
                if !viewModel.partOfSpeech.isEmpty {
                    Text(viewModel.partOfSpeech)
                        .italic()
                        .modifier(BodyStyle())
                        .accessibility(label: Text(viewModel.partOfSpeechAccessibilityLabel ?? ""))
                }
            }
            
            VStack(alignment: .leading) {
                Text(viewModel.definitionText)
                    .modifier(SubTitleStyle())
                
                Text(viewModel.wordDescription)
                    .modifier(BodyStyle())
            }
            .accessibilityElement(children: .combine)
            .accessibility(label: Text(viewModel.definitionAccessibilityLabel ?? ""))
            
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
            
            Spacer()
        }
        .padding()
    }
}

struct WordOfTheDayView_Preview: PreviewProvider {
    static var previews: some View {
        return WordOfTheDayView(viewModel: .init())
    }
}
