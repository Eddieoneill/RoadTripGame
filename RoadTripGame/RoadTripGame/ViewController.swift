//
//  ViewController.swift
//  RoadTripGame
//
//  Created by Edward O'Neill on 11/27/19.
//  Copyright © 2019 Edward O'Neill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topic: UILabel!
    @IBOutlet weak var redScore: UILabel!
    @IBOutlet weak var blueScore: UILabel!
    @IBOutlet var winner: [UIButton]!
    @IBOutlet weak var pic: UIImageView!
    
    var score0 = 0
    var score1 = 0
    var topicList = TopicList().randomTopicList()
    let imageName = TopicList().imageSorter()
    var playerType = StartingViewController()
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in winner {
            button.layer.cornerRadius = 4
        }
        blueScore.text = "\(gameType()[1]): \(score1)"
        redScore.text = "\(gameType()[0]): \(score0)"
        newTopic()
    }
    
    func gameType() -> [String] {
        var arr = [String]()
        
        if text == "player" {
            arr = ["Player 1", "Player 2"]
        } else if text == "team" {
            arr = ["Team Red", "Team Blue"]
        } else {
            arr = ["", ""]
        }
        
        return arr
    }
    
    func newTopic() {
        let topics = topicList.popLast() ?? ""
        topic.text = topics
        
        if imageName[topics] == "car" {
            pic.image = #imageLiteral(resourceName: "carBackground")
            topic.textColor = .black
        } else if imageName[topics] == "city" {
            pic.image = #imageLiteral(resourceName: "1127620")
            topic.textColor = .black
        } else if imageName[topics] == "word" {
            pic.image = #imageLiteral(resourceName: "wordsBackground")
            topic.textColor = .black
        } else if imageName[topics] == "animal" {
            pic.image = #imageLiteral(resourceName: "animalBackGround")
            topic.textColor = .black
        } else if imageName[topics] == "sign" {
            pic.image = #imageLiteral(resourceName: "EH8Y44")
            topic.textColor = .black
        } else if imageName[topics] == "number" {
            pic.image = #imageLiteral(resourceName: "2635138")
            topic.textColor = .black
        } else if topics == "" {
            topicList = TopicList().randomTopicList()
            newTopic()
        }
        
        
    }
    
    func reset() {
        topicList = TopicList().randomTopicList()
        score1 = 0
        score0 = 0
        blueScore.text = "Team Blue \(score1)"
        redScore.text = "Team Red: \(score0)"
        pic.backgroundColor = .white
        for button in winner {
            button.isEnabled = true
        }
        newTopic()
    }
    
    func disableButton() {
        for button in winner {
            button.isEnabled = false
        }
    }
    
    @IBAction func addScore(_ sender: UIButton) {
        if sender.tag == 0 {
            score0 += 1
            redScore.text = "\(gameType()[0]): \(score0)"
        } else {
            score1 += 1
            blueScore.text = "\(gameType()[1]): \(score1)"
        }
        
        if score1 == 20 {
            topic.text = "\(gameType()[1]) Wins"
            pic.backgroundColor = .blue
            pic.image = nil
            topic.textColor = .white
            disableButton()
        } else if score0 == 20 {
            topic.text = "\(gameType()[0]) Wins"
            pic.backgroundColor = .red
            pic.image = nil
            topic.textColor = .white
            disableButton()
        } else {
            newTopic()
        }
    }
    
    @IBAction func skip(_ sender: UIButton) {
        newTopic()
    }
    
    @IBAction func reset(_ sender: UIButton) {
        reset()
    }
}

