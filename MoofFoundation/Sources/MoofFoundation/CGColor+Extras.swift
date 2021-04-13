/*--------------------------------------------------------------------------*/
/*   /\/\/\__/\/\/\        MooseFactory Foundation - v2.0                   */
/*   \/\/\/..\/\/\/                                                         */
/*        |  |             (c)2007-2020 Tristan Leblanc                     */
/*        (oo)             tristan@moosefactory.eu                          */
/* MooseFactory Software                                                    */
/*--------------------------------------------------------------------------*/
/*
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE. */
/*--------------------------------------------------------------------------*/

//  NSColor+Extras.swift
//  MoofFoundation
//
//  Created by Tristan Leblanc on 27/04/2020.

#if !os(watchOS)

import Foundation
import QuartzCore
#if os(macOS)
import Cocoa
public typealias PlatformColor = NSColor
#else
import UIKit
public typealias PlatformColor = UIColor
#endif

// MARK: - CGColor

public extension CGColor {
    
    /// hsla
    ///
    /// Return Hue/Saturation/Lightness/Alpha values
    var hsla: HSLATuple {
        return color.hsla
    }
    
    
    /// rgba
    ///
    /// Return Red/Green/Blue/Alpha values
    var rgba: RGBATuple {
        let color = self.color
        return (
            r: color.red,
            g: color.green,
            b: color.blue,
            a: color.alpha
        )
    }
    
    /// platformColor
    ///
    /// Returns either a NSColor or a UIColor
    var platformColor: PlatformColor {
        let color = self.color
        return PlatformColor(red: color.red, green: color.green, blue: color.blue, alpha: color.alpha)
    }

    /// init(hsla: HSLATuple)
    ///
    /// Init with Hue/Saturation/Lightness/Alpha values
    static func make(with hsla: HSLATuple) -> CGColor {
        return Color(hsla: hsla).cgColor
    }
    
    /// init(hsla: HSLATuple)
    ///
    /// Init with Red/Green/Blue/Alpha values
    static func make(with rgba: RGBATuple) -> CGColor {
        CGColor(red: rgba.r, green: rgba.g, blue: rgba.b, alpha: rgba.a)
    }
}

// MARK: - CGColor to Color conversion

public extension CGColor {
    
    var color: Color {
        guard let comps = components else {
            return .black
        }
        let n = numberOfComponents
        switch n {
        // Grayscale
        case 1:
            return Color(red: comps[0], green: comps[0], blue: comps[0], alpha: 1)
        // Grayscale with alpha
        case 2:
            return Color(red: comps[0], green: comps[0], blue: comps[0], alpha: comps[1])
        // RGB
        case 3:
            return Color(red: comps[0], green: comps[1], blue: comps[2], alpha: 1)
        // RGB with alpha
        case 4:
            return Color(red: comps[0], green: comps[1], blue: comps[2], alpha: comps[3])
        default:
            return .black
        }
    }
}

// MARK: - MacOS/iOS Colors

public extension PlatformColor {
    
    var color: Color { cgColor.color }
    
    var hsla: HSLATuple { color.hsla }
    
    var rgba: RGBATuple { color.rgba }
    
    
    convenience init(color: Color) {
        self.init(red: color.red, green: color.green, blue: color.blue, alpha: color.alpha)
    }

    convenience init(hsla: HSLATuple) {
        self.init(hue: hsla.h, saturation: hsla.s, brightness: hsla.l, alpha: hsla.a)
    }
    
    convenience init(rgba: RGBATuple) {
        self.init(red: rgba.r, green: rgba.g, blue: rgba.b, alpha: rgba.a)
    }
}

extension Color {
    
    init(hsla: HSLATuple) {
        let platformColor = PlatformColor(hsla: hsla)
        self = platformColor.color
    }
    
    var platformColor: PlatformColor {
        PlatformColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

// MARK: - Color/Hex Conversion

public extension PlatformColor {
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        self.init(color: Color(hexString: hexString))
    }

    var hex: String {
        return color.hex
    }
}


#endif
