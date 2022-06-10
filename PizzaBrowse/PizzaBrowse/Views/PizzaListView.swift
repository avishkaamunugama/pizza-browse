//
//  PizzaListView.swift
//  PizzaBrowse
//
//  Created by Avishka Amunugama on 5/15/22.
//

import SwiftUI

struct PizzaListView: View {
    
    @EnvironmentObject var pizzaList: PizzaList
    @EnvironmentObject var favourites: Favourite
    @State private var filterType: FilterType = .any
    @State private var showingAddView = false
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                // Pizza type filter
                Picker("Filter pizzas by type.", selection:$filterType) {
                    ForEach(FilterType.allCases, id:\.self) { type in
                        Text(type.displayName)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.bottom, 10)
                
                // List of all saved pizzas
                List {
                    ForEach(pizzaList.filter(byType: filterType, bySearch: searchText), id:\.name) { pizza in
                        NavigationLink(destination:PizzaDetailsView(pizza: pizza)) {
                            PizzaRow(pizza: pizza)
                        }
                        .listRowSeparator(.hidden)
                        .padding(.init(top: 0, leading: -12, bottom: 0, trailing: -12))
                    }
                    .onDelete(perform: deletePizza(at:))
                }
                .listStyle(.plain)
                .searchable(text: $searchText, prompt: "Search for a pizza")
            }
            .padding()
            .navigationTitle("Pizza")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showingAddView, content: { AddPizzaView(pizzaList: pizzaList) })
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    EditButton()
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        showingAddView = true
                    }label: { Image(systemName: "plus") }
                }
            }
            
            // Only visible in iPads
            WelcomeView(screenType: .pizzas)
        }
    }
    
    func deletePizza(at offsets: IndexSet){
        pizzaList.remove(atOffsets: offsets, byType: filterType)
    }
}

struct PizzaListView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaListView()
            .environmentObject(PizzaList())
            .environmentObject(Favourite())
    }
}
