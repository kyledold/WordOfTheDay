//
//  BodyStyle.swift
//  WordOfTheDay
//
//  Created by Kyle Dold on 04/02/2021.
//

import SwiftUI

public struct BodyStyle: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
