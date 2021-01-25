//
//  WordOfTheDayWatchAppApp.swift
//  WordOfTheDayWatchApp WatchKit Extension
//
//  Created by Kyle Dold on 23/01/2021.
//

import SwiftUI

@main
struct WordOfTheDayWatchAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                WordOfTheDayView(viewModel: WordOfTheDayViewModel())
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
