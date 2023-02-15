//
//  ContentView.swift
//  Africa
//
//  Created by Cliff Sharp on 2/7/23.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
  
  let animals: [Animal] = Bundle.main.decode("animals.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  
  @State private var isGridViewActive: Bool = false
  
  let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
  
  // MARK: - BODY

  var body: some View {
    NavigationView {
      Group {
        if !isGridViewActive {
          List {
            CoverImageVew()
              .frame(height: 300)
              .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            ForEach(animals) { animal in
              NavigationLink(destination: AnimalDetailView(animal: animal)) {
                AnimalListItemView(animal: animal)
              } //: LINK
            } //: LOOP
          } //: LIST
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
              ForEach(animals) { animal in
                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                  AnimalGridItemView(animal: animal)
                } //: LINK
              } //: LOOP
            } //: GRID
            .padding(10)
            .animation(.easeIn)
          } //: SCROLL
        } //: CONDITIONAL
      } //: GROUP
      .navigationBarTitle("Africa", displayMode: .large)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          HStack(spacing: 16) {
            // List
            Button(action: {
              print ("List view is activated")
              isGridViewActive = false
              haptics.impactOccurred()
            }) {
              Image(systemName: "square.fill.text.grid.1x2")
                .font(.title2)
                .foregroundColor(isGridViewActive ? .primary : .accentColor)
            }
            // GRID
            Button(action: {
              print("Grid view is activated")
              isGridViewActive = true
              haptics.impactOccurred()
            }) {
              Image(systemName: "square.grid.2x2")
                .font(.title2)
                .foregroundColor(isGridViewActive ? .accentColor : .primary)
            }
            
          } //: HSTACK
        } //: BUTTONS
      } //: TOOLBAR
    } //: NAVIGATE
  }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewDevice("iPhone 14 Pro")
  }
}
