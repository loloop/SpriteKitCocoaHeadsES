//
//  PhysicsContact.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/21/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import SpriteKit

final class ScenePhysicsContactDelegate: NSObject, SKPhysicsContactDelegate {
    private weak var parent: EventHandler?

    init(parent: EventHandler) {
        self.parent = parent
    }

    func didBegin(_ contact: SKPhysicsContact) {
        let event = PhysicsEvent(contact: contact, type: .didBegin)
        parent?.raise(event: event)
    }

    func didEnd(_ contact: SKPhysicsContact) {
        let event = PhysicsEvent(contact: contact, type: .didEnd)
        parent?.raise(event: event)
    }
}
