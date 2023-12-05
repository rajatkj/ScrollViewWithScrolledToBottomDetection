//
//  ScrollViewWithBottomShadow.swift
//  SwiftTest
//
//  Created by Rajat Jangra on 30/11/23.
//

import SwiftUI

struct ScrollViewWithScrollToBottomDetectionView: View {
    
    @State var hasScrolledToEnd: Bool = false
    
    var body: some View {
        EndDetectionScrollView(.vertical, showIndicators: false, hasScrolledToEnd: $hasScrolledToEnd) {
            
            VStack(alignment: .leading, spacing: 0) {
                ForEach(0..<20) { i in
                    Text("\(i + 1) Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ei")
                        .foregroundStyle(.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(i.isMultiple(of: 2) ? .cyan : .mint)
                }
            }
        }
        .overlay(alignment: .bottom) {
            overlayView
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    private var overlayView: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .ignoresSafeArea()
            Text("You have \(hasScrolledToEnd ? "" : "not ")scrolled to bottom")
                .foregroundStyle(.black)
                .bold()
                .font(.title3)
        }
        .frame(height: 100)
        .animation(.easeInOut, value: hasScrolledToEnd)
    }
}

#Preview {
    ScrollViewWithScrollToBottomDetectionView()
}
