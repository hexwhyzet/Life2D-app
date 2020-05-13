//
//  GameViewController.swift
//  Life2D
//
//  Created by Ivan on 10.05.2020.
//  Copyright © 2020 Ivan. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cfg: config! = storage["glider"]
        
        let scene = GameScene(size: CGSize(width: cfg.size_x * 128, height: cfg.size_y * 128), cfg)
        
        print(scene)
        
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        scene.scaleMode = .aspectFit

        let skView = self.view as! SKView
        

        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.presentScene(scene)
    }
}
