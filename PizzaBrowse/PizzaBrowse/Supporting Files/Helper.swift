//
//  Helper.swift
//  PizzaBrowse
//
//  Created by Avishka Amunugama on 5/15/22.
//

import Foundation
import UIKit

func listIngredients(_ str:String) -> String {
    if str.isEmpty { return "" }
    return "● \(str.replacingOccurrences(of: ",", with: "\n● "))"
}

func arrangeIngredients(_ str:String) -> String {
    let cleanedStr = str.replacingOccurrences(of: ",", with: "\n")
    let strippedArr = cleanedStr.components(separatedBy: .newlines).filter({ $0 != ""})
    return strippedArr.joined(separator: ",")
}
 
extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}

