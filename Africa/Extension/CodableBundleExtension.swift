//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Cliff Sharp on 2/9/23.
//
import Foundation

extension Bundle {
  func decode(_ file: String) -> [CoverImage] {
    // 1. locate the JSON file
    guard let fileUrl = self.url(forResource: file, withExtension: nil) else {
      fatalError("failed to locate \(file) in Bundel.wa")
    }
    
    // 2. create a property for the data
    guard let data = try? Data(contentsOf: fileUrl) else {
      fatalError("failed to load \(fileUrl) from Bundle.")
    }
    
    // 3. create a decoder
    let decoder = JSONDecoder()
    
    // 4. create a property for the decoded data
    guard let loaded = try? decoder.decode([CoverImage].self, from: data) else {
      fatalError("failed to decode \(fileUrl) from bundle")
    }
    
    // 5. return the ready-to-use data
    return loaded
  }
}
