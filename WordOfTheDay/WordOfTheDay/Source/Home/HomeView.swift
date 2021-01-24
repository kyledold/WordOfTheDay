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
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
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
            .navigationBarTitle(Text(LocalizedStringKey("app.title")), displayMode: .inline)
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

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
