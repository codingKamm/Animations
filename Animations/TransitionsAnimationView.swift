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
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
        
    }
}

#Preview {
    TransitionsAnimationView()
}
