//
//  SKNode+EventHandler.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/22/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import SpriteKit

extension SKNode: EventHandler {
    @objc func handle(event: Event) {
        guard !children.isEmpty else { return }
        children.forEach { $0.handle(event: event) }
    }

    @objc func raise(event: Event) {
        parent?.raise(event: event)
    }
}
