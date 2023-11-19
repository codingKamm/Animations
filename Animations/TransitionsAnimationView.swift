//
//  TransitionsAnimationView.swift
//  Animations
//
//  Created by Cameron Warner on 11/19/23.
//

import SwiftUI

struct TransitionsAnimationView: View {
    @State private var isShowingOrange = false

    var body: some View {
        VStack{
            Button("Tap Me") {
                withAnimation {
                    isShowingOrange.toggle()
                }
            }
            if isShowingOrange {
                Rectangle()
                    .fill(.orange)
                    .frame(width: 300, height: 300)
                    //.transition(.scale) //the rectangle scales up as the button makes space, then scales down when tapped again.
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingOrange.toggle()
            }
        }
        
    }
}

#Preview {
    TransitionsAnimationView()
}


struct CornerRotateModifer: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifer(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifer(amount: 0, anchor: .topLeading))
    }
}
