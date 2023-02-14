//
//  VideoModel.swift
//  Africa
//
//  Created by Cliff Sharp on 2/13/23.
//

import Foundation

struct Video: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  
  var thumbnail: String {
    "video-\(id)"
  }
}
