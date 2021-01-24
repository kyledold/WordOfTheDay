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
            .font(.custom("OpenSans-LightItalic", size: 14))
            .minimumScaleFactor(0.1)
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    public init() {}
}
