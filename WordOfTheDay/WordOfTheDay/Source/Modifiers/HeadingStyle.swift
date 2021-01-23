//
//  HeadingStyle.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 19/01/2021.
//

import SwiftUI

struct HeadingStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.custom("Merriweather-Regular", size: 32))
            .foregroundColor(.primary)
    }
}
