//
//  File.swift
//  
//
//  Created by Tristan Leblanc on 13/04/2021.
//

#if !os(watchOS)

import Foundation
import QuartzCore

public extension CGSize {
    
    /// returns diagonal
    var distanceToOrigin: CGFloat {
        return sqrt( width * width + height * height) / 2
    }

    // Returns the size mapped to (1,1)
    var fractional: CGSize {
        return self /  max(width, height)
    }
    
    // Returns the size ratio
    var ratio: CGFloat {
        return width / height
    }

    /// returns scaled size fitting passed size
    ///
    /// returns the result size, and the applied scale
    func fit(in size: CGSize) -> (CGSize, CGFloat) {
        if width == 0 || height == 0 { return (.zero, 0) }

        var scale = size.width / width
        let newHeight = height * scale
        if newHeight > size.height {
            scale = size.height / height
        }
        let out = CGSize(width: width * scale, height: height * scale)
        return (out, scale)
    }
    
    /// returns scaled size filling passed size
    ///
    /// returns the result size, and the applied scale
    func fill(in size: CGSize) -> (CGSize, CGFloat) {
        if width == 0 || height == 0 { return (.zero, 0) }

        var scale = size.width / width
        let newHeight = height * scale
        if newHeight < size.height {
            scale = size.height / height
        }
        let out = CGSize(width: width * scale, height: height * scale)
        return (out, scale)
    }
}

// MARK: - CGSize/NSNumbers conversions

public extension CGSize {
    
    /// Converts to point
    var toPoint: CGPoint { return CGPoint(x: width, y: height)}

    /// returns dimensions as numbers
    var asNumbers: (NSNumber, NSNumber) {
        return (NSNumber(value: Double(width)), NSNumber(value: Double(height)))
    }
}
#endif
