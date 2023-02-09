//
//  CoverImageVew.swift
//  Africa
//
//  Created by Cliff Sharp on 2/9/23.
//

import SwiftUI

struct CoverImageVew: View {
  // MARK: - PROPERTIES
  
  let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
  
  // MARK: - BODY
  var body: some View {
    TabView {
      ForEach(coverImages) { item in
        Image(item.name)
          .resizable()
          .scaledToFit()
      } //: LOOP
    } //: TAB
    .tabViewStyle(PageTabViewStyle())
  }
}

// MARK: - PREVIEWS
struct CoverImageVew_Previews: PreviewProvider {
  static var previews: some View {
    CoverImageVew()
      .previewLayout(.fixed(width: 400, height: 300))
 }
}
