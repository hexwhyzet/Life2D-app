//
//  Field.swift
//  Life2D
//
//  Created by Ivan on 10.05.2020.
//  Copyright © 2020 Ivan. All rights reserved.
//

import Foundation

class Game {
    var size_y: Int
    var size_x: Int
    var field: [[Bool]]
    var initialCells: [[Int]]
    
    
    init(size_y: Int, size_x: Int, initialCells: [[Int]]) {
        self.size_y = size_y
        self.size_x = size_x
        self.initialCells = initialCells
        self.field = Array(repeating: Array(repeating: false, count: size_x), count: size_y)
        setInitialCells()
    }
    
    func setInitialCells() -> Void{
        self.field = Array(repeating: Array(repeating: false, count: size_x), count: size_y)
        for cell in self.initialCells {
            self.field[cell[0]][cell[1]] = true
        }
    }
    
    func howManyNeighbors(y: Int, x: Int) -> Int {
        var ctr = 0
        for new_y in [(y - 1 + self.size_y) % self.size_y, y, (y + 1) % self.size_y] {
            for new_x in [(x - 1 + self.size_x) % self.size_x, x, (x + 1) % self.size_x] {
                if !((new_y == y) && (new_x == x)) {
                    if field[new_y][new_x] {ctr += 1}
                }
            }
        }
        return ctr
    }
    
    func willCellSurvive(y: Int, x: Int) -> Bool {
        let neighborsNum = howManyNeighbors(y: y, x: x)
        return (2 <= neighborsNum) && (neighborsNum <= 3)
    }
    
    func willCellAppear(y: Int, x: Int) -> Bool {
        let neighborsNum = howManyNeighbors(y: y, x: x)
        return neighborsNum == 3
    }
    
    func proccessTurn() {
        var newField = Array(repeating: Array(repeating: false, count: self.size_x), count: self.size_y)
        for row in 0..<self.size_y {
            for column in 0..<self.size_x {
                if (field[row][column]) {
                    newField[row][column] = self.willCellSurvive(y: row, x: column)
                } else {
                    newField[row][column] = self.willCellAppear(y: row, x: column)
                }
            }
        }
        self.field = newField
    }
    
    func printField() -> Void {
        for row in field {
            for cell in row {
                if cell{
                    print(1, terminator: "")
                } else {
                    print(0, terminator: "")
                }
            }
            print("\n", terminator: "")
        }
    }
    
}
