//
//  Floor.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/22/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import SpriteKit

class Floor: SKNode {

    override init() {
        super.init()
        setupPosition()
        setupPhysicsBody()
        setupVisibleFloor()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupPhysicsBody() {
        let body = SKPhysicsBody(rectangleOf: CGSize(width: UIScreen.main.bounds.width, height: 100))
        body.affectedByGravity = false
        body.isDynamic = false
        body.allowsRotation = false
        body.categoryBitMask = PhysicsCategory.scenery
        physicsBody = body
    }

    func setupPosition() {
        position = CGPoint(x: UIScreen.main.bounds.midX, y: 0)
    }

    func setupVisibleFloor() {
        addChild(VisibleFloor())
    }
}
