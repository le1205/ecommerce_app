//
//  LocationSearchView.swift
//  RealityFence
//
//  Created by Secret on 7/17/23.
//

import SwiftUI
import MapKit
import CoreLocation

struct LocationSearchView: View {
    
    @StateObject var viewModel = ContentViewModel()
    @FocusState private var isFocusedTextField: Bool
    @Binding var location: String
    @Binding var resetFlag: Bool
    
    var body: some View {
//        NavigationView {
            VStack(alignment: .leading, spacing: 0) {

                TextField("Type address", text: $viewModel.searchableText)
                    .padding()
                    .autocorrectionDisabled()
                    .focused($isFocusedTextField)
                    .font(.title)
                    .onReceive(
                        viewModel.$searchableText.debounce(
                            for: .seconds(1),
                            scheduler: DispatchQueue.main
                        )
                    ) {
                        viewModel.searchAddress($0)
                    }
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(0.47))
                    .overlay {
                        ClearButton(text: $viewModel.searchableText)
                            .padding(.trailing)
                            .padding(.top, 8)
                    }
                    .onAppear {
                        isFocusedTextField = true
                    }

                List(self.viewModel.results) { address in
                    AddressRow(address: address, location: $location, resetFlag: $resetFlag)
                        .listRowBackground(backgroundColor)
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }
            .background(backgroundColor)
            .edgesIgnoringSafeArea(.bottom)
//        }
    }
    
    var backgroundColor: Color = Color.init(uiColor: .systemGray6)
}
