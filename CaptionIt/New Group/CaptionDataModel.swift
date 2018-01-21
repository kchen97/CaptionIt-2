//
//  CaptionDataModel.swift
//  CaptionIt
//
//  Created by Korman Chen on 1/20/18.
//  Copyright © 2018 Korman Chen. All rights reserved.
//

import Foundation

import Foundation
import SwiftyJSON

class CaptionDataModel {
    var caption = ""
    var tags = [String]()
    var emoji : [String] = ["💩","😘","😤","💀","🕺🏿","💃🏼","🙊","🔥","❤️","💸","🍺","💂🏼‍♀️","👍🏼","🤘🏼","👀","😱","😫","👻","😎","😈","😡","📲"]

    
    func configure(_ json: JSON) {
        if let items = json["description"]["tags"].array {
            for index in 0..<items.count {
                tags.append(items[index].stringValue)
            }
        }
        
        caption = json["description"]["captions"][0]["text"].stringValue
        caption.capitalizeFirstLetter()
    }
    
    func getCaption() -> String? {
        if tags.isEmpty {
            return nil
        }
        let randomNumber = Int(arc4random_uniform(UInt32(tags.count)))
        let coolHashTag = " #\(tags[randomNumber])"
        
        let randomNumberEmoji = Int(arc4random_uniform(UInt32(emoji.count)))
        let coolEmoji = " \(emoji[randomNumberEmoji])"
        
        return caption + coolHashTag + coolEmoji
    }
    
    func reset() {
        caption = ""
        tags.removeAll()
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
