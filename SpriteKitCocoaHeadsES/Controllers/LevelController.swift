//
//  LevelController.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/23/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import SpriteKit

final class LevelController: SKNode {

    override init() {
        super.init()
        loadLevel()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func loadLevel() {
        addChild(BackdropController())
        addChild(Floor())
        addChild(EnemyController())
    }
}
