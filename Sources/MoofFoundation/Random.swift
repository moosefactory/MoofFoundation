/*--------------------------------------------------------------------------*/
/*   /\/\/\__/\/\/\        MooseFactory Foundation - Swift - v1.1           */
/*   \/\/\/..\/\/\/                                                         */
/*        |  |             (c)2007-2021 Tristan Leblanc                     */
/*        (oo)             tristan@moosefactory.eu                          */
/* MooseFactory Software                                                    */
/*--------------------------------------------------------------------------*/

//  Random.swift
//  MoofFoundation
//
//  Created by Tristan Leblanc on 19/11/2020.

import Foundation

#if !os(watchOS)
import QuartzCore

public extension CGFloat {
    
    /// Returns a  random value betwenn 0 and 1
    static func random() -> CGFloat {
        return CGFloat(Double(arc4random()) / Double(UInt32.max))
    }

    /// Returns a  random value betwenn 0 and 2π
    static func randomAngle() -> CGFloat {
        return CGFloat.pi * 2 * CGFloat(Double(arc4random()) / Double(UInt32.max))
    }

    /// Returns a random value betwenn -1 and 1
    static func signedRandom() -> CGFloat {
        return CGFloat( ((Double(arc4random()) / Double(UInt32.max)) - 0.5) * 2 )
    }

    /// Returns a random number between min and max
    static func random(min: CGFloat = 0, max: CGFloat = 1) -> CGFloat {
        let r = Double(arc4random()) / Double(UInt32.max)
        return min + CGFloat(r) * (max - min)
    }

    /// Returns a random number given a possible variation centered on median value
    static func random(median: CGFloat, variation: CGFloat) -> CGFloat {
        let r = Double(arc4random()) / Double(UInt32.max)
        return median + CGFloat(r) - variation / 2
    }

    /// Returns a random number given a possible variation based on a minimum value
    static func random(base: CGFloat, variation: CGFloat) -> CGFloat {
        return random(min: base, max: base + variation)
    }
}

#endif

public extension Double {
    static func randomFractionnal() -> Double {
        Double(arc4random()) / Double(UInt32.max)
    }
    
    /// Returns a random UInt8 number
    static func random(min: Double = 0, max: Double = 1) -> Double {
        let r = Double(arc4random()) / Double(UInt32.max)
        return min + Double(r * Double(max - min))
    }
}

public extension UInt8 {
    
    /// Returns a random UInt8 number
    static func random(min: UInt8 = 0, max: UInt8 = 255) -> UInt8 {
        let r = Double(arc4random()) / Double(UInt32.max)
        return min + UInt8(r * Double(max - min))
    }
}

public extension UInt16 {
    
    /// Returns a random UInt8 number
    static func random(min: UInt16 = 0, max: UInt16 = 65535) -> UInt16 {
        let r = Double(arc4random()) / Double(UInt32.max)
        return min + UInt16(r * Double(max - min))
    }
}

public extension Float {
    
    /// Returns a random float number
    static func random(min: Float = 0, max: Float = 1) -> Float {
        let x = Float(arc4random()) / Float(UInt32.max)
        return min + Float(x) * (max - min)
    }
}
