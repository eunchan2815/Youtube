//
//  VideoComponent.swift
//  Youtube
//
//  Created by dgsw30 on 4/9/25.
//

import SwiftUI
import Kingfisher

struct VideoComponent: View {
    let data: VideoModel
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            if let url = data.thumbnail {
                KFImage(URL(string: url))
                    .resizable()
                    .frame(height: 220)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(6)
                
            }
            HStack(spacing: 10) {
                if let url = data.uploaderProfileImage {
                    KFImage(URL(string: url))
                        .resizable()
                        .frame(width: 35, height: 35)
                        .cornerRadius(30)
                    
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(data.title ?? "알수없음")
                        .font(.medium(15))
                        .lineLimit(2)
                    
                    HStack(spacing: 10) {
                        Text(data.uploader ?? "알수없음")
                        Text(data.viewCount ?? "회")
                        Text(data.uploadTimeAgo ?? "시간전")
                    }
                    .font(.light(13))
                    .foregroundStyle(.gray)
                    .frame(height: 10)
                }
            }
            .foregroundStyle(.primary)
        }
    }
}
