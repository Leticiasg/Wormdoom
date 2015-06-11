//
//  Player.swift
//  Wormdoom
//
//  Created by Letícia Gonçalves on 6/9/15.
//  Copyright (c) 2015 LazyFox. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode {
    static var runAtlas : SKTextureAtlas!
    static var jumpAtlas : SKTextureAtlas!
    static var runSpriteArray = Array<SKTexture>()
    static var jumpSpriteArray = Array<SKTexture>()
    var firstRunFrame : SKTexture!
    
    static func atlasInitialize(){
        Player.runAtlas = SKTextureAtlas(named: "Run")
        Player.jumpAtlas = SKTextureAtlas(named: "Jump")
        var numImages = runAtlas.textureNames.count
        for var i=1; i<=numImages; i++ {
            let charTextureName = "frame-\(i)"
            runSpriteArray.append(runAtlas.textureNamed(charTextureName))
        }
        
        numImages = jumpAtlas.textureNames.count
        for var i=1; i<=numImages; i++ {
            let charTextureName = "frame-\(i)"
            jumpSpriteArray.append(jumpAtlas.textureNamed(charTextureName))
        }

    }
    
    init(playerScale: CGFloat){
        firstRunFrame = Player.runSpriteArray[0]
        super.init(texture: firstRunFrame, color: UIColor.clearColor(), size: CGSize(width: firstRunFrame.size().width * playerScale, height: firstRunFrame.size().height * playerScale))
        self.zPosition = 3
    }
    
    func setupPhysics(){
        self.physicsBody = SKPhysicsBody(texture: self.texture, size: self.size)
        self.physicsBody?.allowsRotation = false
        physicsBody!.categoryBitMask = 1
        physicsBody!.contactTestBitMask = 2

    }
    
    func run(){
        let runAction = SKAction.animateWithTextures(Player.runSpriteArray, timePerFrame: 0.20)
        let repeatAction = SKAction.repeatActionForever(runAction)
        self.runAction(repeatAction)
    }
    
    func jump(){
        let jumpAction = SKAction.animateWithTextures(Player.jumpSpriteArray, timePerFrame: 0.50)
        let repeatAction = SKAction.repeatActionForever(jumpAction)
        self.runAction(repeatAction)
        self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 130))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
