//
//  CategoryItemView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 08/08/24.
//

import SwiftUI

struct CategoryItemView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(color: Color.gray.opacity(0.3), radius: 5)
                .frame(width: 255, height: 300)
            
            VStack(alignment:.leading, spacing:2){
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.lightGrey)
                        .frame(width: 240, height: 200)
                    Image(.ketchup)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 150, alignment: .top)
                }
                .padding(.top, -10)

                HStack(){
                    CategoryItemTag(text: "850 g", backgroundColor: Color.lightGrey, textColor: .blue)
                    CategoryItemTag(text: "Tomato Ketchup", backgroundColor: Color.lightGrey, textColor: .blue)
                }
                
                Text("Kissan Fresh Tomato Ketchup")
                    .font(.system(size: 14).weight(.medium))
                
                Text("12 MINS")
                    .font(.system(size: 10).weight(.light))
                Text("₹ 100")
                    .font(.system(size: 15).weight(.bold))
            }
            
        }
    }
}

#Preview {
    CategoryItemView()
}
