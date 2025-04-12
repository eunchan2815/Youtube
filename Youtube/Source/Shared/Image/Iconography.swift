//
//  Iconography.swift
//  Youtube
//
//  Created by dgsw30 on 4/10/25.
//

import SwiftUI

enum Iconography: String {
    case logo = "Youtube"
}

extension Image {
    init(icon: Iconography) {
        self = Image(icon.rawValue)
    }
}
