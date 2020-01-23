//
//  Color.swift
//  ColorPicker
//
//  Created by Aaron Cleveland on 1/23/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

import Foundation
import UIKit

// Utility Color Type
// taking functionality of passing in an offset and getting back hue and sat
struct Color {
    static func getHueSaturation(at offset: CGPoint) -> (hue: CGFloat, saturation: CGFloat) {
        if offset == CGPoint.zero {
            return (hue: 0, saturation: 0)
        } else {
            // The further away from the center you are, the more saturated the color
            let saturation = sqrt(offset.x * offset.x + offset.y * offset.y)
            // the offset angle is determined to figure out what hue to use within the full spectrum
            var hue = acos(offset.x / saturation) / (2.0 * CGFloat.pi)
            if offset.y < 0 { hue = 1.0 - hue }
            return (hue: hue, saturation: saturation)
        }
    }
}
