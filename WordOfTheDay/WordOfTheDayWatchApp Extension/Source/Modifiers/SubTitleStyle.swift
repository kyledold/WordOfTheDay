//
//  SubTitleStyle.swift
//  WordOfTheDayWatchApp WatchKit Extension
//
//  Created by Kyle Dold on 25/01/2021.
//

import SwiftUI

public struct SubTitleStyle: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .font(.footnote)
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    public init() {}
}
