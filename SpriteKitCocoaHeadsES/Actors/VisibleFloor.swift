//
//  VisibleFloor.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/23/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import SpriteKit

final class VisibleFloor: SKNode {

    var floorSpeed: CGFloat = 1

    var tiles: [SKSpriteNode] = []

    override init() {
        super.init()
        setupTiles()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupTiles() {
        for index in -10...2000 { // preguiça de fazer a lógica 😂
            let node = SKSpriteNode(imageNamed: "tileGreen_27")
            guard let texture = node.texture else { return }
            let width = Int(texture.size().width)
            node.position = CGPoint(x: index * width + 10, y: 20)
            tiles.append(node)
            addChild(node)
        }
    }

    func animateTiles() {
        let moveAction = SKAction.move(by: CGVector(dx: -floorSpeed, dy: 0), duration: 0.1)
        run(SKAction.repeatForever(moveAction))
    }

    override func handle(event: Event) {
        if let event = event as? SpeedEvent {
            floorSpeed = event.speed
            removeAllActions()
            animateTiles()
        }
    }

}

