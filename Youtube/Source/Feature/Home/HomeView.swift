//
//  HomeView.swift
//  Youtube
//
//  Created by dgsw30 on 4/9/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = VideoViewModel()
    var body: some View {
        FlexibleScrollView {
            if let videos = viewModel.videos {
                ForEach(videos, id: \.id) { videos in
                    VideoComponent(data: videos)
                }
            } else {
                ForEach(1...10, id: \.self) { _ in
                    DummyView()
                }
            }
        } header: {
            HeaderView()
        }
        .refreshable {}
        .onAppear {
            viewModel.fetchTrendingVideos("KR", 50)
        }
    }
}

#Preview {
    HomeView()
}
