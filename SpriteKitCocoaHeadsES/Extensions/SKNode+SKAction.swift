//
//  SKNode+SKAction.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/21/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import SpriteKit

extension SKNode {
    func run(_ action: SKAction, withKey key: Event) {
        run(action, withKey: String(describing: key))
    }

    func removeAction(forKey key: Event) {
        removeAction(forKey: String(describing: key))
    }
}
