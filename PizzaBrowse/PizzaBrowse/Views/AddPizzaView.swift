//
//  AddPizzaView.swift
//  PizzaBrowse
//
//  Created by Avishka Amunugama on 5/16/22.
//

import SwiftUI

enum AlertType {
    case duplicateError, noName
}

struct AddPizzaView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var name: String  = ""
    @State private var ingredients: String  = ""
    @State private var imageName: String  = ""
    @State private var thumbnailImageName: String = ""
    @State private var type: FilterType = .meat
    @State private var showAlert: Bool = false
    @State private var activeAlert: AlertType = .noName
    
    
    let pizzaList: PizzaList
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Pizza type:", selection: $type) {
                    Text("Meat")
                        .tag(FilterType.meat)
                    Text("Vegetarian")
                        .tag(FilterType.vegetarian)
                }
                .pickerStyle(.inline)
                
                TextField("Name", text:$name)
                ZStack {
                    if ingredients.isEmpty {
                        HStack {
                            Text("Ingredients")
                                .foregroundColor(.primary.opacity(0.25))
                            Spacer()
                        }
                    }
                    TextEditor(text:$ingredients)
                }
                
                TextField("ImageName", text:$imageName)
                TextField("ThumbnailImageName", text:$thumbnailImageName)
                
            }
            .navigationTitle("Add Pizza")
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $showAlert) {
                switch activeAlert {
                case .duplicateError:
                    return Alert(title: Text("Duplicates Found!"), message: Text("A pizza by the same name already exists. Please enter a unique name."), dismissButton: .default(Text("OK")))
                case .noName:
                    return Alert(title: Text("Empty Name!"), message: Text("Please enter a valid name for the pizza."), dismissButton: .default(Text("OK")))
                }
            }
            .toolbar {
                ToolbarItem(placement:.cancellationAction){
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement:.confirmationAction){
                    Button("Save") {
                        saveNewPizza()
                    }
                }
            }
        }
        
    }
    
    func saveNewPizza() {
        let newPizza = Pizza(name: name, ingredients: arrangeIngredients(ingredients), imageName: validateImage(imageName), thumbnailName: validateImage(thumbnailImageName), type: type)
        
        if name.isEmpty {
            activeAlert = .noName
            showAlert = true
        }
        else if pizzaList.contains(newPizza) {
            activeAlert = .duplicateError
            showAlert = true
        }
        else {
            pizzaList.add(pizza: newPizza)
            dismiss()
        }
    }
    
    func validateImage(_ img:String) -> String {
        return (UIImage(named: img) != nil) ? img : "no_image"
    }
}

struct AddPizzaView_Previews: PreviewProvider {
    static var previews: some View {
        AddPizzaView(pizzaList: PizzaList())
    }
}
