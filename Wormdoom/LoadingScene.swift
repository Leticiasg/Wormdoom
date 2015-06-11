//
//  LoadingScene.swift
//  Wormdoom
//
//  Created by Letícia Gonçalves on 6/11/15.
//  Copyright (c) 2015 LazyFox. All rights reserved.
//

import SpriteKit

class LoadingScene: SKScene {
   
    override func didMoveToView(view: SKView) {
        Player.atlasInitialize()
        Worm.atlasInitialize()
        let game = InitialScene()
        game.size = view.frame.size
        self.view?.presentScene(game)
    }
}
