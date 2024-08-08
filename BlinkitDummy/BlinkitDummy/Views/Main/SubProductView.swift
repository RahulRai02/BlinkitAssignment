//
//  SubProductView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 07/08/24.
//

import SwiftUI

struct SubProductView: View {
    var body: some View {
        
        
        VStack {
            NavigationBar()
                .frame(height: UIScreen.main.bounds.height * 0.05)
            GeometryReader{ geometry in
                HStack(spacing:0){
                    ScrollView{
                        VStack(spacing:0){
                            CategoriesView()
                            CategoriesView()
                            CategoriesView()
                            CategoriesView()
                            CategoriesView()
                            CategoriesView()
                        }

                    }
                    .frame(width: geometry.size.width * 0.15)
                    
                    ScrollView {
                        
                    }
                    .background(Color.green)
                    .frame(width: geometry.size.width * 0.85)
                    
                }
                
            }
        }


    }
}

#Preview {
    SubProductView()
}
