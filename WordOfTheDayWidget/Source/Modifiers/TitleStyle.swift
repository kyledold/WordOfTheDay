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
            .font(.custom("Merriweather-Regular", size: 20))
            .foregroundColor(.black)
    }
    
    public init() {}
}

