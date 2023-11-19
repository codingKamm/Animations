//
//  ContentView.swift
//  Animations
//
//  Created by Cameron Warner on 11/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    @State private var enable = false
    
    var body: some View {
        VStack {
            Button("tap Me"){
                withAnimation(.easeInOut(duration: 2)) {
                    animationAmount += 360
                }
                enable.toggle()
            }
            .padding(50)
            .background(enable ? .blue : .red)
            .animation(.default, value: enable) // the order in which we apply animations matters: only changes that occur before the animation() modifier get animated.
            .foregroundStyle(.white)
            .clipShape(.circle)
            .rotation3DEffect(.degrees(animationAmount),axis: (x: 1.0, y: 1.0, z: 7.0))
            //  If we skewer the view through the X axis (horizontally) then it will be able to spin forwards and backwards.
            //  If we skewer the view through the Y axis (vertically) then it will be able to spin left and right.
            //  If we skewer the view through the Z axis (depth) then it will be able to rotate left and right.
            .clipShape(.rect(cornerRadius: enable ? 60 : 0))
            .animation(.spring(duration: 1, bounce: 0.6), value: enable)
           
           
        }


    }
}

#Preview {
    ContentView()
}
