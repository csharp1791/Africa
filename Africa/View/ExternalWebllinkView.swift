//
//  ExternalWebllinkView.swift
//  Africa
//
//  Created by Cliff Sharp on 2/11/23.
//

import SwiftUI

struct ExternalWebllinkView: View {
  // MARK: - PROPERTIES
  
  let animal: Animal
  
  // MARK: - BODY
  var body: some View {
    GroupBox {
      HStack {
        Image(systemName: "globe")
        Text("wikopedia")
        Spacer()
        
        Group {
          Image(systemName: "arrow.up.right.square")
          
          Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
        }
      } //: HSTACK
    } // BOX
  }
}

// MARK: - PREVIEW
struct ExternalWebllinkView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")
  
  static var previews: some View {
    ExternalWebllinkView(animal: animals[5])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
