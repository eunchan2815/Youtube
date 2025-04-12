//
//  CustomFonts.swift
//  Youtube
//
//  Created by dgsw30 on 4/10/25.
//

import SwiftUI

enum Typography: String {
    case bold = "Pretendard-Bold"
    case light = "Pretendard-Light"
    case medium = "Pretendard-Medium"
    case regular = "Pretendard-Regular"
    case semibold = "Pretendard-Semibold"
    case thin = "Pretendard-Thin"
}

extension Font {
    static func customFont(_ font: Typography, size: CGFloat) -> Font {
        Font.custom(font.rawValue, size: size)
    }
    
    static func bold(_ size: CGFloat) -> Font {
        customFont(.bold, size: size)
    }
    
    static func light(_ size: CGFloat) -> Font {
        customFont(.light, size: size)
    }
    
    static func medium(_ size: CGFloat) -> Font {
        customFont(.medium, size: size)
    }
    
    static func regular(_ size: CGFloat) -> Font {
        customFont(.regular, size: size)
    }
    
    static func semibold(_ size: CGFloat) -> Font {
        customFont(.semibold, size: size)
    }
    
    static func thin(_ size: CGFloat) -> Font {
        customFont(.thin, size: size)
    }
}
