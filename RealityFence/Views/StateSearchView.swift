//
//  StateSearchView.swift
//  RealityFence
//
//  Created by Secret on 7/26/23.
//

import SwiftUI

struct StateSearchView: View {
    let states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]

       @State private var searchText = ""
       @Binding var state: String
       @State private var selection: String?
       @Environment (\.dismiss) var dismiss
    
       var filteredStates: [String] {
           if searchText.isEmpty {
               return states
           } else {
               return states.filter { $0.lowercased().contains(searchText.lowercased()) }
           }
       }
       
       var body: some View {
               VStack {
                   SearchBar(text: $searchText)
                       .padding()
                   List(filteredStates, id: \.self) { state in
                       Text(state)
                           .onTapGesture {
                                      self.state = state
                                      self.selection = state
                                      dismiss()
                                      
                                  }
                   }
                   .listStyle(InsetGroupedListStyle())
               }
               .navigationTitle("Select a State")
       }
}

struct SearchBar: UIViewRepresentable {
    @Binding var text: String

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}

//struct StateSearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        StateSearchView()
//    }
//}
