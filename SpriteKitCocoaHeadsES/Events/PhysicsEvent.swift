//
//  PhysicsEvent.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/22/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import SpriteKit

enum PhysicsContactType {
    case didBegin
    case didEnd
}

final class PhysicsEvent: Event {
    let contact: SKPhysicsContact
    let type: PhysicsContactType

    init(contact: SKPhysicsContact, type: PhysicsContactType) {
        self.type = type
        self.contact = contact
    }
}
