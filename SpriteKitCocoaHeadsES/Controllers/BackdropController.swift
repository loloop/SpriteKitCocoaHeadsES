//
//  BackdropController.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/22/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import SpriteKit

final class BackdropController: SKNode {

    override init() {
        super.init()
        setupBackdrop()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupBackdrop() {
        let backdrop = SKSpriteNode(imageNamed: "backgroundForest")
        backdrop.zPosition = ZPosition.background
        let bounds = UIScreen.main.bounds
        backdrop.position = bounds.center
        backdrop.size = CGSize(width: bounds.width * 2, height: bounds.height * 2)
        backdrop.anchorPoint = CGPoint(x: 0.5, y: 0.25)
        addChild(backdrop)
    }

    override func handle(event: Event) {}
}
