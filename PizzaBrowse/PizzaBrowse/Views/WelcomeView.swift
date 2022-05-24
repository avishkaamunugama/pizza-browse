//
//  WelcomeView.swift
//  PizzaBrowse
//
//  Created by Avishka Amunugama on 5/17/22.
//

import SwiftUI

enum ScreenType {
    case pizzas, favourites
}

// Only shown in tablet app

struct WelcomeView: View {
    
    var screenType: ScreenType
    
    var body: some View {
        VStack {
            Text("Welcome to PizzaBrowse!")
                .font(.largeTitle)
            Text("Click on the \((screenType == .pizzas) ? "Pizza" : "Favourites") button on top left corner to view the \((screenType == .pizzas) ? "pizza" : "favourites") menu if not already visible.")
                .foregroundColor(.secondary)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(screenType: .pizzas)
    }
}
