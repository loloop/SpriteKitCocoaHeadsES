//
//  GameController.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/23/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import GameController

final class GameController: EventHandler {

    private weak var parent: EventHandler?
    private let controller: GCController

    init(parent: EventHandler) {
        self.controller = GCController()
        self.parent = parent
        setupInput()
    }

    func setupInput() {
        controller.extendedGamepad?.valueChangedHandler = { [weak self] pad, element in
            self?.raise(event: InteractionEvent(type: .tap))
        }
    }

    func raise(event: Event) {
        parent?.raise(event: event)
    }

    func handle(event: Event) {}
}
