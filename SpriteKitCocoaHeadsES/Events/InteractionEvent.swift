//
//  InteractionEvent.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/22/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import SpriteKit

enum InteractionType {
    case tap
    case swipeDown
}

final class InteractionEvent: Event {
    let type: InteractionType

    init(type: InteractionType) {
        self.type = type
    }
}
