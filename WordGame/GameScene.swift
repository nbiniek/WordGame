//
//  GameScene.swift
//  WordGame
//
//  Created by Noah Biniek on 4/16/16.
//  Copyright (c) 2016 NoahProjects. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var myLabel: SKLabelNode!
    var countdown: Countdown!

    var field1: AnswerField!
    var field2: AnswerField!
    var field3: AnswerField!
    
    override init(size: CGSize) {
        super.init(size: size)
        
        myLabel = SKLabelNode(fontNamed:"Arial")
        myLabel.text = "Guess the word!"
        myLabel.fontSize = 30
        myLabel.position = CGPoint(x: self.size.width/2.0, y: self.size.height/2.0)
        self.addChild(myLabel)
        
        let countdown = Countdown(screenSize: self.size)
        self.addChild(countdown)
        
        field1 = AnswerField(x: self.size.width/2.0 - 125, y: self.size.height * (1.0/7.0), endField: true, answer: "GOOGLE")
        field2 = AnswerField(x: self.size.width/2.0 - 125, y: self.size.height * (3.0/14.0), endField: false, answer: "CHROME")
        field3 = AnswerField(x: self.size.width/2.0 - 125, y: self.size.height * (2.0/7.0), endField: true, answer: "FINISH")
        
        field2.addHintNum()
        countdown.countdown(3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.view!.addSubview(field1)
        self.view!.addSubview(field2)
        self.view!.addSubview(field3)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if(field2.isCorrect() && !field2.editing) {
            myLabel.text = "Correct!"
        } else if(field2.editing) {
            myLabel.text = "Guess the word!"
        }
    }
}
