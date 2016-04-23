//
//  Countdown.swift
//  WordGame
//
//  Created by Noah Biniek on 4/21/16.
//  Copyright © 2016 NoahProjects. All rights reserved.
//

import SpriteKit

class Countdown: SKNode {
    
    var background: SKSpriteNode!
    let countdownLabel = SKLabelNode(text: "Begin in: ")
    var label: String = ""
    var count: Int = 0
    var finished: Bool = true
    
    init(screenSize: CGSize) {
        super.init()
        
        background = SKSpriteNode(color: UIColor.blackColor(), size: screenSize)
        background.anchorPoint = CGPointZero
        background.zPosition = 1
        
        countdownLabel.fontName = "Arial"
        countdownLabel.fontSize = 48.0
        countdownLabel.position = CGPoint(x: screenSize.width * 0.5, y: screenSize.height * 0.6)
        countdownLabel.horizontalAlignmentMode = .Center
        countdownLabel.verticalAlignmentMode = .Center
        countdownLabel.zPosition = 2
    
        self.zPosition = 11
    }
    func countdown(count: Int, label: String?="Begin in: ") {
        self.finished = false
        self.count = count
        self.label = label!
        countdownLabel.text = self.label + "\(count)..."
        
        self.addChild(background)
        self.addChild(countdownLabel)
        
        let counterDecrement = SKAction.sequence([SKAction.waitForDuration(0.9),
            SKAction.runBlock(countdownAction)])
        
        runAction(SKAction.sequence([SKAction.repeatAction(counterDecrement, count: count),
            SKAction.runBlock(endCountdown)]))
    }
    
    func countdownAction() {
        count-=1
        countdownLabel.text = label + "\(count)..."
    }
    
    func endCountdown() {
        self.finished = true
        background.removeFromParent()
        countdownLabel.removeFromParent()
    }
    
    func isFinished() -> Bool {
        return finished
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}