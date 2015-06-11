//
//  InitialViewController.swift
//  Wormdoom
//
//  Created by Letícia Gonçalves on 6/8/15.
//  Copyright (c) 2015 LazyFox. All rights reserved.
//

import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialView = LoadingScene()
        initialView.size = self.view.bounds.size
        initialView.scaleMode = .AspectFill
        
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = false
        skView.showsPhysics = true
        skView.presentScene(initialView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    



}
