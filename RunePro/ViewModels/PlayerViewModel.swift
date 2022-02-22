//
//  RunePro.swift
//  RunePro
//
//  Created by Hunter Green on 2/5/22.
//

import Foundation
import SwiftUI

@MainActor class PlayerViewModel: ObservableObject {
    @Published private var player: Player
    
    init() {
        player = Player("")
    }
    
    var name: String {
        player.playerName
    }
    
    var printData: String {
        return "Player data: \(player.playerData)"
    }
        
    var skills: [Skill] {
        player.playerSkills
    }
    
    var stats: String {
        player.playerData
    }
    
    func updateName(_ name: String) {
//        Debug
//        print("Updating name to \(name)")
        player.playerName = name.capitalized
    }
    
    func updateStats(_ stats: String) {
        player.playerData = stats
    }

    func parsePlayerStats() {
        // rank,level,xp
        if (self.name == "_notFound") {
            return
        }
        let lines = self.stats.components(separatedBy: "\n")
        for i in 0..<24 {
            let components = lines[i].components(separatedBy: ",")
            var rank = ""
            var level = ""
            var xp = ""
            for j in 0...2 {
                print("DEBUG-> Component: \(components[j])")
                switch (j) {
                case 0:
                    rank = components[j]
                    break;
                case 1:
                    level = components[j]
                    break;
                case 2:
                    xp = components[j]
                    break;
                default:
                    break;
                }
            }
            setSkill(index: i, rank: Int(rank)!, level: Int(level)!, xp: Int(xp)!)
        }
    }
    
    func setSkill(index: Int, rank: Int, level: Int, xp: Int) {
        if (rank == -1) {
            player.playerSkills[index].rank = 0
        } else {
            player.playerSkills[index].rank = rank
        }
        
        if (level == -1) {
            player.playerSkills[index].level = 0
        } else {
            player.playerSkills[index].level = level
        }
        
        if (xp == -1) {
            player.playerSkills[index].xp = 0
        } else {
            player.playerSkills[index].xp = xp

        }
    }
    
    func getPlayerStats() async -> String {
        var url = "https://secure.runescape.com/m=hiscore_oldschool/index_lite.ws?player="
        let playerQueryName = player.playerName.replacingOccurrences(of: " ", with: "+")
        url = url + playerQueryName
        
        guard let queryUrl = URL(string: url)
        else {
            return "Error with URL"
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: queryUrl)
            let returnedData = String(decoding: data, as: UTF8.self)
            if (returnedData.contains("Page not found")) {
                player.playerName = "_notFound"
                return "User not found"
            }
            return (String (decoding: data, as: UTF8.self))
        } catch {
            return "Error fetching HiScores"
        }
    }
}
