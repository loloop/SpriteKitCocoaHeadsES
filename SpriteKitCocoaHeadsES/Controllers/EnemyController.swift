//
//  EnemyController.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/23/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import SpriteKit

final class EnemyController: SKNode {

    var floorSpeed: CGFloat = 1

    override init() {
        super.init()
        setupEnemies()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupEnemies() {
        for index in 1...200 {
            let node = Enemy()
            node.position = CGPoint(x: (index * Int(node.size.width) * 8) + 1000, y: 140)
            addChild(node)
        }
    }

    func animateEnemies() {
        let moveAction = SKAction.move(by: CGVector(dx: -floorSpeed, dy: 0), duration: 0.1)
        run(SKAction.repeatForever(moveAction))
    }

    override func handle(event: Event) {
        if let event = event as? SpeedEvent {
            floorSpeed = event.speed
            removeAllActions()
            animateEnemies()
        }
    }
    
}
