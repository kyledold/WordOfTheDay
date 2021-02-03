//
//  BodyStyle.swift
//  WordOfTheDayWatchApp WatchKit Extension
//
//  Created by Kyle Dold on 25/01/2021.
//

import SwiftUI

public struct BodyStyle: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .font(.body)
            .minimumScaleFactor(0.1)
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    public init() {}
}

