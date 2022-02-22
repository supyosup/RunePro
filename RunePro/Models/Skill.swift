//
//  Skill.swift
//  RunePro
//
//  Created by Hunter Green on 2/8/22.
//

import Foundation
import UIKit

struct Skill {
    var name: String
    var rank: Int
    var level: Int
    var xp: Int
    let sprite: UIImage
    
    init(_ name: String, rank: Int, level: Int, xp: Int) {
        self.name = name
        self.rank = rank
        self.level = level
        self.xp = xp
        self.sprite = UIImage(named: "\(self.name)")!
    }
}
