//
//  GameScene.swift
//  WordGame
//
//  Created by Noah Biniek on 4/16/16.
//  Copyright (c) 2016 NoahProjects. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var titleLabel: SKLabelNode!
    var menuLabel: SKLabelNode!
    var countdown: Countdown!

    var field1: AnswerField!
    var field2: AnswerField!
    var field3: AnswerField!
    
    override init(size: CGSize) {
        super.init(size: size)
        
        titleLabel = SKLabelNode(fontNamed:"Arial")
        titleLabel.text = "Guess the word!"
        titleLabel.fontSize = 30
        titleLabel.position = CGPoint(x: self.size.width/2.0, y: self.size.height/2.0)
        self.addChild(titleLabel)
        
        menuLabel = SKLabelNode(fontNamed: "Arial")
        menuLabel.name = "Menu"
        menuLabel.text = "Menu"
        menuLabel.fontSize = 24
        menuLabel.position = CGPoint(x: self.size.width * 0.75, y: self.size.height * 0.9)
        self.addChild(menuLabel)
        
        field1 = AnswerField(x: self.size.width/2.0 - 125, y: self.size.height * (1.0/7.0), topOrBottomField: true, answer: "GOOGLE")
        field2 = AnswerField(x: self.size.width/2.0 - 125, y: self.size.height * (3.0/14.0), topOrBottomField: false, answer: "CHROME")
        field3 = AnswerField(x: self.size.width/2.0 - 125, y: self.size.height * (2.0/7.0), topOrBottomField: true, answer: "FINISH")
        
        loadScreen(3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        view.addSubview(field1)
        view.addSubview(field2)
        view.addSubview(field3)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        if let location = touches.first?.locationInNode(self) {
            let touchedNode = nodeAtPoint(location)
            
            if touchedNode.name == "Menu" {
                openMenu()
            }
        }
    }
    
    override func willMoveFromView(view: SKView) {
        field1.removeFromSuperview()
        field2.removeFromSuperview()
        field3.removeFromSuperview()
    }
    
    func openMenu() {        
        let nextScene = MenuScene(size: scene!.size)
        nextScene.scaleMode = .AspectFill
        
        scene?.view?.presentScene(nextScene)
    }
    
    func loadScreen(seconds: Int) {
        countdown = Countdown(screenSize: self.size)
        self.addChild(countdown)
        field1.hidden = true
        field2.hidden = true
        field3.hidden = true
        countdown.countdown(seconds)
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if(countdown.isFinished()) {
            field1.hidden = false
            field2.hidden = false
            field3.hidden = false
        }
        if(field2.isCorrect() && !field2.editing) {
            titleLabel.text = "Correct!"
        } else if(field2.editing) {
            titleLabel.text = "Guess the word!"
        }
    }
}
