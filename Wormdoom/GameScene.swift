//
//  GameScene.swift
//  Wormdoom
//
//  Created by Letícia Gonçalves on 6/9/15.
//  Copyright (c) 2015 LazyFox. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate{
    
    var velocity : CGFloat = 7
    var background : SKSpriteNode!
    var background2 : SKSpriteNode!
    var touchEnabled = true
    var timer = 0
    var ground = Ground(sceneSize: CGSizeZero)
    let ground2 =  Ground(sceneSize: CGSizeZero)
    let player = Player(playerScale: 0.4)
    let monster1 = Worm(monsterScale: 0.15)
    let monster2 = Worm(monsterScale: 0.15)


    
    override func didMoveToView(view: SKView) {
        setupBackground()
        setupPlayer()
        setupGround()
        setupMonster(monster1, parent: background)
        setupMonster(monster2, parent: background2)
        physicsWorld.gravity = CGVector(dx: 0, dy: -2)
        physicsWorld.contactDelegate = self

    }
    
    func setupMonster(monster: Worm, parent: SKSpriteNode){
        monster.position = CGPoint(x:scene!.size.width/2 + 100, y: scene!.size.height/2 - 100)
        monster.setupPhysics()
        //parent.addChild(monster)
        monster.animate()
    }
    
    func setupPlayer(){
        player.position = CGPoint(x:scene!.size.width/2, y: scene!.size.height/2-50)
        player.setupPhysics()
        addChild(player)
        player.run()
        player.runAction(SKAction.scaleBy(0.5, duration: 1))

        
    }

    func setupBackground(){
        background = SKSpriteNode(texture: SKTexture(imageNamed: "background"), size: CGSize(width: scene!.size.width, height: scene!.size.height))
        background.size = self.size
        background.anchorPoint = CGPointZero
        addChild(background)
        
        background2 = SKSpriteNode(texture: SKTexture(imageNamed: "background"), size: CGSize(width: scene!.size.width, height: scene!.size.height))
        background2.size = self.size
        background2.size.width += 40
        background2.anchorPoint = CGPointZero
        background2.position.x = scene!.size.width - 10
        addChild(background2)
        
    }
    
    func setupGround(){
        ground.size.width = view!.bounds.size.width
        ground.position = CGPoint(x: view!.bounds.size.width/2, y: ground.size.height/2)
        background.addChild(ground)
        ground2.size.width = view!.bounds.size.width
        ground2.position = CGPoint(x: view!.bounds.size.width/2, y: ground.size.height/2)
        background2.addChild(ground2)
    }
    
    override func update(currentTime: NSTimeInterval) {
        moveBackground()
    }
    
    func moveBackground(){
        moveObject(background)
        moveObject(background2)
    }
    
    func moveObject(object: SKSpriteNode){
        object.position.x = object.position.x - velocity
        if(object.position.x <= -background.size.width){
            object.position.x = background.size.width
            for kid in object.children {
                if let worm = kid as? Worm {
                 worm.position = CGPoint(x:scene!.size.width/2 + CGFloat(arc4random_uniform(200)), y: scene!.size.height/2 - 100)
                }
            }
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        let any_object = touches.first as! UITouch
        let touchLocation = any_object.locationInNode(self)
        
        if (touchEnabled){
            touchEnabled = false
            player.jump()
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        if(contact.bodyA.categoryBitMask == 2 || contact.bodyB.categoryBitMask == 2){
            player.run()
            touchEnabled = true
        }
        else if(contact.bodyA.categoryBitMask == 4 || contact.bodyB.categoryBitMask == 4){
            gameOver()
        }
    }
    
    func gameOver(){
        print("HEUEHUEHUHEUHEU")
       // scene?.view?.paused = true
    }
}
