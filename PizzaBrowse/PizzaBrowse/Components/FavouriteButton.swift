//
//  FavouriteButton.swift
//  PizzaBrowse
//
//  Created by Avishka Amunugama on 5/17/22.
//

import SwiftUI

struct FavouriteButton: View {
    
    @EnvironmentObject var favourites: Favourite
    var pizza: Pizza
    
    var body: some View {
        Button {
            if favourites.contains(pizza) {
                favourites.remove(pizza)
            } else {
                favourites.add(pizza)
            }
        }label: {
            Image(systemName: favourites.contains(pizza) ? "star.fill" : "star")
                .foregroundColor(favourites.contains(pizza) ? .yellow : .gray)
        }
    }
}

struct FavouriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteButton(pizza: Pizza.example)
            .environmentObject(Favourite())
    }
}
