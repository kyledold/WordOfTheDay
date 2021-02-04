//
//  TitleStyle.swift
//  InterfaceKit
//
//  Created by Kyle Dold on 18/01/2021.
//

import SwiftUI

public struct TitleStyle: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.primary)
            .minimumScaleFactor(0.1)
            .lineLimit(1)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    public init() {}
}

