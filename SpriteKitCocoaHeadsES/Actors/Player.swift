//
//  Player.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/22/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import SpriteKit

final class Player: SKSpriteNode {

    enum State {
        case start
        case dead
        case running
        case jumping
    }

    var currentState: State = .start

    let runningFrames: [SKTexture]
    lazy var jumpingFrames: [SKTexture] = {
        return [SKTexture(imageNamed: "\(characterName)_attackKick")]
    }()
    lazy var deathFrames: [SKTexture] = {
        return [
            SKTexture(imageNamed: "\(characterName)_fall"),
            SKTexture(imageNamed: "\(characterName)_fallDown")
        ]
    }()

    let characterName: String
    private var isJumping: Bool = false

    init(characterName: String, frameCount: Int) {
        self.characterName = characterName
        var frames: [SKTexture] = []
        for index in 0...frameCount {
            let texture: SKTexture = SKTexture(imageNamed: "\(characterName)_run\(index)")
            frames.append(texture)
        }
        runningFrames = frames
        let texture = runningFrames[0]
        super.init(texture: texture, color: .clear, size: texture.size())
        setupPosition()
        setupPhysicsBody()
    }

    func setupPosition() {
        position = UIScreen.main.bounds.center
        zPosition = ZPosition.player
    }

    func setupPhysicsBody() {
        guard let texture = texture else { return }
        let textureSize = texture.size()
        let bodySize = CGSize(width: textureSize.width - 60,
                              height: textureSize.height - 20)
        physicsBody = SKPhysicsBody(rectangleOf: bodySize)
        physicsBody?.affectedByGravity = true
        physicsBody?.isDynamic = true
        physicsBody?.allowsRotation = false
        physicsBody?.contactTestBitMask = PhysicsCategory.scenery & PhysicsCategory.enemy
        physicsBody?.categoryBitMask = PhysicsCategory.player
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func handle(event: Event) {
        if let event = event as? PhysicsEvent {
            return handlePhysics(event: event)
        }

        if
            let event = event as? GenericEvent<PlayerControlType>,
            event.type == .jump {
            return jump()
        }

        if event is DeathEvent {
            die()
        }
    }

    func handlePhysics(event: PhysicsEvent) {
        guard event.type == .didBegin, currentState != .dead else {
            return
        }

        let contactNode = node(on: event.contact)
        if contactNode is Floor && event.type == .didBegin {
            return animateRun()
        }

        if let trigger = contactNode as? Trigger, trigger.type == .damage {
            return raise(event: DamageEvent())
        }
    }

    func animateRun() {
        if currentState == .running { return }
        removeAllActions()
        currentState = .running
        let animation = SKAction.animate(with: runningFrames, timePerFrame: 0.05)

        let repeatableAnimation = SKAction.repeatForever(
            SKAction.sequence([
                animation,
                animation.reversed()
            ])
        )

        run(repeatableAnimation)
    }

    func jump() {
        if currentState == .running {
            currentState = .jumping
            physicsBody?.applyImpulse(CGVector(dx: 0, dy: 1550))
            animateJump()
        }
    }

    func animateJump() {
        removeAllActions()
        let jumpAnimation = SKAction.animate(with: jumpingFrames, timePerFrame: 0.1)
        run(jumpAnimation)
    }

    func die() {
        currentState = .dead
        physicsBody?.collisionBitMask = PhysicsCategory.none
        physicsBody?.categoryBitMask = PhysicsCategory.none
        physicsBody?.contactTestBitMask = PhysicsCategory.none
        removeAllActions()

        physicsBody?.applyImpulse(CGVector(dx: 0, dy: 2000))
        run(SKAction.animate(with: deathFrames, timePerFrame: 0.7))
    }

}
