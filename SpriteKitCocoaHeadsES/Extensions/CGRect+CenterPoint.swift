//
//  CGRect+CenterPoint.swift
//  SpriteKitCocoaHeadsES
//
//  Created by Mauricio Cardozo on 10/22/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import CoreGraphics

extension CGRect {
    var center: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
}
