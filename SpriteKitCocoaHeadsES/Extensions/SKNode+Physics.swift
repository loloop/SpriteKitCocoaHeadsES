//
//  SKNode+Physics.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/22/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import SpriteKit

extension SKNode {
    func sortPhysicsBodies(for contact: SKPhysicsContact) -> SKPhysicsBody? {
        if contact.bodyA === physicsBody {
            return contact.bodyB
        } else if contact.bodyB === physicsBody {
            return contact.bodyA
        } else {
            return nil
        }
    }

    func node(on contact: SKPhysicsContact) -> SKNode? {
        return sortPhysicsBodies(for: contact)?.node
    }
}
