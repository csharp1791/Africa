//
//  ContentView.swift
//  Africa
//
//  Created by Cliff Sharp on 2/7/23.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      List {
        CoverImageVew()
          .frame(height: 300)
          .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
      } //: LIST
      .navigationBarTitle("Africa", displayMode: .large)
    } //: NAVIGATE
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewDevice("iPhone 14 Pro")
  }
}
