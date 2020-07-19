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
    private var controller: GCController?

    init(parent: EventHandler) {
        self.parent = parent
        addObservers()
    }

    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(setupInput), name: Notification.Name.GCControllerDidConnect, object: nil)
    }

    @objc func setupInput() {
        self.controller = GCController.controllers().first
        controller?.extendedGamepad?.buttonA.pressedChangedHandler = { [weak self] (_,_,pressed) in
            if pressed { self?.raise(event: InteractionEvent(type: .tap)) }
        }
    }

    func raise(event: Event) {
        parent?.raise(event: event)
    }

    func handle(event: Event) {}
}
