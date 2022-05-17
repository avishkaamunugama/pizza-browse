//
//  FavouritePizzaView.swift
//  PizzaBrowse
//
//  Created by Avishka Amunugama on 5/15/22.
//

import SwiftUI

struct FavouritesListView: View {
    
    @EnvironmentObject var pizzaList: PizzaList
    @EnvironmentObject var favourites: Favourite
    
    var body: some View {
        NavigationView {
            List(filterFavourites(), id:\.name) { pizza in
                NavigationLink(destination:PizzaDetailsView(pizza: pizza)) {
                    PizzaRow(pizza: pizza)
                }
                .padding(.init(top: 0, leading: -12, bottom: 0, trailing: -12))
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .padding()
            .navigationTitle("Favourites")
            .navigationBarTitleDisplayMode(.inline)
            
            // Only visible in iPads
            WelcomeView(screenType: .favourites)
        }
    }
    
    func filterFavourites() ->[Pizza] {
        var filteredList:[Pizza] = []
        
        for pizza in pizzaList.pizzas {
            if favourites.contains(pizza) {
                filteredList.append(pizza)
            }
        }
        
        return filteredList
    }
}

struct FavouritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesListView()
            .environmentObject(PizzaList())
            .environmentObject(Favourite())
    }
}
