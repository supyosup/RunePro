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
    @State var showFreeQuests = true
    
    var body: some View {
        NavigationView {
            List {
                ForEach (questsData) { type in
                    Section(header: Text(type.name)) {
                        ForEach (type.quests) { quest in
                            Link(destination: URL(string: quest.URL)!, label: {
                                Label(quest.name, systemImage: "link")
                            })
                        }
                    }
                }
            }
            .navigationTitle("Quest List")
            .navigationBarTitleDisplayMode(.inline)
        }
        .preferredColorScheme(.dark)
    }
}

struct QuestView_Previews: PreviewProvider {
    static var previews: some View {
        QuestView()
    }
}
