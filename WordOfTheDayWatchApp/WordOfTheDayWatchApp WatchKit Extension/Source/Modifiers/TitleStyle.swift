//
//  TitleStyle.swift
//  WordOfTheDayWatchApp WatchKit Extension
//
//  Created by Kyle Dold on 25/01/2021.
//

import SwiftUI

public struct TitleStyle: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .font(.custom("Merriweather-Regular", size: 18))
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    public init() {}
}

