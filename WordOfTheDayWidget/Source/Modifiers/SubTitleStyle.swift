//
//  SubTitleStyle.swift
//  InterfaceKit
//
//  Created by Kyle Dold on 18/01/2021.
//

import SwiftUI

public struct SubTitleStyle: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .font(.custom("Trirong-Light", size: 18))
            .foregroundColor(.primary)
    }
    
    public init() {}
}
