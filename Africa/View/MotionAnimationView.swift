//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Cliff Sharp on 2/14/23.
//

import SwiftUI

struct MotionAnimationView: View {
  // MARK: - PROPERTIES
  
  @State private var randomCircle = Int.random(in: 12...16)
  @State private var isAnimating: Bool = false
  
  // MARK: - NEW FUNCTIONS
  
  // 1. RANDOM COORDINATES
  func randomCoordiate(max: CGFloat) -> CGFloat {
    return CGFloat.random(in: 0...max)
  }
  
  // 2. RANDOM SIZE
  func randomSize() -> CGFloat {
    return CGFloat.random(in: 10...300)
  }
  
  // 3. RANDOM SCALE
  
  func ransomScale() -> CGFloat {
    return CGFloat(Double.random(in: 0.1...2.0))
  }
  
  // 4. RANDOM SPEED
  func randomSpeed() -> Double {
    return Double.random(in: 0.025...1.0)
  }
  
  // 5. RANDOM DELAY
  func randomDelay() -> Double {
    return Double.random(in: 0...2)
  }
  
  // MARK: - BODY
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        ForEach(0...randomCircle, id: \.self) { item in
          Circle()
            .foregroundColor(.gray)
            .opacity(0.15)
            .frame(width: randomSize(), height: randomSize(), alignment: .center)
            .scaleEffect(isAnimating ? ransomScale() : 1)
            .position(
              x: randomCoordiate(max: geometry.size.width),
              y: randomCoordiate(max: geometry.size.height)
            )
            .animation(
              Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                .repeatForever()
                .speed(randomSpeed())
                .delay(randomDelay())
              )
            .onAppear(perform: {
              isAnimating = true
            })
        } //: LOOP
      } //: ZSTACK
      .drawingGroup()
    } //: GEOMETRY
  }
}

// MARK: - PREVIEW
struct MotionAnimationView_Previews: PreviewProvider {
  static var previews: some View {
    MotionAnimationView()
  }
}
