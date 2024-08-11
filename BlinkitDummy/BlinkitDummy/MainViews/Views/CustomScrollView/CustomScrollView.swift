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
    var showIndicators: Bool
    var axis: Axis.Set
    
    @Binding var offset: CGPoint
    @Binding var contentHeight: CGFloat
    @Binding var visibleContentHeight: CGFloat

    // Starting offset of content
    @State var startOffset: CGPoint = .zero
    
    // Closure takes a view returns a view
    init(offset: Binding<CGPoint>, contentHeight: Binding<CGFloat>, visibleContentHeight: Binding<CGFloat>  , showIndicators: Bool, axis: Axis.Set, @ViewBuilder content: () -> Content) {
        self.content = content()
        self._offset = offset
        self._contentHeight = contentHeight 
        self._visibleContentHeight = visibleContentHeight
        self.showIndicators = showIndicators
        self.axis = axis
        
    }

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
                                    startOffset = CGPoint(x: rect.minX, y: rect.minY)
                                }
                            }
                            
                        DispatchQueue.main.async {
                            self.offset = CGPoint(x: startOffset.x -   rect.minX,
                                                  y: startOffset.y - rect.minY)
                        }
                        
                        return Color.clear
                    }
                    ,alignment: .top
                )
        }
        // To get the visble content height
        .overlay{
            Color.clear
                GeometryReader { geoP in
                        Color.clear
                        .onAppear {
                            self.visibleContentHeight = geoP.frame(in: .local).height
                        }
                        // OnChange is given so that visibleContentHeight updates when category changes
                        .onChange(of: visibleContentHeight) { _, newVal in
                            visibleContentHeight = newVal
                        }
                    }
        }
    }
}
