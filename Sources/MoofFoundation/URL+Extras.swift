/*--------------------------------------------------------------------------*/
/*   /\/\/\__/\/\/\        MooseFactory Foundation - Swift - v1.1           */
/*   \/\/\/..\/\/\/                                                         */
/*        |  |             (c)2007-2021 Tristan Leblanc                     */
/*        (oo)             tristan@moosefactory.eu                          */
/* MooseFactory Software                                                    */
/*--------------------------------------------------------------------------*/

// URL+Extras
// MoofFoundation
//
//  Created by Tristan Leblanc on 12/01/2021.

import Foundation

public extension URL {
    var ns: NSURL {
        return NSURL(fileURLWithPath: self.path)
    }
}

public extension NSURL {
    var url: URL? {
        guard let string = self.absoluteString else { return nil }
        return URL(string: string)
    }
}
