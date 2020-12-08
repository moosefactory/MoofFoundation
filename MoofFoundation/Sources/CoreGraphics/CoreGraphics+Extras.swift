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

//  CoreGraphics+Extras.swift
//  MoofFoundation
//
//  Created by Tristan Leblanc on 20/11/2020.

#if !os(watchOS)

import Foundation
import QuartzCore
import CoreImage

// MARK: - CGContext

public extension CGContext {
    var size: CGSize {
        return CGSize(width: width, height: height)
    }
}

// MARK: - CALayer

public extension CALayer {

    /// Remove all sublayers
    func removeAllSublayers() {
        sublayers?.forEach { $0.removeFromSuperlayer() }
    }
    
    /// Return a non optional display name
    var displayName: String {
        return name ?? "<Unnamed Layer>"
    }

    /// Return the coordinates of the layer center, in layer referential ( bounds center )
    var center: CGPoint {
        return bounds.boundsCenter
    }
}

// MARK: - CGImage

public extension CGImage {
    
    /// Returns a qrcode encoding passed string
    static func qrCode(from string: String) -> CGImage? {
        let data = string.data(using: String.Encoding.ascii)
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return CIContext().createCGImage(output, from: output.extent)
            }
        }
        
        return nil
    }
}

#endif
