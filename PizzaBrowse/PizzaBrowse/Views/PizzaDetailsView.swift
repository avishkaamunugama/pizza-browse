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
                
                // Pizza image
                Image(pizza.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                
                // Pizza name and favourite star
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(pizza.name)
                            .font(.title)
                        Spacer()
                        FavouriteButton(pizza: pizza)
                            .font(.title)
                    }
                    
                    // List of all ingredients
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
