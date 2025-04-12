//
//  FlexibleScrollView.swift
//  Youtube
//
//  Created by dgsw30 on 4/9/25.
//

import SwiftUI

//iOS 18
public struct FlexibleScrollView<Content: View, Header: View>: View {
    @State private var naturalScrollOffset: CGFloat = 0
    @State private var lastNautralOffset: CGFloat = 0
    @State private var headerOffset: CGFloat = 0
    @State private var isScrollingUp: Bool = false
    let content: () -> Content
    let header: () -> Header
    
    public init (
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder header: @escaping () -> Header
    ) {
        self.content = content
        self.header = header
    }
    
    public var body: some View {
        GeometryReader {
            let safeArea = $0.safeAreaInsets
            let headerHeight = 60 + safeArea.top
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 15) {
                    content()
                }
                .padding(15)
            }
            .refreshable {}
            .safeAreaInset(edge: .top, spacing: 0) {
                header()
                    .padding(.bottom, 15)
                    .frame(height: headerHeight, alignment: .bottom)
                    .background(.background)
                    .offset(y: -headerOffset)
            }
            .onScrollGeometryChange(for: CGFloat.self) { proxy in
                let scrollY = proxy.contentOffset.y
                return max(scrollY, 0)
            } action: { oldValue, newValue in
                let isScrollingUp = oldValue < newValue
                self.isScrollingUp = isScrollingUp
                
                let delta = newValue - lastNautralOffset
                headerOffset = min(max(delta, 0), headerHeight)
                naturalScrollOffset = newValue
            }
            .onScrollPhaseChange({ oldPhase, newPhase, content in
                if !newPhase.isScrolling && (headerOffset != 0 && headerOffset != headerHeight) {
                    withAnimation(.snappy(duration: 0.25, extraBounce: 0)) {
                        if headerOffset > (headerHeight * 0.5) && naturalScrollOffset > headerHeight {
                            headerOffset = headerHeight
                        } else {
                            headerOffset = 0
                        }
                        lastNautralOffset = naturalScrollOffset - headerOffset
                    }
                }
            })
            .onChange(of: isScrollingUp) { _, _ in
                lastNautralOffset = naturalScrollOffset - headerOffset
            }
            .ignoresSafeArea(.container, edges: .top)
        }
    }
}
