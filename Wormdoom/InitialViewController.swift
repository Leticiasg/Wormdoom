//
//  InitialViewController.swift
//  Wormdoom
//
//  Created by Letícia Gonçalves on 6/8/15.
//  Copyright (c) 2015 LazyFox. All rights reserved.
//

import SpriteKit

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialView = InitialScene()
        initialView.size = self.view.bounds.size
        initialView.scaleMode = .AspectFill
        
        let skView = self.view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.showsPhysics = false
        skView.presentScene(initialView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
