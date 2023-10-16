//
//  ContentView.swift
//  SUIMarathon6
//
//  Created by Alina Golubeva on 14/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    let count = 10
    let spacing: CGFloat = 8

    @State var layoutType: LayoutType = .horizontal
    
    var body: some View {
        GeometryReader(content: { geometry in
            
            let layout = switch layoutType {
                
            case .horizontal:
                AnyLayout(HStackLayout(spacing: spacing))
            case .diagonal:
                AnyLayout(CustomStack())
            }

            layout {
                ForEach(0..<count, id: \.self) { _ in
                    RoundedRectangle(cornerRadius: 6)
                        .fill(.blue)
                        .aspectRatio(contentMode: .fit)
                }
                .onTapGesture {
                    withAnimation {
                        layoutType = layoutType == .diagonal ? .horizontal : .diagonal
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        })
    }
}

#Preview {
    ContentView()
}
