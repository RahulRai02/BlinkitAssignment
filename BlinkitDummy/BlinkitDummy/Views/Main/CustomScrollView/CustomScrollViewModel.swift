//
//  CustomScrollViewModel.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 11/08/24.
//

//import Foundation
//import SwiftUI
//
import Foundation
import SwiftUI

class ScrollViewModel: ObservableObject {
    @Published var offset: CGPoint = .zero
    @Published var contentHeight: CGFloat = 0
    @Published var visibleContentHeight: CGFloat = 0
    @Published var pullDownProgress: CGFloat = 0
    @Published var pullUpProgress: CGFloat = 0

    private let pullDownThreshold: CGFloat = -80
    private let pullUpThreshold: CGFloat = 200
        
    var onPullDown: (() -> Void)?
    var onPullUp: (() -> Void)?
        
    
    func handleScroll() {
        updatePullDownProgress()
        if offset.y < pullDownThreshold {
            onPullDown?()
        } else if ((visibleContentHeight - contentHeight) + offset.y) >= pullUpThreshold && (visibleContentHeight - contentHeight < 0) {
            onPullUp?()
        } else if ((visibleContentHeight - contentHeight) + offset.y) >= pullUpThreshold && (visibleContentHeight - contentHeight > 0) {
            if offset.y < pullDownThreshold {
                onPullDown?()
            } else if offset.y > 120 {
                onPullUp?()
            }
        }
    }
    
    private func updatePullDownProgress() {
        pullDownProgress = max(0, min(1, offset.y / -80))
    }

}

