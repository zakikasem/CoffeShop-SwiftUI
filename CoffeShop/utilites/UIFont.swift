//
//  UIFont.swift
//  CoffeShop
//
//  Created by Mohamed Ali on 05/08/2024.
//

import SwiftUI

enum Fonts: String {
    case mainFont = "Sora-Regular"
    case mainFontMeduim = "Sora-Medium"
    case mainFontBold = "Sora-Bold"
    case mainFontLight = "Sora-Light"
    case mainFontSemiBold = "Sora-SemiBold.ttf"
}

struct CustomFontModifier: ViewModifier {
    var fontName: Fonts
    var size: CGFloat

    func body(content: Content) -> some View {
        content
            .font(.custom(fontName.rawValue, size: size))
    }
}

extension View {
    
    func setFont(fontName: Fonts, size: CGFloat) -> some View {
        self.modifier(CustomFontModifier(fontName: fontName, size: size))
    }
}
