//
//  DummyView.swift
//  Youtube
//
//  Created by dgsw30 on 4/9/25.
//

import SwiftUI
import Shimmer

struct DummyView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            RoundedRectangle(cornerRadius: 6)
                .frame(height: 220)
            
            HStack(spacing: 10) {
                Circle()
                    .frame(width: 45, height: 45)
                
                VStack(alignment: .leading, spacing: 4) {
                    Rectangle()
                        .frame(height: 10)
                    
                    HStack(spacing: 10) {
                        Rectangle().frame(width: 100)
                        Rectangle().frame(width: 80)
                        Rectangle().frame(width: 60)
                    }
                    .frame(height: 10)
                }
            }
        }
        .foregroundStyle(.tertiary)
        .redacted(reason: .placeholder)
        .shimmering()
    }
}

#Preview {
    DummyView()
}
