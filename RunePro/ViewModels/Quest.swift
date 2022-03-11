//
//  QuestDataModel.swift
//  RunePro
//
//  Created by Hunter Green on 3/11/22.
//

import Foundation

struct Quest {
    struct QuestSection: Codable, Identifiable {
        var id: String
        var name: String
        var quests: [QuestItems]
        
        struct QuestItems: Codable, Identifiable {
            var id: String
            var name: String
        }
    }
    
    func getJsonData() -> QuestSection {
        guard let sourcesURL = Bundle.main.url(forResource: "QuestData", withExtension: "json")
        else {
            fatalError("Could not find QuestData.json")
            
        }
        
        guard let questData = try? Data(contentsOf: sourcesURL)
        else {
            fatalError("Could not convert data")
        }
        
        let decoder = JSONDecoder()
        
        guard let questTypes = try? decoder.decode(QuestSection.self, from: questData)
        else {
            fatalError("There was a problem decoding data")
        }
        print(questTypes.name)
        for quest in questTypes.quests {
            print(quest.name)
        }
        
        return questTypes
    }
}

