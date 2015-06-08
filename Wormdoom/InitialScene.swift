//
//  InitialScene.swift
//  Wormdoom
//
//  Created by Letícia Gonçalves on 6/8/15.
//  Copyright (c) 2015 LazyFox. All rights reserved.
//

import SpriteKit

class InitialScene: SKScene {
    var charSprite1 = SKSpriteNode()

    
    override func didMoveToView(view: SKView) {
        setupBackground()
        setupTitle()
        setupCharacters()
        setupStartTitle()
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
        //TODO create frames
        let charAtlas1 = SKTextureAtlas(named:"Run")
        var spriteArray1 = Array<SKTexture>()
        
        spriteArray1.append(charAtlas1.textureNamed("frame-1"))
        spriteArray1.append(charAtlas1.textureNamed("frame-2"))
        spriteArray1.append(charAtlas1.textureNamed("frame-3"))
        spriteArray1.append(charAtlas1.textureNamed("frame-4"))
        spriteArray1.append(charAtlas1.textureNamed("frame-5"))
        
        charSprite1 = SKSpriteNode(texture:spriteArray1[0])
        charSprite1.position = CGPoint(x:scene!.size.width/2, y: scene!.size.height/2-50)
        charSprite1.xScale = 0.4
        charSprite1.yScale = 0.4
        
        addChild(charSprite1)
        
        let animateAction = SKAction.animateWithTextures(spriteArray1, timePerFrame: 0.20)
//        let moveAction = SKAction.moveBy(CGVector(dx: view!.bounds.width,dy: 0), duration: 1.0)
//        let group = SKAction.group([ animateAction,moveAction])
//        let repeatAction = SKAction.repeatActionForever(group)

        let repeatAction = SKAction.repeatActionForever(animateAction)
        charSprite1.runAction(repeatAction)
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        
//        if(charSprite1.position.x > scene!.size.width){
//            charSprite1.position.x = 0;
//        }
    }
}
