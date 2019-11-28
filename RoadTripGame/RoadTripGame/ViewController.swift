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
    
    var score0 = 0
    var score1 = 0
    var topicList = TopicList().randomTopicList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in winner {
            button.layer.cornerRadius = 4
        }
        newTopic()
    }
    
    func newTopic() {
        let topics = topicList.popLast()
        topic.text = topics
    }
    
    func reset() {
        topicList = TopicList().randomTopicList()
        score1 = 0
        score0 = 0
        blueScore.text = "Team Blue \(score1)"
        redScore.text = "Team Red: \(score0)"
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
            redScore.text = "Team Red: \(score0)"
        } else {
            score1 += 1
            blueScore.text = "Team Blue \(score1)"
        }
        
        if score1 == 20 {
            topic.text = "Blue Wins"
            disableButton()
        } else if score0 == 20 {
            topic.text = "Red Wins"
            disableButton()
        } else {
            newTopic()
        }
    }
    
    @IBAction func reset(_ sender: UIButton) {
        reset()
    }
}

