//
//  ScrollViewWithBottomShadow.swift
//  SwiftTest
//
//  Created by Rajat Jangra on 30/11/23.
//

import SwiftUI

struct ScrollViewWithBottomShadow: View {
    
    @State var showBottomShadow: Bool = false
    
    var body: some View {
        ScrollViewOffsetReader(.vertical, showIndicators: false, hasScrolledToEnd: $showBottomShadow) {
            
            VStack(alignment: .leading, spacing: 24) {
                Text("Screen Title")
                    .font(.title)
                ForEach(1..<100) { i in
                    Text("\(i) Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ei")
                    
                }
                Text("Screen Bottom")
            }
            
            .padding()
        }
        .overlay(alignment: .bottom) {
            bottomShadow
        }
    }
    
    @ViewBuilder
    private var bottomShadow: some View {
        let blur = 5.0
        LinearGradient(colors: [.black.opacity(0.2), .clear], startPoint: .bottom, endPoint: .top)
            .frame(height: blur * 2)
            .blur(radius: blur)
            .padding(.horizontal, blur)
            .offset(y: blur)
            .clipped()
            .opacity(showBottomShadow ? 0 : 1)
            .animation(.easeInOut, value: showBottomShadow)
    }
}

#Preview {
    ScrollViewWithBottomShadow()
}
