//
//  GenericEvent.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/22/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation

final class GenericEvent<T>: Event {
    let type: T
    init(type: T) {
        self.type = type
    }
}
