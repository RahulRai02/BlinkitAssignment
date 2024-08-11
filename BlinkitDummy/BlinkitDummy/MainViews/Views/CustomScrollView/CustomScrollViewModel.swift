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
    @Published var totalContentHeight: CGFloat = 0
    @Published var visibleContentHeight: CGFloat = 0
    @Published var pullDownProgress: CGFloat = 0
    @Published var pullUpProgress: CGFloat = 0
    
    @Published var isAtTop: Bool = false
    @Published var isAtBottom: Bool = false

    private let pullDownThreshold: CGFloat = -80
    private let pullUpThreshold: CGFloat = 200
    private let pullUpThrehsholdLessContent: CGFloat = 120
        
    var onPullDown: (() -> Void)?
    var onPullUp: (() -> Void)?
        
    
    func handleScroll() {
        updatePullDownProgress()
        updatePullUpProgress()
        if offset.y < pullDownThreshold {
            onPullDown?()
        } else if ((visibleContentHeight - totalContentHeight) + offset.y) >= pullUpThreshold && (visibleContentHeight - totalContentHeight < 0) {
            // Case when the products occupy more space, like when we have the scroll view for scrolling items (Activated scroll View)
            onPullUp?()
        } else if ((visibleContentHeight - totalContentHeight) + offset.y) >= pullUpThreshold && (visibleContentHeight - totalContentHeight > 0) {
            if offset.y < pullDownThreshold {
                // Case when there are less products, and we need to decide based on offset. If offset goes negative below threshold then pull down
                onPullDown?()
            } else if offset.y > pullUpThrehsholdLessContent {
                // Case when there are less products, and we need to decide based on offset, if offset goes above threshold, then pull up
                onPullUp?()
            }
        }
    }
    
    private func updatePullDownProgress() {
        pullDownProgress = max(0, min(1, offset.y / -80))
    }
    
    private func updatePullUpProgress(){
        if (visibleContentHeight - totalContentHeight < 0){
            let startValue = (totalContentHeight - visibleContentHeight) + 92.9
            let endValue = startValue + (pullUpThreshold - 92.9)
            
          
            guard endValue > startValue else {
                pullUpProgress = 0
                return
            }

            if offset.y >= startValue {
                pullUpProgress = min(max((offset.y - startValue) / (endValue - startValue), 0), 1)
            } else {
                pullUpProgress = 0
            }
    }else if(visibleContentHeight - totalContentHeight > 0){
//            print("IN here less content case")
            let oneValue = pullUpThrehsholdLessContent
            pullUpProgress = (offset.y / oneValue)
        }
    }
}

