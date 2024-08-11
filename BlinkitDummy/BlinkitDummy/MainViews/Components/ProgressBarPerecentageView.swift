//
//  CircularPerecentageView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 11/08/24.
//


import SwiftUI

struct ProgressBarWithPercentageView: View {
    var progress: CGFloat // Progress as a percentage between 0 and 1
    
    private let trackHeight: CGFloat = 2
    private let trackColor = Color.gray.opacity(0.3)
    private let gradientColors = [Color.green.opacity(0.2), Color.green]
    
    
    var body: some View {
        VStack(spacing: 5) {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: trackHeight / 2)
                    .frame(height: trackHeight)
                    .foregroundColor(trackColor)
                
                RoundedRectangle(cornerRadius: trackHeight / 2)
                
                    .frame(width: min(max(progress, 0), 1) * 100, height: trackHeight)
                
                    .foregroundStyle(LinearGradient(
                        gradient: Gradient(colors: gradientColors),
                        startPoint: .leading,
                        endPoint: .trailing
                    ))
                    .animation(.easeInOut, value: progress)
            }
        }
        .frame(width: 100)
    }
}



