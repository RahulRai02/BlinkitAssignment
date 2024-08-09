//
//  CustomScrollView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 09/08/24.
//

import Foundation
import SwiftUI

struct CustomScrollView<Content: View>: View{
    
    var content: Content
    @Binding var offset: CGPoint
    var showIndicators: Bool
    var axis: Axis.Set
    
    // Since it will carry multiple views, it will be a closure and will return a view
    
    init(offset: Binding<CGPoint>, showIndicators: Bool, axis: Axis.Set, @ViewBuilder content: () -> Content) {
        self.content = content()
        self._offset = offset
        self.showIndicators = showIndicators
        self.axis = axis
        
    }
    // Getting Exact Start Offset And Minu from current Offset...
    // So that crt offset will be obtained...
    @State var startOffset: CGPoint = .zero
    
    
    var body: some View{
        ScrollView(axis, showsIndicators: showIndicators, content: {
            content
                .overlay (
                    GeometryReader{proxy -> Color in
                        let rect = proxy.frame(in: .global)
                            if startOffset == .zero {
                                DispatchQueue.main.async {
                                    startOffset = CGPoint(x: rect.minX, y: rect.minY)
                                }
                                
                            }
                            
                        DispatchQueue.main.async {
                            self.offset = CGPoint(x: startOffset.x -   rect.minX,
                                                  y: startOffset.y - rect.minY)
                        }
                        return Color.clear
                        
                    }
                    // Also fetching horziontal offset, setting width to full such thtat minX = 0
                        .frame(width:UIScreen.main.bounds.width, height: 0)
                    ,alignment: .top
                )
        })
    }
}
