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

//  Color.swift
//  MoofFoundation
//
//  Created by Tristan Leblanc on 25/11/2020.


#if !os(watchOS)

import Foundation
import QuartzCore

import simd
#if os(macOS)
import Cocoa
#else
import UIKit
#endif

import SwiftUI

// MARK: - Colors HSLA and RGBA Tuples

public typealias HSLATuple = (h: CGFloat, s: CGFloat, l: CGFloat, a: CGFloat)
public typealias HSBATuple = (h: CGFloat, s: CGFloat, b: CGFloat, a: CGFloat)
public typealias RGBATuple = (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)

protocol RGBAObject {
    
}
//
//extension SwiftUI.Color {
//    var mfColor: MoofFoundation.Color {
//        
//    }
//}

public struct Color: RGBAObject, Codable {
    
    public var red: CGFloat = 0
    public var green: CGFloat = 0
    public var blue: CGFloat = 0
    public var alpha: CGFloat = 0
    
    public init() {
        self.red = 0
        self.green = 0
        self.blue = 0
        self.alpha = 1
    }
    
    public init(red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 1) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }

    enum CodingKeys: String, CodingKey {
        case red
        case green
        case blue
        case alpha
    }
    
    public static let red = Color(red: 1, green: 0, blue: 0, alpha: 1)
    public static let green = Color(red: 0, green: 1, blue: 0, alpha: 1)
    public static let blue = Color(red: 0, green: 0, blue: 1, alpha: 1)

    public static let yellow = Color(red: 1, green: 1, blue: 0, alpha: 1)
    public static let orange = Color(red: 1, green: 0.5, blue: 0, alpha: 1)
    public static let mauve = Color(red: 1, green: 0, blue: 1, alpha: 1)

    public static let black = Color(red: 0, green: 0, blue: 0, alpha: 1)
    public static let white = Color(red: 1, green: 1, blue: 1, alpha: 1)
    public static let clear = Color(red: 0, green: 0, blue: 0, alpha: 0)
    
    public static func + (lhs: Color, rhs: Color) -> Color {
        return Color(red: lhs.red + rhs.red, green: lhs.green + rhs.green, blue: lhs.blue + rhs.blue, alpha: lhs.alpha + rhs.alpha)
    }
    
    public static func += (lhs: inout Color, rhs: Color) {
        lhs.red += rhs.red
        lhs.green += rhs.green
        lhs.blue += rhs.blue
        lhs.alpha += rhs.alpha
    }
    
    public static func baryColor(_ color1: Color, _ color2: Color, fraction: CGFloat = 0.5) -> Color {
        
        return Color(red: color1.red.bary(to: color2.red, fraction: fraction),
                     green: color1.green.bary(to: color2.green, fraction: fraction),
                     blue: color1.blue.bary(to: color2.blue, fraction: fraction),
                     alpha: color1.alpha.bary(to: color2.alpha, fraction: fraction))
    }
    
    public func with(alpha: CGFloat) -> Color {
        return Color(red: red, green: green, blue: blue, alpha: alpha)
    }
}

public extension Color {
    
    static func - (lhs: Color, rhs: Color) -> Color {
        return Color(red: lhs.red - rhs.red, green: lhs.green - rhs.green, blue: lhs.blue - rhs.blue, alpha: lhs.alpha - rhs.alpha)
    }
    
    static func / (lhs: Color, rhs: Int) -> Color {
        let f = CGFloat(rhs)
        return Color(red: lhs.red / f, green: lhs.green / f, blue: lhs.blue / f, alpha: lhs.alpha / f)
    }
    
    static func / (lhs: Color, rhs: CGFloat) -> Color {
        return Color(red: lhs.red / rhs, green: lhs.green / rhs, blue: lhs.blue / rhs, alpha: lhs.alpha / rhs)
    }
    
    static func * (lhs: Color, rhs: Int) -> Color {
        let f = CGFloat(rhs)
        return Color(red: lhs.red * f, green: lhs.green * f, blue: lhs.blue * f, alpha: lhs.alpha * f)
    }

