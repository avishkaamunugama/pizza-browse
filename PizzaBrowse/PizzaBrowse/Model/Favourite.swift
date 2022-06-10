//
//  Favourite.swift
//  PizzaBrowse
//
//  Created by Avishka Amunugama on 5/17/22.
//

import Foundation

class Favourite: ObservableObject {
    
    @Published private var favouritePizzas: Set<String>
    private var saveKey = "Favorites"
    
    init() {
        
        // Loades previous saved favorites pizzas
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
                favouritePizzas = decoded
                return
            }
        }
        
        favouritePizzas = []
    }
    
    // Checks if a pizza is a favourite pizza
    func contains(_ pizza:Pizza) -> Bool {
        return favouritePizzas.contains(pizza.name)
    }
    
    // Add pizza to favourite list
    func add(_ pizza:Pizza) {
        favouritePizzas.insert(pizza.name)
        save()
    }
    
    // Removes pizza from favoruti list
    func remove(_ pizza:Pizza) {
        favouritePizzas.remove(pizza.name)
        save()
    }
    
    // Saves the list of favourite pizzas
    func save() {
        if let encoded = try? JSONEncoder().encode(favouritePizzas) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
}
