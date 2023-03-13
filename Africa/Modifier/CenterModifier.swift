//
//  CenterModifier.swift
//  Africa
//
//  Created by Cliff Sharp on 2/17/23.
//

import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}
