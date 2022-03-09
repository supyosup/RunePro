//
//  LookupView.swift
//  RunePro
//
//  Created by Hunter Green on 3/5/22.
//

import SwiftUI

struct LookupView: View {
    @StateObject var player = PlayerViewModel()
    @State var username = ""
    @State var dataLoaded: Bool? = false
    @State var isLoading = false
    @State var playerNotFound = false
    
    var body: some View {
        NavigationView {
            if (isLoading) {
                ProgressView("Loading HiScores...")
            } else {
                VStack {
                    ZStack {
                        VStack(alignment: .leading) {
                            Text("HiScore Lookup")
                                .font(.system(size: 48))
                                .foregroundColor(.yellow)
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color.yellow)
                                VStack {
                                    TextField("Username", text: $username)
                                        .font(.system(size: 20))
                                    Divider()
                                        .frame(height: 1)
                                        .background(.yellow)
                                }
                            }
                        }
                        .padding()
                    }
                    
                    NavigationLink(destination: StatTileView(player: player)
                                    .transition(.move(edge: .leading).animation(.default))
                                   , tag: true, selection: $dataLoaded, label: {
                        Text("Get Stats")
                            .bold()
                            .frame(width: 280, height:  50)
                            .background(Color.yellow)
                            .foregroundColor(Color.black)
                            .cornerRadius(5)
                            .disabled(username.isEmpty)
                            .onTapGesture {
                                self.fetchPlayerData()
                            }
                    })
                        .alert(isPresented: $playerNotFound) {
                            UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).backgroundColor = .darkGray
                            UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = .red
                            return Alert(title: Text("Player not found"), message: Text("Player was not found on the HiScores."), dismissButton: .default(Text("OK")))
                        }
                        .navigationBarTitle("Lookup")
                        .navigationBarHidden(true)
                }
                
            }
        }
        .preferredColorScheme(.dark)
    }
    
    func fetchPlayerData() {
        player.updateName(username)
        Task.init {
            isLoading = true
            let playerData = await player.getPlayerStats()
            player.updateStats(playerData)
            playerNotFound = player.parsePlayerStats()
            dataLoaded = true
            isLoading = false
        }
    }
}

struct LookupView_Previews: PreviewProvider {
    static var previews: some View {
        LookupView()
    }
}
