//
//  HeaderView.swift
//  Youtube
//
//  Created by dgsw30 on 4/9/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack(spacing: 20) {
            Image(icon: .logo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 25)
            
            Spacer(minLength: 0)
            
            Button("", systemImage: "airplayvideo") {}
            Button("", systemImage: "bell") {}
            Button("", systemImage: "magnifyingglass") {}
        }
        .font(.title3)
        .foregroundStyle(.primary)
        .padding(.horizontal, 15)
    }
}

#Preview {
    HeaderView()
}
