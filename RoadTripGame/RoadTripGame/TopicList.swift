//
//  TopicList.swift
//  RoadTripGame
//
//  Created by Edward O'Neill on 11/27/19.
//  Copyright © 2019 Edward O'Neill. All rights reserved.
//

import Foundation

class TopicList {
    var topic = [""]
    
    func randomTopicList() -> [String] {
        for num in 1...40 {
            self.topic.append("\(num)")
        }
        
        return Array(Set(topic))
    }
}
