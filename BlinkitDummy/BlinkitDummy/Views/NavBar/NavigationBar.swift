//
//  NavigationBar.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 07/08/24.
//

import SwiftUI

struct NavigationBar: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing:8){
            HStack{
                Button{
                    dismiss()
                }label:{
                    HStack(spacing:5){
                        Image(systemName: "arrow.backward")
                            .font(.system(size: 18).weight(.bold))
                            .foregroundColor(Color.black)
                        Text("Sauces & Spreads")
                            .font(.system(size:18).weight(.bold))
                            .foregroundColor(Color.black)
                    }
                    .frame(height: 44)
                }
                Spacer()
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 18))
                    .frame(width: 44, height: 44, alignment: .trailing)
                    .foregroundColor(Color.black)
                
                
            }
            .frame(height: 52)
        }
        .frame(height: 60, alignment: .top)
        .padding(.horizontal, 15)
        .padding(.top, 50)
        .background(Color.white)
        .frame(maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea()
        
    }
}

#Preview {
    NavigationBar()
}
