//
//  customButton.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 08/08/24.
//

import SwiftUI

struct customButton: View {
    let buttonTitle: String
    let width: CGFloat
    let height: CGFloat
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .frame(width: width, height: height)
                .foregroundColor(.white)
                .overlay{
                    // MARK: CARD BORDER
                    RoundedRectangle(cornerRadius: 5)
                        .strokeBorder(.green.opacity(0.6))
//                        .blendMode(.lighten)
                }
            Text(buttonTitle)
                .font(.caption)
                .fontWeight(.medium)
                .frame(width: width, height: height)
                .foregroundColor(.green)
            
                

        }
    }
}

#Preview {
    customButton(buttonTitle: "ADD", width: 260, height: 50)
}
