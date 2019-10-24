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
    private weak var scene: SKScene?

    init(parentScene scene: SKScene) {
        self.scene = scene
    }

    func didBegin(_ contact: SKPhysicsContact) {
        let event = PhysicsEvent(contact: contact, type: .didBegin)
        scene?.children.forEach { $0.handle(event: event) }
    }

    func didEnd(_ contact: SKPhysicsContact) {
        let event = PhysicsEvent(contact: contact, type: .didEnd)
        scene?.children.forEach { $0.handle(event: event) }
    }
}
