//
//  Pizza.swift
//  PizzaBrowse
//
//  Created by Avishka Amunugama on 5/15/22.
//

import Foundation

struct Pizza: Codable, Equatable {
    
    let name: String
    let ingredients: String
    let imageName: String
    let thumbnailName: String
    let type: FilterType
    
    static let pizzas = Bundle.main.decode([Pizza].self, from: "pizzas.json")
    static let example = pizzas[3]
}

enum FilterType: String, Codable, CaseIterable {
    case any, meat, vegetarian
    
    var displayName: String {
        switch self {
            case .any:
                return "All 🍕"
            case .meat:
                return "Meat 🥩"
            case .vegetarian:
                return "Veggie 🥗"
        }
    }
}


