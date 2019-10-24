//
//  GameScene.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/21/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import SpriteKit

final class GameScene: SKScene {

    private var childrenHandlers: [EventHandler] = []

    private lazy var contactDelegate: SKPhysicsContactDelegate = {
        let delegate = ScenePhysicsContactDelegate(parentScene: self)
        return delegate
    }()

    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self.contactDelegate
        setupHandlers()
        setupSpeed()
    }

    func setupHandlers() {
        let sknodes = [
            UIController(),
            LevelController(),
            PlayerController(),
            AudioController()
        ]

        let gameController = GameController(parent: self)
        childrenHandlers.append(contentsOf: sknodes)
        childrenHandlers.append(gameController)
        sknodes.forEach(addChild)
    }

    func setupSpeed() {
        handle(event: SpeedEvent(speed: 30))
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let event = InteractionEvent(type: .tap)
        super.handle(event: event)
    }

    override func raise(event: Event) {
        if event is DeathEvent {
            handleDeath()
        }

        handle(event: event)
    }

    override func handle(event: Event) {
        childrenHandlers.forEach { $0.handle(event: event) }
    }

    func handleDeath() {
        let speed = SpeedEvent(speed: 0)
        handle(event: speed)
    }

}
