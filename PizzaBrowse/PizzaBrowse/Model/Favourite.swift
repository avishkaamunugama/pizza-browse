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
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
                favouritePizzas = decoded
                return
            }
        }
        
        favouritePizzas = []
    }
    
    func contains(_ pizza:Pizza) -> Bool {
        return favouritePizzas.contains(pizza.name)
    }
    
    func add(_ pizza:Pizza) {
//        objectWillChange.send()
        favouritePizzas.insert(pizza.name)
        save()
    }
    
    func remove(_ pizza:Pizza) {
//        objectWillChange.send()
        favouritePizzas.remove(pizza.name)
        save()
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(favouritePizzas) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
}
