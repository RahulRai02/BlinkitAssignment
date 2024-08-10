//
//  CircularPerecentageView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 11/08/24.
//

import SwiftUI

struct CircularPercentageView: View {
    var progress: CGFloat // Progress as a percentage between 0 and 1
    
    
    private let lineWidth: CGFloat = 3
    private let trackColor = Color.gray.opacity(0.3)
    private let progressColor = Color.green
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(trackColor, lineWidth: lineWidth)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(progressColor, lineWidth: lineWidth)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut, value: progress)
            
            Text(String(format: "%.0f%%", progress * 100))
                .font(.caption)
                .bold()
        }
        .frame(width: 50, height: 50)
    }
}


#Preview {
    CircularPercentageView(progress: 0.56)
}
