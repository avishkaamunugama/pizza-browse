//
//  PizzaBrowseApp.swift
//  PizzaBrowse
//
//  Created by Avishka Amunugama on 5/15/22.
//

import SwiftUI

@main
struct PizzaBrowseApp: App {
    
    @StateObject var pizzaList = PizzaList()
    @StateObject var favourites = Favourite()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(PizzaList())
                .environmentObject(Favourite())
        }
    }
}
