//
//  ContentView.swift
//  PizzaBrowse
//
//  Created by Avishka Amunugama on 5/15/22.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            PizzaListView()
                .tabItem{Label("Pizza", systemImage: "list.bullet")}
            FavouritesListView()
                .tabItem{Label("Favourites", systemImage: "star.fill")}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PizzaList())
    }
}
