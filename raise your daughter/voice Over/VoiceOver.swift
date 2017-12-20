//
//  VoiceOver.swift
//  raise your daughter
//
//  Created by Kien Phan on 12/3/17.
//  Copyright © 2017 WiiHop. All rights reserved.
//

import Foundation
import AVKit

var voice = AVAudioPlayer()

//set Up audio
func prepareVoiceOver(voType: String,x : Int) {
    do {
        voice = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath:Bundle.main.path(forResource: voType + "VoiceOver" + String(x), ofType: "m4a")!))
        voice.numberOfLoops = 0
        voice.prepareToPlay()
    } catch {
        print("error caught: ")
        print(error)
    }
}

func playVoiceOver(voType: String, x: Int){
    prepareVoiceOver(voType: voType, x: x)
    if voice.isPlaying {
        prepareVoiceOver(voType: voType, x: x)
        voice.stop()
        voice.play()
    } else {
        prepareVoiceOver(voType: voType, x: x)
        voice.play()
    }
}

func stopVoiceOver() {
    if voice.isPlaying {
        voice.stop()
    }
}
