//
//  AnimationBindingView.swift
//  Animations
//
//  Created by Cameron Warner on 11/18/23.
//

import SwiftUI

struct AnimationBindingView: View {
    @State private var animationAmount = 1.0

    var body: some View {
        VStack {
            Stepper("Scale amount", value: $animationAmount.animation(.easeInOut(duration: 1).repeatCount(3, autoreverses: true)), in: 1...10)
                .padding()
        
            //binding animations effectively turn the tables on implicit animations: rather than setting the animation on a view and implicitly animating it with a state change, we now set nothing on the view and explicitly animate it with a state change
            
            Spacer()
        
            Button("Tap Me") {
                    animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
        //        .blur(radius: (animationAmount - 1) * 3) //  means the blur radius will start at 0 (no blur), but then move to 3 points, 6 points, 9 points, and beyond as you tap the button.
            .overlay(Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(.easeInOut(duration: 2).repeatForever(autoreverses: false), value: animationAmount) // loops animation forever
                )
                .onAppear{
                    animationAmount = 2
                    }
        
        //  .animation(.easeInOut(duration: 2).repeatCount(3, autoreverses: true), value: animationAmount) // creates a one-second animation that will bounce up and down before reaching its final size:
        
        // .animation(.easeOut(duration: 2).delay(2), value: animationAmount) // delayed by 2sec before beginning a 2sec animation
        
        //        .animation(.spring(duration: 1, bounce: 0.7), value: animationAmount) // .spring is a more natural animation
        
        //        .animation(.default, value: animationAmount)
        //        .animation(.linear, value: animationAmount)
        
        
        
    }//end of VStack
    }
}

#Preview {
    AnimationBindingView()
}
