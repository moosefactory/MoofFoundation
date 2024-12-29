/*--------------------------------------------------------------------------*/
/*   /\/\/\__/\/\/\        MooseFactory Foundation - Swift - v1.1           */
/*   \/\/\/..\/\/\/                                                         */
/*        |  |             (c)2007-2021 Tristan Leblanc                     */
/*        (oo)             tristan@moosefactory.eu                          */
/* MooseFactory Software                                                    */
/*--------------------------------------------------------------------------*/

// HTTPResponse.swift
// MoofFoundation
//
// Created by Tristan Leblanc on 03/12/2020.

import Foundation

public struct HTTPResponse: Codable {
    
    public init(referer: String? = nil,
                  message: String? = nil,
                  error: String? = nil,
                  status: Int,
                  code: Int? = nil,
                  data: String? = nil) {
        self.referer = referer
        self.message = message
        self.error = error
        self.status = status
        self.code = code
        self.data = data
    }
    
    /// The url where the error was triggered
    ///
    /// This is not necessarily the called url, it can give more detail on the script that did fail
    public private(set) var referer: String?
    
    /// The message sent by server
    public private(set) var message: String?

    /// The error message sent by server
    public private(set) var error: String?
    
    /// The HTTP Rest status code sent by server
    public private(set) var status: Int
    
    /// The API error code
    public private(set) var code: Int?

    /// The associated JSON data
    public private(set) var data: String?
    
    
    public var isError: Bool {
        return (status / 100) != 2
    }
    
    public static var badResponse: HTTPResponse {
        return HTTPResponse(referer: "Client",
                            message: "Wrong API response",
                            error: "Wrong API response",
                            status: -1, code: -1, data: nil)
    }
}

extension HTTPURLResponse {
    
    var apiHTTPResponse: HTTPResponse {
        if (self.statusCode / 100) == 2 {
            return HTTPResponse(referer: "Client",
                                message: "Success",
                                error: nil,
                                status: statusCode, code: -1, data: nil)
        } else {
            return HTTPResponse(referer: "Client",
                                message: "Error",
                                error: "Wrong API response",
                                status: statusCode, code: -1, data: nil)
        }
    }
}
