/*--------------------------------------------------------------------------*/
/*   /\/\/\__/\/\/\        MooseFactory Foundation - Swift - v1.1           */
/*   \/\/\/..\/\/\/                                                         */
/*        |  |             (c)2007-2021 Tristan Leblanc                     */
/*        (oo)             tristan@moosefactory.eu                          */
/* MooseFactory Software                                                    */
/*--------------------------------------------------------------------------*/

//  CGComplex.swift
//  MoofFoundation
//
//  Created by Tristan Leblanc on 19/11/2020.

#if !os(watchOS)

import Foundation
import QuartzCore

public struct CGComplex {
    public var a: CGFloat
    public var b: CGFloat
    
    public init(a: CGFloat, b: CGFloat) {
        self.a = a
        self.b = b
    }
    
    public static let zero = CGComplex(a: 0, b: 0)
    
    public static func + (lhs: CGComplex, rhs: CGComplex) -> CGComplex {
        return CGComplex(a: lhs.a + rhs.a, b: lhs.b + rhs.b)
    }
    
    public static func - (lhs: CGComplex, rhs: CGComplex) -> CGComplex {
        return CGComplex(a: lhs.a - rhs.a, b: lhs.b - rhs.b)
    }

    public static func * (lhs: CGComplex, rhs: CGComplex) -> CGComplex {
        return CGComplex(a: lhs.a * rhs.a - lhs.b * rhs.b, b: lhs.a * rhs.b + lhs.b * rhs.a)
    }

    public var abs: CGFloat {
        return sqrt(a * a + b * b)
    }
    
    var vector: CGVector {
        return CGVector(dx: a, dy: b)
    }
    
}

extension CGComplex: CustomStringConvertible {
    public var description: String {
        return b >= 0 ? "(\(a)+\(b)i)" : "(\(a)-\(-b)i)"
    }
}

extension CGVector {
    public var complex: CGComplex { return CGComplex(a: dx, b: dy) }
}

#endif
