//
//  Event.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/21/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import SpriteKit

@objc class Event: NSObject {}

protocol EventHandler: AnyObject {
    func handle(event: Event)
    func raise(event: Event)
}
