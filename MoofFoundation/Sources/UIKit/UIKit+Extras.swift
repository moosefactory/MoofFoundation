//
//  UIKit+Extras.swift
//  MoofFoundation
//
//  Created by Tristan Leblanc on 12/12/2020.
//  Copyright © 2020 MooseFactory Software. All rights reserved.
//

import Foundation
#if !os(macOS)
import UIKit

public extension UIView {

    /// Quick width constraint

    var width: CGFloat {
        set {
            addConstraint(NSLayoutConstraint(item: self, attribute: .width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200))
        }
        get {
            self.frame.size.width
        }
    }
}

#endif
