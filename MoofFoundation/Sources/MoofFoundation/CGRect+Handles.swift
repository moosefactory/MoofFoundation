//
//  File.swift
//  
//
//  Created by Tristan Leblanc on 13/04/2021.
//

import Foundation

#if !os(watchOS)

import Foundation
import QuartzCore

// MARK: - Rect utilities -

public extension CGRect {

    enum Handle: Int, CaseIterable {
        case center
        case topLeft
        case topMiddle
        case topRight
        
        case middleLeft
        case middleRight
        
        case bottomLeft
        case bottomMiddle
        case bottomRight
        
        var fractionalLocation: CGPoint {
            switch self {
            case .center:
                return CGPoint(x: 0.5, y:  0.5)
            case .topLeft:
                return  CGPoint(x: 0, y:  1)
            case .topMiddle:
                return  CGPoint(x: 0.5, y: 1)
            case .topRight:
                return  CGPoint(x: 1, y:  1)
            case .middleLeft:
                return CGPoint(x: 0, y:  0.5)
            case .middleRight:
                return  CGPoint(x: 1, y:  0.5)
            case .bottomLeft:
                return  CGPoint(x: 0, y: 0)
            case .bottomMiddle:
                return  CGPoint(x: 0.5, y: 0)
            case .bottomRight:
                return  CGPoint(x: 1, y: 0)
            }
        }
                
        func location(on rect: CGRect) -> CGPoint {
            return rect.origin + rect.size.toPoint * fractionalLocation
        }
        
        func frame(on rect: CGRect, size: CGFloat = 3) -> CGRect {
            return location(on: rect).centeredRect(ray: 3)
        }
    }

    var center: CGPoint { frameCenter }
    var middleLeft: CGPoint { Handle.middleLeft.location(on: self) }
    var middleRight: CGPoint { Handle.middleRight.location(on: self) }
    var topLeft: CGPoint { Handle.topLeft.location(on: self) }
    var topRight: CGPoint { Handle.topRight.location(on: self) }
    var bottomLeft: CGPoint { Handle.bottomLeft.location(on: self) }
    var bottomRight: CGPoint { Handle.bottomRight.location(on: self) }
    var topMiddle: CGPoint { Handle.topMiddle.location(on: self) }
    var bottomMiddle: CGPoint { Handle.bottomMiddle.location(on: self) }

}

#endif
