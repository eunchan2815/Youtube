//
//  PlayVideoView.swift
//  Youtube
//
//  Created by dgsw30 on 4/9/25.
//

import SwiftUI
import YouTubePlayerKit
import FlexibleKit

struct PlayVideoView: View {
    var body: some View {
        VStack {
            YouTubePlayerView(
                "https://www.youtube.com/watch?v=z8CNqUYASPE"
            )
            .roundedCorners(5, corners: .allCorners)
            .frame(maxWidth: .infinity)
            .frame(height: 210)
            .padding(2)
        }
        Spacer()
    }
}

#Preview {
    PlayVideoView()
}
