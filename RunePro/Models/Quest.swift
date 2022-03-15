//
//  QuestDataModel.swift
//  RunePro
//
//  Created by Hunter Green on 3/11/22.
//

import Foundation

struct Quest {
    struct QuestSection: Codable, Identifiable {
        var id: UUID
        var name: String
        var quests: [QuestItems]
        
        struct QuestItems: Codable, Identifiable {
            var id: UUID
            var name: String
            var URL: String
        }
    }
    
    func getJsonData() -> [QuestSection] {
        guard let sourcesURL = Bundle.main.url(forResource: "QuestData", withExtension: "json")
        else {
            fatalError("Could not find QuestData.json")
        }
        
        guard let questData = try? Data(contentsOf: sourcesURL)
        else {
            fatalError("Could not convert data")
        }
        
        let decoder = JSONDecoder()
        
        guard let questTypes = try? decoder.decode([QuestSection].self, from: questData)
        else {
            fatalError("There was a problem decoding data")
        }
        
        return questTypes
    }
}

