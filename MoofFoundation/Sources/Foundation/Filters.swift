//
//  Filters.swift
//  MoofFoundation
//
//  Created by Tristan Leblanc on 12/12/2020.
//  Copyright © 2020 MooseFactory Software. All rights reserved.
//

import Foundation
import QuartzCore

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
