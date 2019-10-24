//
//  PhysicsCategory.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/21/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation

struct PhysicsCategory {
    static let none: UInt32 = 0
    static let all: UInt32 = UInt32.max
    static let player: UInt32 = 0b001
    static let scenery: UInt32 = 0b010
    static let enemy: UInt32 = 0b011
}
