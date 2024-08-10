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
    @Binding var contentHeight: CGFloat
    @Binding var visibleContentHeight: CGFloat
    
    var showIndicators: Bool
    var axis: Axis.Set
    
    // Since it will carry multiple views, it will be a closure and will return a view
    
    init(offset: Binding<CGPoint>, contentHeight: Binding<CGFloat>, visibleContentHeight: Binding<CGFloat>  , showIndicators: Bool, axis: Axis.Set, @ViewBuilder content: () -> Content) {
        self.content = content()
        self._offset = offset
        self._contentHeight = contentHeight 
        self._visibleContentHeight = visibleContentHeight
        self.showIndicators = showIndicators
        self.axis = axis
        
    }
    // Getting Exact Start Offset And Minu from current Offset...
    // So that crt offset will be obtained...
    @State var startOffset: CGPoint = .zero
//    @State private var isAtBottom: Bool = false
    

    
    var body: some View{
        
        ScrollView(axis, showsIndicators: showIndicators) {
            content
                .background(GeometryReader{ geometry in
                    Color.clear.onAppear {
                        contentHeight = geometry.size.height
                    }
                    .onChange(of: geometry.size.height) { _, newHeight in
                        contentHeight = newHeight
                    }
                })

                .overlay (
                    GeometryReader{proxy -> Color in
                        let rect = proxy.frame(in: .global)
                            if startOffset == .zero {
                                DispatchQueue.main.async {
//                                    print("THe height of the scroll bar is \(proxy.size.height)")
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
        }
        .overlay{
            Color.clear
                GeometryReader { geoP in
                        Color.clear
                        .onAppear {
                            self.visibleContentHeight = geoP.frame(in: .local).height
                        }
                        .onChange(of: visibleContentHeight) { _, newVal in
                            visibleContentHeight = newVal
                        }
                    }
        }

    }
}
