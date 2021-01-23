//
//  HomeViewModel.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 19/01/2021.
//

import Foundation
import NetworkKit

class HomeViewModel: ObservableObject {

    @Published private(set) var items: [HomeItem] = [.feedback, .openSource]

    let feedbackURL = URL(string: "mailto:kdold02@gmail.com")!
    let gitHubRepoURL = URL(string: "https://github.com/kyledold/WordOfTheDay")!
}

