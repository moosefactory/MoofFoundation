/*--------------------------------------------------------------------------*/
/*   /\/\/\__/\/\/\        MooseFactory Foundation - Swift - v1.1           */
/*   \/\/\/..\/\/\/                                                         */
/*        |  |             (c)2007-2021 Tristan Leblanc                     */
/*        (oo)             tristan@moosefactory.eu                          */
/* MooseFactory Software                                                    */
/*--------------------------------------------------------------------------*/

// Tile.swift
// MoofFoundation
//
// Created by Tristan Leblanc on 19/11/2020.

#if !os(watchOS)

import Foundation
import QuartzCore

/// Tile
///
/// A tile is a rectangular area used to sub-divide a wider rectangle.
/// Each tile gives a convenient acccess to its size, index and coordinates in source rectangle
///
/// Tiles are stored in a Tiles' object that offers access to tiles as array, array of rects, bitmap utilities
///
/// Create square tiles is as easy as doing `tiles = myRect.tiles(size)`

public struct Tile {
    public private(set) var size: Int
    public private(set) var x: Int
    public private(set) var y: Int
    public private(set) var minX: Int
    public private(set) var minY: Int
    public private(set) var maxX: Int
    public private(set) var maxY: Int
    public var width: Int { maxX - minX }
    public var height: Int { maxY - minY }
    
    public var rect: CGRect {
        return CGRect(x: minX, y: minY, width: width, height: height)
    }
}

public extension Tile {
    func stroke(in ctx: CGContext) {
        ctx.stroke(rect)
    }
}

// MARK: - Tiles container

public struct Tiles {
    public private(set) var tiles: [[Tile]]

    public var flatTiles: [Tile] { return tiles.flatMap {$0} }
    
    public var rects: [CGRect] { return flatTiles.map {$0.rect} }
    
    public var numberOfTiles: Int { return hTiles * vTiles }
    
    public var rgbaBufferSize: Int { return width * 4 * height }
    
    public private(set) var hTiles: Int
    public private(set) var vTiles: Int
    public private(set) var size: Int
    
    public private(set) var width: Int
    public private(set) var height: Int
    
    public func stroke(in ctx: CGContext) {
        ctx.addRects(rects)
        ctx.strokePath()
    }
    
    /// Iterate tiles
    func forEach(_ closure: (Tile)->Void) {
        flatTiles.forEach { closure($0) }
    }
    
    /// Returns work items to process each tile concurrently 
    public func makeWorkItems(with closure: @escaping (Tile) -> Void) -> [(Tile, DispatchWorkItem)] {
        return flatTiles.map { tile in
            (tile, DispatchWorkItem(qos: DispatchQoS.userInteractive,
                             flags: DispatchWorkItemFlags.assignCurrentContext) {
                                    closure(tile)
            })
        }
    }
}

extension Tiles: CustomStringConvertible {
    public var description: String {
        return "Tiles - count = \(hTiles) x \(vTiles) - size : \(size)"
    }
}

public extension CGRect {
    
    func tiles(size: Int) -> Tiles {
        let w = Int(width)
        let h = Int(height)
        let hTiles = w / size
        let vTiles = h / size
        let hRest = w - hTiles * size
        let vRest = h - vTiles * size
        var tiles = [[Tile]]()
        for j in 0..<vTiles {
            var row = [Tile]()
            for i in 0..<hTiles {
                row.append(Tile(size: size, x: i, y: j,
                                minX: i * size, minY: j * size,
                                maxX: (i+1) * size, maxY: (j+1) * size))
            }
            if hRest > 0 {
                row.append(Tile(size: size, x: hTiles, y: j,
                                minX: hTiles * size, minY: j * size,
                                maxX: hTiles * size + hRest, maxY: (j+1) * size))
            }
            tiles.append(row)
        }
        
        if vRest > 0 {
            var row = [Tile]()
            for i in 0..<hTiles {
                row.append(Tile(size: size, x: i, y: vTiles,
                                minX: i * size, minY: vTiles * size,
                                maxX: (i+1) * size, maxY: vTiles * size + vRest))
            }
            if hRest > 0 {
                row.append(Tile(size: size, x: hTiles, y: vTiles,
                                minX: hTiles * size, minY: vTiles * size,
                                maxX: hTiles * size + hRest, maxY: vTiles * size + vRest))
            }
            tiles.append(row)
        }
        
        return Tiles(tiles: tiles,
                     hTiles: hTiles + (hRest > 0 ? 1 : 0),
                     vTiles: vTiles + (vRest > 0 ? 1 : 0),
                     size: size, width: w, height: h)
    }
}

extension CGContext {
    
    func scanTile(_ tile: Tile, userInfo: inout Any?, ctm: CGAffineTransform, componentsGenerator: ScanParameters) {
        for y in tile.minY..<tile.maxY {
            for x in tile.minX..<tile.maxX {
                let p = CGPoint(x: x, y: y).applying(ctm)
                setColorComponents(x: x, y: y, components: componentsGenerator(p, &userInfo, ctm))
            }
        }
    }
}

#endif
