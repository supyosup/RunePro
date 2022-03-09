//
//  ContentView.swift
//  RunePro
//
//  Created by Hunter Green on 2/4/22.
//

import SwiftUI

struct ContentView: View {
    @State private var lookupHome = UUID()
    @State private var tabSelection = 1
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
                }
            
            LookupView()
                .id(lookupHome)
                .onChange(of: tappedTwice, perform: { tappedTwice in
                    guard tappedTwice else { return }
                    lookupHome = UUID()
                    self.tappedTwice = false
                })
                .tabItem {
                    Label("Lookup", systemImage: "magnifyingglass")
                }.tag(1)
            
            SearchField()
                .tabItem {
                    Label("Quests", systemImage: "checkmark")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
