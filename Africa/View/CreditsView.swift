//
//  CreditsView.swift
//  Africa
//
//  Created by Cliff Sharp on 2/17/23.
//

import SwiftUI

struct CreditsView: View {
  var body: some View {
    VStack {
      Image("compass")
        .resizable()
        .scaledToFit()
        .frame(width: 128, height: 128)
      Text("""
  Clifford Sharp
  From a UDEMY Tutorial
  Pure 🐬 SwiftUI
  """)
      .font(.footnote)
      .multilineTextAlignment(.center)
    } //: VSTACK
    .padding()
    .opacity(0.4)
  }
}

struct CreditsView_Previews: PreviewProvider {
  static var previews: some View {
    CreditsView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
