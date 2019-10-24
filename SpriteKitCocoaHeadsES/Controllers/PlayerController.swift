//
//  PlayerController.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/22/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import SpriteKit

final class PlayerController: SKNode {

    private(set) var health: Int = 3

    override init() {
        super.init()
        setupPlayer()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupPlayer() {
        let player = Player(characterName: "character_femaleAdventurer", frameCount: 2)
        addChild(player)
    }

    override func raise(event: Event) {
        if event is DamageEvent {
            if health > 1 {
                health -= 1
            } else {
                parent?.raise(event: DeathEvent())
                return
            }
        }

        parent?.raise(event: event)
    }

    override func handle(event: Event) {
        if event is InteractionEvent {
            let control = GenericEvent<PlayerControlType>(type: .jump)
            return super.handle(event: control)
        }
        super.handle(event: event)
    }
}

