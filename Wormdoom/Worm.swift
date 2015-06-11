//
//  Worm.swift
//  Wormdoom
//
//  Created by Letícia Gonçalves on 6/11/15.
//  Copyright (c) 2015 LazyFox. All rights reserved.
//

import SpriteKit

class Worm: SKSpriteNode {
    let monsterAtlas = SKTextureAtlas(named:"Monster")
    var monsterSpriteArray = Array<SKTexture>()
    var firstFrame : SKTexture!

    init(monsterScale: CGFloat){
        var numImages = monsterAtlas.textureNames.count
        for var i=1; i<=numImages; i++ {
            let charTextureName = "frame-\(i)"
            monsterSpriteArray.append(monsterAtlas.textureNamed(charTextureName))
        }
        
        
        firstFrame = monsterSpriteArray[0]
        super.init(texture: firstFrame, color: UIColor.clearColor(), size: CGSize(width: firstFrame.size().width * monsterScale, height: firstFrame.size().height * monsterScale))
        self.zPosition = 2
    }
    
    func animate(){
        let animation = SKAction.animateWithTextures(monsterSpriteArray, timePerFrame: 0.125)
        
        let repeatAction = SKAction.repeatActionForever(animation)
        self.runAction(repeatAction)
    }

    func setupPhysics(){
        self.physicsBody = SKPhysicsBody(texture: self.texture, size: self.size)
        self.physicsBody?.allowsRotation = false
        physicsBody!.categoryBitMask = 4
        physicsBody!.contactTestBitMask = 1
        physicsBody?.affectedByGravity = false
        physicsBody?.dynamic = false
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
