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
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18).weight(.medium))
                            .foregroundColor(.secondary)
                        Text("Sauces & Spreads")
                            .font(.title3)
                            .foregroundStyle(.primary)
                    }
                    .frame(height: 44)
                }
                Spacer()
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 18))
                    .frame(width: 44, height: 44, alignment: .trailing)
                
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
