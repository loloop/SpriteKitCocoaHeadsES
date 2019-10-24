//
//  UIController.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/22/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import SpriteKit

final class UIController: SKNode {

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init() {
        super.init()
        setupHearts()
    }

    func setupHearts() {
        var hearts: [SKSpriteNode] = []
        for index in 1...3 {
            let sprite = SKSpriteNode(imageNamed: "heart")
            let offset = 10 + (sprite.size.width * 1.5) * CGFloat(index)
            sprite.position = CGPoint(x: offset, y: sprite.size.height + 25)
            sprite.xScale = 2
            sprite.yScale = 2
            sprite.zPosition = ZPosition.ui
            hearts.append(sprite)
        }
        hearts.forEach(addChild)
    }

    override func handle(event: Event) {
        if event is DamageEvent || event is DeathEvent {
            children.last?.removeFromParent()
        }
    }

}
