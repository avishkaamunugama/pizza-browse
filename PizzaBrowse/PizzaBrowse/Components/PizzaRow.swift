//
//  PizzaRow.swift
//  PizzaBrowse
//
//  Created by Avishka Amunugama on 5/15/22.
//

import SwiftUI

struct PizzaRow: View {
    
    var pizza:Pizza
    
    var body: some View {
        
        // Pizza list row component
        VStack(alignment: .leading) {
            HStack {
                Image(pizza.thumbnailName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipped()
                Text(pizza.name)
                Spacer()
                FavouriteButton(pizza: pizza)
            }
            Divider()
        }
    }
}

struct PizzaRow_Previews: PreviewProvider {
    static var previews: some View {
        PizzaRow(pizza: Pizza.example)
        
    }
}
