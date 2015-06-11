//
//  Ground.swift
//  Wormdoom
//
//  Created by Letícia Gonçalves on 6/9/15.
//  Copyright (c) 2015 LazyFox. All rights reserved.
//

import SpriteKit

class Ground: SKSpriteNode {
    init(sceneSize: CGSize){
        super.init(texture: SKTexture(imageNamed: "ground"), color: UIColor.clearColor(), size: SKTexture(imageNamed: "ground").size())
        yScale = 0.25
        size.width = sceneSize.width
        setupPhysics()

        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPhysics(){
        let ground = SKSpriteNode(imageNamed: "ground")
        ground.yScale = 0.25
        self.physicsBody = SKPhysicsBody(texture: ground.texture, size: ground.size)
        self.physicsBody?.dynamic = false
        self.physicsBody!.categoryBitMask = 2
        self.physicsBody!.contactTestBitMask = 1

    }

}
