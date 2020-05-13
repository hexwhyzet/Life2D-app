//
//  GameScene.swift
//  Life2D
//
//  Created by Ivan on 10.05.2020.
//  Copyright © 2020 Ivan. All rights reserved.
//

import SpriteKit
import GameplayKit

let CELL_PIXEL_SIZE: Int = 128;
let TIME_DELTA_SECONDS: Double = 0.5;

class GameScene: SKScene {
    
    let timeOfFrame = TIME_DELTA_SECONDS;
    let map: SKNode
    let GameCore: Game
    var lastUpdateTime: TimeInterval
    
    init(size: CGSize, _ cfg: config) {
        map = SKNode()
        GameCore = Game(size_y: cfg.size_y, size_x: cfg.size_x, initialCells: cfg.initial_cells)
        lastUpdateTime = 0
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        
        addChild(map)
        show_field()
    }
    
    func show_field() -> Void {
        
        let tileSet = SKTileSet(named: "Cells")!
        let tileSize = CGSize(width: CELL_PIXEL_SIZE, height: CELL_PIXEL_SIZE)
        
        
        let aliveCellTiles = tileSet.tileGroups.first { $0.name == "aliveCells" }
        let deadCellTiles = tileSet.tileGroups.first { $0.name == "deadCells_4"}
        
        let layer = SKTileMapNode(tileSet: tileSet, columns: self.GameCore.size_x, rows: self.GameCore.size_y, tileSize: tileSize)
        
        layer.enableAutomapping = true
        
        
        for column in 0 ..< self.GameCore.size_x {
            for row in 0 ..< self.GameCore.size_y {
                let isAlive = GameCore.field[row][column]
                
                if isAlive {
                    layer.setTileGroup(aliveCellTiles, forColumn: column, row: row)
                } else {
                    layer.setTileGroup(deadCellTiles, forColumn: column, row: row)
                }
            }
        }
        map.removeAllChildren()
        map.addChild(layer)
    }
    
    override func update(_ currentTime: TimeInterval) {
        let dt = currentTime - lastUpdateTime;
        if dt > self.timeOfFrame {
            GameCore.proccessTurn()
            show_field()
            lastUpdateTime = currentTime
        }
    }
}
