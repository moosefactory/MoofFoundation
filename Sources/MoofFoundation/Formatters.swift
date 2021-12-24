/*--------------------------------------------------------------------------*/
/*   /\/\/\__/\/\/\        MooseFactory Foundation - Swift - v1.1           */
/*   \/\/\/..\/\/\/                                                         */
/*        |  |             (c)2007-2021 Tristan Leblanc                     */
/*        (oo)             tristan@moosefactory.eu                          */
/* MooseFactory Software                                                    */
/*--------------------------------------------------------------------------*/

//  Formatters.swift
//  MoofFoundation
//
//  Created by Tristan Leblanc on 09/10/2020.

#if !os(watchOS)

import Foundation
import QuartzCore

public extension CGPoint {
    var dec3: String {
        return "\(x.dec3),\(y.dec3)"
    }
}

public extension CGSize {
    var dec3: String {
        return "\(width.dec3),\(height.dec3)"
    }
}

//MARK: - 3 Decimals formatter - Usefull for debug logging

public extension CGFloat {

    var dec3: String {
        Double(self).dec3
    }
}

public extension Double {
    
    static let formatter3Dec: NumberFormatter = {
        let f = NumberFormatter()
        f.maximumFractionDigits = 3
        return f
    }()
    
    var dec3: String {
        let n = NSNumber(value: Double(self))
        return Double.formatter3Dec.string(from: n) ?? "\(self)"
    }
}


#endif


