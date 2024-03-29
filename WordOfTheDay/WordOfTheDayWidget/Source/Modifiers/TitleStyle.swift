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
            .frame(height: 15, alignment: .leading)
            .minimumScaleFactor(0.8)
            .fixedSize()
    }
    
    public init() {}
}

