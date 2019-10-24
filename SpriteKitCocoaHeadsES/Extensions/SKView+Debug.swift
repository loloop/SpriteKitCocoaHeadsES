//
//  SKView+Debug.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/22/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import SpriteKit

#if DEBUG
extension SKView {
    var showsDebuggingOptions: Bool {
        set {
            showsNodeCount = newValue
            showsFPS = newValue
            showsFields = newValue
            showsPhysics = newValue
            showsDrawCount = newValue
            showsQuadCount = newValue
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
#endif

