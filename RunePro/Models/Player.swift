//
//  Player.swift
//  RunePro
//
//  Created by Hunter Green on 2/5/22.
//

import Foundation
import UIKit

struct Player {
    let skillNames = ["Overall","Attack", "Defence", "Strength", "Hitpoints", "Ranged", "Prayer", "Magic", "Cooking", "Woodcutting", "Fletching", "Fishing", "Firemaking", "Crafting", "Smithing", "Mining", "Herblore", "Agility", "Thieving", "Slayer", "Farming", "Runecraft", "Hunter", "Construction"]
    
    var skillSprites: [UIImage] = []
    
    var playerName: String
    var playerData: String
    var playerSkills: [Skill] = []
    
    init(_ playerName: String) {
        self.playerName = playerName
        self.playerData = ""
        playerSkills = initializeSkills()
    }
    
    func initializeSkills() -> [Skill] {
        var skillArray: [Skill] = []
        for name in skillNames {
            let skill = Skill("\(name)", rank: 1, level: 99, xp: 4600000000)
            skillArray.append(skill)
        }
        return skillArray
    }
}
