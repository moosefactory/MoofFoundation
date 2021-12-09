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

//  Conversions.swift
//  MoofFoundation
//
//  Created by Tristan Leblanc on 20/11/2020.

#if !os(watchOS)

import Foundation
import QuartzCore

// MARK: Fractionals

public extension CGFloat {
    
    @_transparent
    func clamp(_ _min: CGFloat = 0, _ _max: CGFloat) -> CGFloat {
        return Swift.max(_min, Swift.min(_max, self))
    }
    
    @_transparent
    var clampToPositiveFractional: CGFloat {
        return Swift.max(CGFloat(0), Swift.min(CGFloat(1), self))
    }
    
    @_transparent
    var clampToFractional: CGFloat {
        return Swift.max(CGFloat(-1), Swift.min(CGFloat(1), self))
    }
    
    @_transparent
    func bary(to: CGFloat, fraction: CGFloat = 0.5) -> CGFloat {
        let f = fraction.clampToPositiveFractional
        return self * (1 - f) + to * f
    }
}

// MARK: Degrees / radians conversions

public extension CGFloat {
    static let degToRadFactor = CGFloat.pi / 180
    var degreeToRadian: CGFloat { return self * CGFloat.degToRadFactor }
    var radianToDegree: CGFloat { return self / CGFloat.degToRadFactor }
}

public extension Float {
    static let degToRadFactor = Float.pi / 180
    var degreeToRadian: Float { return self * Float.degToRadFactor }
    var radianToDegree: Float { return self / Float.degToRadFactor }
}

// MARK: Low pass filter
public extension CGFloat {
    func lowPassFilter(k: CGFloat = 0.96, value: inout CGFloat) {
        value = ((1 - k) * self) + (k * value)
    }
}

public extension Double {
    func lowPassFilter(k: Double = 0.96, value: inout Double) {
        value = ((1 - k) * self) + (k * value)
    }
}

#endif
