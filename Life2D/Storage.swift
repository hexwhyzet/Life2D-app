//
//  Storage.swift
//  Life2D
//
//  Created by Ivan on 12.05.2020.
//  Copyright © 2020 Ivan. All rights reserved.
//

import Foundation

struct config {
    let name: String
    let size_y: Int
    let size_x: Int
    let min_size_y: Int
    let min_size_x: Int
    let initial_cells: [[Int]]
}

let storage: [String: config] = [
    "glider":
        config(name: "glider",
               size_y: 13,
               size_x: 12 * 3,
               min_size_y: 13,
               min_size_x: 12,
               initial_cells: [[1, 8], [2, 5], [2, 6], [2, 7], [2, 8], [2, 9], [3, 2], [3, 4], [3, 5], [3, 9], [3, 10], [4, 1], [4, 9], [5, 2], [5, 7], [5, 8], [7, 2], [7, 7], [7, 8], [8, 1], [8, 9], [9, 2], [9, 4], [9, 5], [9, 9], [9, 10], [10, 5], [10, 6], [10, 7], [10, 8], [10, 9], [11, 8], [5, 4], [7, 4]]
    ),
    "dart":
        config(name: "dart",
               size_y: 17,
               size_x: 12 * 3,
               min_size_y: 17,
               min_size_x: 12,
               initial_cells: [[1, 2], [2, 1], [2, 3], [3, 3], [3, 4], [4, 1], [5, 1], [5, 5], [6, 5], [6, 8], [7, 1], [7, 2], [7, 3], [7, 4], [7, 7], [7, 9], [8, 7], [8, 10], [9, 1], [9, 2], [9, 3], [9, 4], [9, 7], [9, 9], [10, 5], [10, 8], [11, 1], [11, 5], [12, 1], [13, 3], [13, 4], [14, 1], [14, 3], [15, 2]]
    ),
    "die hard":
        config(name: "die hard", size_y: 40, size_x: 40, min_size_y: 40, min_size_x: 40, initial_cells: [[10 + 1, 9 + 7], [10 + 2, 9 + 1], [10 + 2, 9 + 2], [10 + 3, 9 + 2], [10 + 3, 9 + 6], [10 + 3, 9 + 7], [10 + 3, 9 + 8]])

]
