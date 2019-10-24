//
//  SpeedEvent.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/23/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import CoreGraphics

final class SpeedEvent: Event {
    let speed: CGFloat

    init(speed: CGFloat) {
        self.speed = speed
    }
}
