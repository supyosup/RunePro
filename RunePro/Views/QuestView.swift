//
//  QuestView.swift
//  RunePro
//
//  Created by Hunter Green on 3/9/22.
//

import SwiftUI
import SafariServices

struct QuestView: View {
    let questsData = Quest().getJsonData()
    
    var body: some View {
        NavigationView {
            List {
                ForEach (questsData) { type in
                    Section(header: Text(type.name)) {
                        ForEach (type.quests) { quest in
                            Text(quest.name)
                        }
                    }
                }
                
            }
            .navigationTitle("Quest List")
        }
        .preferredColorScheme(.dark)
    }
}

struct QuestView_Previews: PreviewProvider {
    static var previews: some View {
        QuestView()
    }
}
