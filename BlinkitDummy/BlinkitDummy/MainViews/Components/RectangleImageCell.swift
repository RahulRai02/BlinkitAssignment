//
//  RectangleImageCell.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 25/09/24.
//

import SwiftUI

struct RectangleImageCell: View {
    let categoryOrProductImage: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.gray.opacity(0.1))
                .frame(width: 70, height: 70)
                
            Image(categoryOrProductImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 55, height: 55)
                .clipped()
        }
    }
}

//#Preview {
//    RectangleImageCell()
//}
