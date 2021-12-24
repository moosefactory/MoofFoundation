/*--------------------------------------------------------------------------*/
/*   /\/\/\__/\/\/\        MooseFactory Foundation - Swift - v1.1           */
/*   \/\/\/..\/\/\/                                                         */
/*        |  |             (c)2007-2021 Tristan Leblanc                     */
/*        (oo)             tristan@moosefactory.eu                          */
/* MooseFactory Software                                                    */
/*--------------------------------------------------------------------------*/

//  Dictionary+Getters.swift
//  MoofFoundation
//
//  Created by Tristan Leblanc on 06/12/2020.

import Foundation
#if !os(watchOS)
import QuartzCore
#endif

extension Dictionary where Key == String, Value == Any {
    
    func string(_ key: Key) -> String? {
        return self[key] as? String
    }
    
    func int(_ key: Key) -> Int? {
        return self[key] as? Int
    }
    
    func float(_ key: Key) -> Float? {
        return self[key] as? Float
    }
    
    func double(_ key: Key) -> Double? {
        return self[key] as? Double
    }

    func bool(_ key: Key) -> Bool? {
        return self[key] as? Bool
    }
    
    func date(_ key: Key) -> Date? {
        return self[key] as? Date
    }
    
    func dict(_ key: Key) -> Dictionary? {
        return self[key] as? Dictionary
    }
    
    func array<T>(_ key: Key) -> Array<T>? {
        return self[key] as? Array<T>
    }
    
    #if !os(watchOS)

    func cgFloat(_ key: Key) -> CGFloat? {
        return self[key] as? CGFloat
    }
    
    #endif
    
}
