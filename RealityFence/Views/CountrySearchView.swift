//
//  CountrySearchView.swift
//  RealityFence
//
//  Created by Secret on 7/26/23.
//

import SwiftUI

struct Country {
    let name: String
    let states: [String]
}

struct CountrySearchView: View {
    let countries = ["United States", "Canada", "Mexico", "United Kingdom", "Germany", "France", "Italy", "Japan", "China", "Australia", "India", "Brazil", "Argentina", "Russia", "South Africa", "Netherlands", "Sweden", "Norway", "Spain", "Switzerland", "New Zealand"]

        @State private var searchText = ""
        @Binding var country: String
        @State private var selection: String?
        @Environment (\.dismiss) var dismiss

        var filteredCountries: [String] {
            if searchText.isEmpty {
                return countries
            } else {
                return countries.filter { $0.lowercased().contains(searchText.lowercased()) }
            }
        }
        
        var body: some View {
                VStack {
                    SearchBar(text: $searchText)
                        .padding()
                    List(filteredCountries, id: \.self) { country in
                        Text(country)
                            .onTapGesture {
                                       self.country = country
                                       self.selection = country
                                       dismiss()
                                       
                                   }
                    }
                    .listStyle(InsetGroupedListStyle())
                }
                .navigationTitle("Select a Country")
            }
}


