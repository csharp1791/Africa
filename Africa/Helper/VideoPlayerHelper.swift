//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Cliff Sharp on 2/13/23.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
  if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
    videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: "mp4")!)
    videoPlayer?.play()
  }
  return videoPlayer!   // ! not good
}
