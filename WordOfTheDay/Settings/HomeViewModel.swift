//
//  HomeViewModel.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 19/01/2021.
//

import Foundation

class HomeViewModel: ObservableObject {

    @Published private(set) var items: [HomeItem] = [.feedback, .openSource]

    var feedbackURL: URL {
        URL(string: "mailto:kdold02@gmail.com")!
    }

    var openSourceURL: URL {
        URL(string: "https://github.com/kyledold/WordOfTheDay")!
    }

}

