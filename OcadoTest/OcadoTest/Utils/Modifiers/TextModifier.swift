//
//  TextModifier.swift
//  OcadoTest
//
//  Created by Vladyslav Dikhtiaruk on 09/05/2025.
//

import Foundation
import SwiftUI

struct TextModifier: ViewModifier {
    let font: Font
    let fontColor: Color
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundStyle(fontColor)
            .background(backgroundColor)
    }
}

extension View {
    func customText(font: Font, color: Color, backgroundColor: Color = .clear) -> some View {
        self.modifier(TextModifier(font: font, fontColor: color, backgroundColor: backgroundColor))
    }
}
