//
//  PracticeAnimations.swift
//  Animations
//
//  Created by Cameron Warner on 11/18/23.
//

import SwiftUI

struct PracticeAnimating: View {
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3) //  means the blur radius will start at 0 (no blur), but then move to 3 points, 6 points, 9 points, and beyond as you tap the button.
        .animation(.default, value: animationAmount)
        
        
        
    }
}

#Preview {
    PracticeAnimating()
}
