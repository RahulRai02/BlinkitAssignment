//
//  customButton.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 08/08/24.
//

import SwiftUI

struct customButton<Content: View>: View {
//    let buttonTitle: String
    let width: CGFloat
    let height: CGFloat
    let content: () -> Content
    
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
//            Text(buttonTitle)
//                .font(.caption)
//                .fontWeight(.medium)
//                .frame(width: width, height: height)
//                .foregroundColor(.green)
            content()
                .frame(width: width, height: height)
            
                

        }
    }
}

#Preview {
//    customButton(buttonTitle: "ADD", width: 260, height: 50)
    customButton(width: 260, height: 50) {
        Text("ADD")
    }
}
