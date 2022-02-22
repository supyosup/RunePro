//
//  ContentView.swift
//  RunePro
//
//  Created by Hunter Green on 2/4/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var player = PlayerViewModel()
    @State var username = ""
    @State var switchView = false
    @State var dataLoaded = false
    
    var body: some View {
        return Group {
            if (switchView) {
                if (!dataLoaded) {
                    ProgressView("Loading HiScores")
                        .preferredColorScheme(.dark)
                } else {
                    StatTileView(player: player)
                }
            } else {
                VStack {
                ZStack {
                    VStack(alignment: .leading) {
                        Text("HiScore Lookup")
                            .font(.system(size: 48))
                            .foregroundColor(.yellow)
                        HStack {
                            Image(systemName: "magnifyingglass")
                            VStack {
                                TextField("Username", text: $username)
                                    .font(.system(size: 22))
                                    Divider()
                                    .frame(height: 1)
//                                    .padding(.horizontal, 5)
                                    .background(.yellow)
                            }
                        }
                        
                    }
                    .padding()
                }
                    
            }
            }
        }.preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

