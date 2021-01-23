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
            .font(.custom("Merriweather-Regular", size: 24))
            .foregroundColor(.primary)
    }
    
    public init() {}
}

