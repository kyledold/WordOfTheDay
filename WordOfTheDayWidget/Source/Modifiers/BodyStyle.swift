//
//  BodyStyle.swift
//  InterfaceKit
//
//  Created by Kyle Dold on 18/01/2021.
//

import SwiftUI

public struct BodyStyle: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .font(.custom("OpenSans-LightItalic", size: 16))
            .foregroundColor(.black)
    }
    
    public init() {}
}
