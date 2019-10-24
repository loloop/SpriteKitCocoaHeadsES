//
//  Enemy.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/22/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import SpriteKit

class Enemy: SKSpriteNode {

    init() {
        let texture = SKTexture(imageNamed: "cactus2")
        let size = texture.size()
        let scaledSize = CGSize(width: size.width * 0.7, height: size.height * 0.7)
        super.init(texture: texture, color: .clear, size: scaledSize)
        setupTrigger()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setupTrigger() {
        let trigger = Trigger(size: size, category: PhysicsCategory.enemy, and: .damage)
        addChild(trigger)
    }
}
