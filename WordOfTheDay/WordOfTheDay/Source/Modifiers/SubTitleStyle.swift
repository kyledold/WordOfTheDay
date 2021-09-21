//
//  SubTitleStyle.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 19/01/2021.
//

import SwiftUI

struct SubTitleStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .foregroundColor(.secondary)
    }
}

