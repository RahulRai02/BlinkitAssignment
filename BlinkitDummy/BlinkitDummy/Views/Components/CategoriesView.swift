//
//  CategoriesView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 07/08/24.
//

import SwiftUI

struct CategoriesView: View {
    
    
    var body: some View {

        VStack{
            Image(.ketchup)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            Text("Tomato Ketchup")
                .font(.caption.weight(.light))
                .multilineTextAlignment(.center)
                .lineLimit(3)
                .frame(maxWidth: 70)
                .padding(.bottom,5)
        }
        .frame(width: 70, height: 90)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(5)
        
//        .background(Color.gray)
    }
}


#Preview {
    CategoriesView()
}
