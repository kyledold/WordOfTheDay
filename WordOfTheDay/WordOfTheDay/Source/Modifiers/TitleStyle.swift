//
//  TitleStyle.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 19/01/2021.
//

import SwiftUI

struct TitleStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.primary)
            .minimumScaleFactor(0.1)
            .lineLimit(1)
    }
}
