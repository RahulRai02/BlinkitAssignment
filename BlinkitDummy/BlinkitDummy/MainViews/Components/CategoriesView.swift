//
//  CategoriesView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 07/08/24.
//

import SwiftUI

struct CategoriesView: View {
    let category: Category    
    let isSelected: Bool
    
    var body: some View {

        VStack{
            Image(category.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            Text(category.name)
                .font(.caption.weight(.light))
                .multilineTextAlignment(.center)
                .lineLimit(3)
                .frame(maxWidth: 70)
                .padding(.bottom,5)
                .padding(.horizontal, 5)
        }
        .frame(width: 70, height: 90)
        .background(isSelected ? Color.green.opacity(0.2) :Color.gray.opacity(0.1))
        .cornerRadius(2)
    }

}


