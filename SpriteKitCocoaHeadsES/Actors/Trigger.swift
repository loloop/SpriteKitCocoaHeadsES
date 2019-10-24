//
//  Trigger.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/23/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import SpriteKit

enum TriggerType {
    case damage
    case score
    case reset
}

class Trigger: SKNode {

    let type: TriggerType

    init(size: CGSize, category: UInt32, and type: TriggerType) {
        self.type = type
        super.init()
        setupTrigger(with: size, and: category)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupTrigger(with size: CGSize, and category: UInt32) {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.affectedByGravity = false
        physicsBody?.collisionBitMask = PhysicsCategory.none
        physicsBody?.categoryBitMask = PhysicsCategory.none
        physicsBody?.contactTestBitMask = category
    }

}
