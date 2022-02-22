//
//  StatTileView.swift
//  RunePro
//
//  Created by Hunter Green on 2/8/22.
//

import SwiftUI

//TODO
// Add navigation bar
// Add 'Back' button to navbar
// Replace Skill names with Icons

struct StatTileView: View {
    @ObservedObject var player: PlayerViewModel

    @State var buttonPressed = false
    
    var body: some View {
        if (buttonPressed) {
            ContentView()
        } else {
            VStack {
               

                ScrollView() {
//                    Button("Back") {
//                        buttonPressed = true
//                    }
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                        ForEach(player.skills.indices) { i in
                            SkillTileView(
                                skill: player.skills[i].name,
                                level: Int(player.skills[i].level),
                                xp: Int(player.skills[i].xp),
                                rank: Int(player.skills[i].rank),
                                sprite: player.skills[i].sprite
                            )
                            .aspectRatio(2/2.25, contentMode: .fit)
                        }
                    }
                    .padding()
                }
                .navigationTitle(player.name)
                .preferredColorScheme(.dark)
            }
        }
    }
}

struct SkillTileView: View {
    var skill: String
    var level: Int
    var xp: Int
    var rank: Int
    let sprite: UIImage
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            shape.fill().foregroundColor(Color(white: 0.3745))
            shape.strokeBorder(lineWidth: 3)
            VStack {
                Image(uiImage: sprite)
                VStack {
                    Text("\(skill)")
                    Text("\(level)")
                    Text("\(xp)")
                    Text("Rank: \(rank)")
                }
                    .font(.custom("small", size: 0.45))
            }
        }
            .foregroundColor(.yellow)
            .preferredColorScheme(.dark)
    }
}

struct StatTileView_Previews: PreviewProvider {
    static var player = PlayerViewModel()
    static var previews: some View {
        StatTileView(player: player)
    }
}
