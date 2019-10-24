//
//  SKView+Debug.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/22/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import SpriteKit


extension SKView {
    var showsDebuggingOptions: Bool {
        set {
            #if DEBUG
            showsNodeCount = newValue
            showsFPS = newValue
            showsFields = newValue
            showsPhysics = newValue
            showsDrawCount = newValue
            showsQuadCount = newValue
            #endif
        }

        get {
            return showsNodeCount &&
            showsFPS &&
            showsFields &&
            showsPhysics &&
            showsDrawCount &&
            showsQuadCount
        }
    }
}


