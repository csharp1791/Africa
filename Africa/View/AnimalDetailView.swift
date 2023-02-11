//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Cliff Sharp on 2/10/23.
//

import SwiftUI

struct AnimalDetailView: View {
  // MARK: - PROPERTIES
  
  let animal: Animal
  
  // MARK: - BODY

  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 20) {
        // Hero/Cover Image
        Image(animal.image)
          .resizable()
          .scaledToFit()
        
        // Title
        Text(animal.name.uppercased())
          .font(.largeTitle)
          .fontWeight(.heavy)
          .multilineTextAlignment(.center)
          .padding(.vertical, 8)
          .foregroundColor(.primary)
          .background(
            Color.accentColor
              .frame(height: 6)
              .offset(y: 24)
          )
        
        // Headline
        Text(animal.headline)
          .font(.headline)
          .multilineTextAlignment(.leading)
          .foregroundColor(.accentColor)
          .padding(.horizontal)

        // Gallery
        Group {
          HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
          InsetGalleryView(animal: animal)
        }
        .padding(.horizontal)
        
        // Facts
        Group {
          HeadingView(headingImage: "qestionmark.circle", headingText: "Did you know?")
          InsetFactView(animal: animal)
        }
        .padding(.horizontal)

        // Description
        Group {
          HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")

          Text(animal.description)
            .multilineTextAlignment(.leading)
            .layoutPriority(1)
        }
        .padding(.horizontal)
        
        // Map
        Group {
          HeadingView(headingImage: "map", headingText: "National Parks")
        }
        .padding(.horizontal)
        
        // Link
        
      } //: VSTACK
      .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
    } //: SCROLLVIEW
  }
}

// MARK: - PREVIEW

struct AnimalDetailView_Previews: PreviewProvider {
  static var animals: [Animal] = Bundle.main.decode("animals.json")
  
  static var previews: some View {
    NavigationView {
      AnimalDetailView(animal: animals[0])
    }
    .previewDevice("iPhone 14 Pro")
  }
}
