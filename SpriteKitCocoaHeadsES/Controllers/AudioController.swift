//
//  AudioController.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/23/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import SpriteKit

final class AudioController: SKNode {

    override init() {
        super.init()
        loadAudio()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func loadAudio() {
        guard let path = Bundle(for: AudioController.self).path(forResource: "song", ofType: "m4a") else {
            return
        }

        let url = URL(fileURLWithPath: path)
        let backgroundMusic = SKAudioNode(url: url)
        backgroundMusic.autoplayLooped = true
        backgroundMusic.isPositional = false
        backgroundMusic.run(SKAction.changeVolume(to: 0.3, duration: 0))
        addChild(backgroundMusic)
    }

    override func handle(event: Event) {
        if event is DeathEvent {
            playDeathSound()
        }
    }

    func playDeathSound() {
        children.forEach { $0.run (SKAction.stop()) }
        guard let path = Bundle.main.path(forResource: "death", ofType: "m4a") else { return }

        let url = URL(fileURLWithPath: path)
        let backgroundMusic = SKAudioNode(url: url)
        backgroundMusic.autoplayLooped = false
        backgroundMusic.isPositional = false
        addChild(backgroundMusic)
        backgroundMusic.run(SKAction.play())
    }
}
