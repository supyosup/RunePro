//
//  ContentView.swift
//  RunePro
//
//  Created by Hunter Green on 2/4/22.
//

import SwiftUI

struct ContentView: View {
    @State private var lookupHome = UUID()
    @State private var tabSelection = 0
    @State private var tappedTwice = false
    
    var handler: Binding<Int> { Binding(
        get: { self.tabSelection },
        set: {
            if $0 == self.tabSelection {
                tappedTwice = true
            }
            self.tabSelection = $0
        }
    )}
    
    var body: some View {
        TabView(selection: handler) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }.tag(0)
            
            LookupView()
                .id(lookupHome)
                .onChange(of: tappedTwice, perform: { tappedTwice in
                    guard tappedTwice else { return }
                    lookupHome = UUID()
                    self.tappedTwice = false
                })
                .navigationViewStyle(StackNavigationViewStyle())
                .tabItem {
                    Label("Lookup", systemImage: "magnifyingglass")
                }.tag(1)
            
            QuestView()
                .navigationViewStyle(StackNavigationViewStyle())

                .tabItem {
                    Label("Quests", systemImage: "checkmark")
                }.tag(2)
        }
        .accentColor(.yellow)
    }
}

extension UITabBarController {
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let standardAppearance = UITabBarAppearance()

        standardAppearance.backgroundColor = .red
        standardAppearance.shadowColor = .green
        standardAppearance.backgroundImage = UIImage(named: "texture")

        tabBar.standardAppearance = standardAppearance
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
