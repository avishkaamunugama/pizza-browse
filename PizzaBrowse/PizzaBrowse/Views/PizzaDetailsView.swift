//
//  PizzaDetailsView.swift
//  PizzaBrowse
//
//  Created by Avishka Amunugama on 5/15/22.
//

import SwiftUI

struct PizzaDetailsView: View {
    
    var pizza: Pizza
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                Image(pizza.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(pizza.name)
                            .font(.title)
                        Spacer()
                        FavouriteButton(pizza: pizza)
                            .font(.title)
                    }
                    
                    Text(listIngredients(pizza.ingredients))
                }
                .padding()
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PizzaDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaDetailsView(pizza: Pizza.example)
            .environmentObject(PizzaList())
    }
}
