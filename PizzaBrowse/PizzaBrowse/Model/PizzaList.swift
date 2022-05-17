//
//  PizzaList.swift
//  PizzaBrowse
//
//  Created by Avishka Amunugama on 5/15/22.
//

import Foundation
import SwiftUI

class PizzaList: ObservableObject {

    @Published var pizzas: [Pizza]
    var meatPizzas: [Pizza] = [Pizza]()
    var veggiePizzas: [Pizza] = [Pizza]()
    private var saveKey = "SavedData"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([Pizza].self, from: data) {
                pizzas = decoded
                
                if pizzas.count > 0 { return }
            }
        }
        
        pizzas = Bundle.main.decode([Pizza].self, from: "pizzas.json")
    }
    
    func add(pizza: Pizza) {
        pizzas.append(pizza)
        saveData()
    }
    
    func remove(atOffsets offsets:IndexSet, byType type:FilterType) {
        var selectedPizza:Pizza!
        
        for i in offsets.makeIterator() {
            
            switch type {
            case .any:
                selectedPizza = pizzas[i]
            case .meat:
                selectedPizza = meatPizzas[i]
            case .vegetarian:
                selectedPizza = veggiePizzas[i]
            }
        }
        
        if let selectedPizza = selectedPizza {
            pizzas.removeAll(where: { $0 == selectedPizza })
            saveData()
        }
    }
    
    func filter(byType type: FilterType, bySearch searchStr: String) -> [Pizza] {
        
        var filteredList: [Pizza] = []
        
        switch type {
        case .meat:
            filteredList = pizzas.filter{ $0.type == .meat }
        case .vegetarian:
            filteredList = pizzas.filter{ $0.type == .vegetarian }
        default:
            filteredList = pizzas
        }
        
        if searchStr.isEmpty {
            return filteredList
        }
        else {
            return filter(list: filteredList, bySearch: searchStr)
        }
    }
    
    func filter(list: [Pizza], bySearch searchStr: String) -> [Pizza] {
        return list.filter{ $0.name.localizedCaseInsensitiveContains(searchStr) }
    }
    
    func contains(_ pizza:Pizza) -> Bool {
        var names:[String] = []
        
        for pizza in pizzas {
            names.append(pizza.name)
        }
        
        return names.contains(pizza.name)
    }
    
    func saveData() {
        if let encoded = try? JSONEncoder().encode(pizzas) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
}
