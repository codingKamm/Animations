//
//  AnimatingGesturesView.swift
//  Animations
//
//  Created by Cameron Warner on 11/19/23.
//

import SwiftUI

struct AnimatingGesturesView: View {
    @State private var enable = false
    @State private var animationAmount = 0.0
    let letters = Array("Drag Me")
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        VStack {
            ZStack{
                LinearGradient(colors: [.yellow, .brown], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .frame(width: 300, height: 500)
                        .clipShape(.rect(cornerRadius: 20))
                        .offset(dragAmount)//which lets us adjust the X and Y coordinate of a view without moving other views around it. You can pass in discrete X and Y coordinates if you want to, but – by no mere coincidence – offset() can also take a CGSize directly.
                        .gesture(
                            DragGesture()
                                .onChanged { dragAmount = $0.translation }
                                .onEnded { _ in withAnimation(.bouncy) {
                                    dragAmount = .zero
                                }
                                }
                        )
                    //                    .animation(.bouncy, value: dragAmount)
//                        .ignoresSafeArea()
                    
            HStack (spacing: 0) {
                    ForEach(0..<letters.count, id: \.self) { num in
                        Text(String(letters[num]))
                            .padding(5)
                            .font(.title)
                            .background(enable ? .red : .blue)
                            .offset(dragAmount)
                            .animation(.linear.delay(Double(num) / 20), value: dragAmount)// animates array of letters
                    }
                } //End of HStack
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation}
                    .onEnded { _ in
                        dragAmount = .zero
                        enable.toggle()
                    }
            )
            } // End of ZStack
        }//End of VStack
    }
}

#Preview {
    AnimatingGesturesView()
}
