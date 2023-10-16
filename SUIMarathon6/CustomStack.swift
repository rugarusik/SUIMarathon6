//
//  CustomStack.swift
//  SUIMarathon6
//
//  Created by Alina Golubeva on 16/10/2023.
//

import SwiftUI

struct CustomStack: Layout {
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        CGSize(
            width: proposal.width ?? .zero,
            height: proposal.height ?? .zero
        )
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let size = bounds.height / CGFloat(subviews.count)
        
        var pointX = bounds.minX
        var pointY = bounds.maxY - size
                
        subviews.forEach {subview in
            subview
                .place(
                    at: CGPoint(
                        x: pointX,
                        y: pointY
                    ),
                    proposal: ProposedViewSize(
                        width: size,
                        height: size
                    )
                )
            
            pointX += (bounds.width - size) / CGFloat(subviews.count - 1)
            pointY -= size
        }
    }
}
