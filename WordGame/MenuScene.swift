//
//  MenuScene.swift
//  WordGame
//
//  Created by Noah Biniek on 4/20/16.
//  Copyright © 2016 NoahProjects. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    override init(size: CGSize) {
        super.init(size: size)

        let playButton = SKLabelNode(fontNamed: "Arial")
        playButton.name = "Play"
        playButton.text = "Play"
        playButton.position = CGPoint(x: size.width / 2.0, y: size.height / 2.0)
        self.addChild(playButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let location = touches.first?.locationInNode(self) {
            let touchedNode = nodeAtPoint(location)
            
            if touchedNode.name == "Play" {
                let transition = SKTransition.revealWithDirection(.Down, duration: 0.5)
                
                let nextScene = GameScene(size: scene!.size)
                nextScene.scaleMode = .AspectFill
                
                scene?.view?.presentScene(nextScene, transition: transition)
            }
        }
    }
}
