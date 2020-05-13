//
//  GameScene.swift
//  Life2D
//
//  Created by Ivan on 10.05.2020.
//  Copyright © 2020 Ivan. All rights reserved.
//

import SpriteKit
import GameplayKit

class FieldScene: SKScene {
    let map = SKNode()
    
    override func didMove(to view: SKView) {
        addChild(map)
        map.xScale = 0.2
        map.yScale = 0.2
        
        let tileSet = SKTileSet(named: "field cells")!
        let tileSize = CGSize(width: 128, height: 128)
        let columns = 128
        let rows = 128
        
        let aliveCellTiles = tileSet.tileGroups.first { $0.name == "alive cell" }
        let deadCellTiles = tileSet.tileGroups.first { $0.name == "dead cell"}
        
        let bottomLayer = SKTileMapNode(tileSet: tileSet, columns: columns, rows: rows, tileSize: tileSize)
        bottomLayer.fill(with: deadCellTiles)
        map.addChild(bottomLayer)
        
    }
    
}
