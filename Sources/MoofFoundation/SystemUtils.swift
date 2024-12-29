/*--------------------------------------------------------------------------*/
/*   /\/\/\__/\/\/\        MooseFactory Foundation - Swift - v1.1           */
/*   \/\/\/..\/\/\/                                                         */
/*        |  |             (c)2007-2021 Tristan Leblanc                     */
/*        (oo)             tristan@moosefactory.eu                          */
/* MooseFactory Software                                                    */
/*--------------------------------------------------------------------------*/
//  Created by Tristan Leblanc on 28/09/2020.

import Foundation
#if os(macOS)
import Cocoa
import IOKit
#endif

#if os(macOS)

public struct Device {
    
    public static var deviceSerialNumber: String
    {
        var machport: mach_port_t = kIOMasterPortDefault
        if #available(macOS 12.0, *) {
            machport = kIOMainPortDefault
        }
        let ioService = IOServiceGetMatchingService(machport, IOServiceMatching("IOPlatformExpertDevice"))

        let cfSerialNumber = IORegistryEntryCreateCFProperty(ioService, kIOPlatformSerialNumberKey as CFString, kCFAllocatorDefault, 0)
        IOObjectRelease(ioService)
        return cfSerialNumber?.takeUnretainedValue() as? String ?? ""
    }
}

public extension NSScreen {
    
    /// Returns device screen resolution, or 72dpi default
    static var screenRes: CGFloat = {
        let r = NSScreen.main?.deviceDescription[NSDeviceDescriptionKey.resolution] as? CGFloat
        return CGFloat(r ?? 72)
    }()
}

#endif
