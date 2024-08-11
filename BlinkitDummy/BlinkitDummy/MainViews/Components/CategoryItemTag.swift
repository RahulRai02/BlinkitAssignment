//
//  CategoryItemTag.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 08/08/24.
//

import SwiftUI

struct CategoryItemTag: View {
    let text: String
    let backgroundColor: Color
    let textColor: Color

    var body: some View {
        Text(text)
            .font(.system(size: 8, weight: .light))
            .foregroundColor(textColor)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(backgroundColor)
            .cornerRadius(8)
            
    }
}

#Preview {
    CategoryItemTag(text: "850 g", backgroundColor: Color.lightGrey, textColor: .blue)
}
