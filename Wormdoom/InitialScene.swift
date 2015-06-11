//
//  InitialScene.swift
//  Wormdoom
//
//  Created by Letícia Gonçalves on 6/8/15.
//  Copyright (c) 2015 LazyFox. All rights reserved.
//

import SpriteKit

class InitialScene: SKScene {
    var charSprite1 : Player!

    
    override func didMoveToView(view: SKView) {
        setupBackground()
        setupTitle()
        setupCharacters()
        setupStartTitle()
        setupGround()
    }
    
    func setupGround(){
        let ground = SKSpriteNode(imageNamed: "ground")
        ground.yScale = 0.25
        ground.size.width = view!.bounds.size.width
        ground.position = CGPoint(x: view!.bounds.size.width/2, y: ground.size.height/2)
        addChild(ground)
    }
    func setupStartTitle(){
        let title = SKLabelNode()
        title.text = "Escolha um personagem para começar"
        title.fontName = "Chalkduster"
        title.fontSize = 16
        title.fontColor = UIColor.darkGrayColor()
        title.position = CGPoint(x: size.width/2, y: size.height - 100)
        addChild(title)
    }
    
    func setupBackground(){
        let background = SKSpriteNode(texture: SKTexture(imageNamed: "background"), size: CGSize(width: scene!.size.width, height: scene!.size.height))
        background.size = self.size
        background.anchorPoint = CGPointZero
        addChild(background)
    }
    
    func setupTitle(){
        let title = SKLabelNode()
        title.text = "WormDoom"
        title.fontName = "Chalkduster"
        title.fontSize = 40
        title.fontColor = UIColor.grayColor()
        title.position = CGPoint(x: size.width/2, y: size.height - 50)
        addChild(title)
    }
   
    func setupCharacters(){
        charSprite1 = Player(playerScale: 0.4)
        charSprite1.position = CGPoint(x:scene!.size.width/2, y: scene!.size.height/2-50)
        
        addChild(charSprite1)
        charSprite1.run()
        
        //        let moveAction = SKAction.moveBy(CGVector(dx: view!.bounds.width,dy: 0), duration: 1.0)
//        let group = SKAction.group([ animateAction,moveAction])
//        let repeatAction = SKAction.repeatActionForever(group)

    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        let any_object = touches.first as! UITouch
        let touchLocation = any_object.locationInNode(self)
        let game = GameScene()
        game.size = view!.frame.size
        if (charSprite1.containsPoint(touchLocation)){
            self.view?.presentScene(game)
        }
    }

    
    override func update(currentTime: NSTimeInterval) {
        
    }
}
