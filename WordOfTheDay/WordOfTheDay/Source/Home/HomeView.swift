//
//  HomeView.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 14/01/2021.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            Text(LocalizedStringKey("app.title"))
                .modifier(HeadingStyle())
            List {
                Section {
                    ForEach(viewModel.items, id: \.rawValue) { item in
                        Button(action: { handleTapOnItem(item) }) {
                            HomeRow(item: item)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
    }
    
    private func handleTapOnItem(_ item: HomeItem) {
        switch item {
        case .feedback: openURL(viewModel.feedbackURL)
        case .openSource: openURL(viewModel.gitHubRepoURL)
        }
    }

    private func openURL(_ url: URL) {
        guard UIApplication.shared.canOpenURL(url) else { return }
        
        UIApplication.shared.open(url)
    }
}
