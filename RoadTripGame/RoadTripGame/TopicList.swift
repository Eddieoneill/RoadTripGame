//
//  TopicList.swift
//  RoadTripGame
//
//  Created by Edward O'Neill on 11/27/19.
//  Copyright © 2019 Edward O'Neill. All rights reserved.
//

import UIKit

class TopicList {
    var topic: Set<String> = []
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    let carList = ["Find yellow car", "Find Tesla", "Find Bus"]
    let name = ["Find City name"]
    let sign = ["Find speed sign", "Find direction sign", "Find exit sign"]
    let animals = ["Find any animal"]
    
    func randomTopicList() -> [String] {
        var randomArr = [String]()
        
        for char in alphabet.uppercased() {
            self.topic.insert("Word that starts with \(char)")
        }
        
        for num in 0...9 {
            topic.insert("Find number: \(num)")
        }
        
        for word in carList{
            topic.insert(word)
        }
        
        for word in name {
            topic.insert(word)
        }
        
        for word in sign {
            topic.insert(word)
        }
        
        for word in animals {
            topic.insert(word)
        }
        
        for word in topic {
            randomArr.append(word)
        }
        
        return randomArr
    }
    
    func imageSorter() -> [String: String] {
        var imageDict = [String: String]()

        for char in alphabet.uppercased() {
            imageDict["Word that starts with \(char)"] = "word"
        }
        
        for num in 0...9 {
            imageDict["Find number: \(num)"] = "number"
        }
        
        for word in carList {
            imageDict[word] = "car"
        }
        
        for city in name {
            imageDict[city] = "city"
        }
        
        for sign in sign {
            imageDict[sign] = "sign"
        }
        
        for animal in animals {
            imageDict[animal] = "animal"
        }
        
        return imageDict
    }
}
