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

//  Files.swift
//  MoofFoundation
//
//  Created by Tristan Leblanc on 21/11/2020.

import Foundation

public extension FileManager {
    
    /// Read data from all files in a directory
    ///
    /// This function does not test any parameter and does nothing with nils
    
    func forEachDataInDirectory(url: URL?, closure: (URL, Data)->Void) {
        forEachFileInDirectory(url: url) { fileURL in
            if fileExists(atPath: fileURL.path), let data = try? Data(contentsOf: fileURL) {
                closure(fileURL, data)
            }
        }
    }
    
    /// Iterate files urls in a directory
    
    func forEachFileInDirectory(url: URL?, closure: (URL)->Void) {
        guard let url = url, let fileURLs = try? contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: []) else {
            return
        }
        for fileURL in fileURLs {
            var isDir: ObjCBool = false
            if fileExists(atPath: fileURL.absoluteString, isDirectory: &isDir) {
                if !isDir.boolValue {
                    closure(fileURL)
                }
            }
        }
    }
    
    /// Iterate directories urls in a directory
    
    func forEachFolderInDirectory(url: URL?, closure: (URL)->Void) {
        guard let url = url, let fileURLs = try? contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: []) else {
            return
        }
        for fileURL in fileURLs {
            var isDir: ObjCBool = false
            if fileExists(atPath: fileURL.absoluteString, isDirectory: &isDir) {
                if !isDir.boolValue {
                    closure(fileURL)
                }
            }
        }
    }
}