    static func * (lhs: Color, rhs: CGFloat) -> Color {
        return Color(red: lhs.red * rhs, green: lhs.green * rhs, blue: lhs.blue * rhs, alpha: lhs.alpha * rhs)
    }
}

public extension Color {
    var simd: simd_float4 { return [Float(red), Float(green), Float(blue), Float(alpha)] }
    
    #if os(macOS)
    var cgColor: CGColor { if #available(OSX 10.15, *) {
        return CGColor(srgbRed: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    } else {
        return CGColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    }}
    #else
    var cgColor: CGColor { return CGColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))}
    #endif
}

extension Color: CustomStringConvertible {
    public var description: String {
        return "r:\(red.dec3) g:\(green.dec3) b:\(blue.dec3) a:\(alpha.dec3) "
    }
}

public extension Color {

    var rgba: RGBATuple { return (red, green, blue, alpha) }
    
    var hsla: HSLATuple {
        var hsla: HSLATuple = (h: 0, s:0, l: 0, a: alpha)
        let minRGB = min(red, min(green,blue));
        let maxRGB = max(red, max(green,blue));

        guard minRGB != maxRGB else {
            hsla.l = minRGB
            return hsla
        }
        
        let d: CGFloat = red == minRGB ? green-blue
            : blue == minRGB ? red-green : blue-red
        let h: CGFloat = red == minRGB ? 3
            : blue == minRGB ? 1 : 5
        hsla.h = (h - d / (maxRGB - minRGB)) / 6
        hsla.s = (maxRGB - minRGB) / maxRGB
        hsla.l = maxRGB

        if hsla.l > 0 && hsla.l <= 0.5 {
            hsla.s = (maxRGB - minRGB) / (2 * hsla.l)
        } else {
            hsla.s = (maxRGB - minRGB)/(2 - 2 * hsla.l)
        }
        
        return hsla
    }
        
    var hsba: HSBATuple {
        var hsba: HSBATuple = (h: 0, s:0, b: 0, a: alpha)
        let minRGB = min(red, min(green,blue));
        let maxRGB = max(red, max(green,blue));

        guard minRGB != maxRGB else {
            hsba.b = minRGB
            return hsba
        }
        
        let d: CGFloat = red == minRGB ? green-blue
            : blue == minRGB ? red-green : blue-red
        let h: CGFloat = red == minRGB ? 3
            : blue == minRGB ? 1 : 5
        hsba.h = (h - d / (maxRGB - minRGB)) / 6
        hsba.b = maxRGB
        hsba.s = (maxRGB - minRGB) / maxRGB

        return hsba
    }
    
    func with(brightnessFactor: CGFloat) -> Color {
        var hsla = self.hsla
        hsla.l = max(min(hsla.l * brightnessFactor, 1),0)
        return PlatformColor(hsla: hsla).color
    }
    
    
    var darken: Color {
        return with(brightnessFactor: 0.50)
    }
    
    var lighten: Color {
        return with(brightnessFactor: 2)
    }
    
    /// Returns a black or white color that is visible on a background of given color
    static func visibleColor(on color: Color) -> Color {
        let brightness = color.hsla.l
        return brightness < 0.35 ? .white : .black
    }
}

// MARK: - Color/Hex Conversion

public extension Color {
    
    init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }

    var hex: String {
        let rgb:Int = (Int)(red*255)<<16 | (Int)(green*255)<<8 | (Int)(blue*255)<<0
        return String(format:"#%06x", rgb)
    }
    
}

// MARK: - SwiftUI

public extension Color {
    
    @available(iOS 14.0, *)
    var suiColor: SwiftUI.Color {
        return SwiftUI.Color(self.cgColor)
    }
    
}

#if os(macOS)

// MARK: - MacOS

public extension Color {
    var nsColor: NSColor { platformColor }
}

#else

// MARK: - iOS

public extension Color {
    var uiColor: UIColor { platformColor }
}

#endif

#endif
