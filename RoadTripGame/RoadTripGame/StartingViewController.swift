//
//  StartingViewController.swift
//  RoadTripGame
//
//  Created by Edward O'Neill on 11/28/19.
//  Copyright © 2019 Edward O'Neill. All rights reserved.
//

import UIKit

class StartingViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var checkMark1: UIImageView!
    @IBOutlet weak var checkMark2: UIImageView!    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.layer.cornerRadius = 4
        button2.layer.cornerRadius = 4
        startButton.isEnabled = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ViewController
        {
            let vc = segue.destination as? ViewController
            vc?.text = "\(self.text)"
        }
    }
    
    @IBAction func gameType(_ sender: UIButton) {
        if sender.tag == 0 {
            if checkMark1.image != nil {
                checkMark1.image = nil
                startButton.isEnabled = false
            } else {
                checkMark1.image = #imageLiteral(resourceName: "check-mark-png")
                checkMark2.image = nil
                text = "player"
                startButton.isEnabled = true
            }
        } else {
            if checkMark2.image != nil {
                checkMark2.image = nil
                startButton.isEnabled = false
            } else {
                checkMark2.image = #imageLiteral(resourceName: "check-mark-png")
                text = "team"
                checkMark1.image = nil
                startButton.isEnabled = true
            }
        }
    }
}
