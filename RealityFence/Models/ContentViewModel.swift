//
//  ContentViewModel.swift
//  RealityFence
//
//  Created by Secret on 7/17/23.
//

import Foundation
import MapKit

class ContentViewModel: NSObject, ObservableObject {
    
    @Published private(set) var results: Array<AddressResult> = []
    @Published var searchableText = ""

    private lazy var localSearchCompleter: MKLocalSearchCompleter = {
        let completer = MKLocalSearchCompleter()
        completer.delegate = self
        return completer
    }()
    
    func searchAddress(_ searchableText: String) {
        guard searchableText.isEmpty == false else { return }
        localSearchCompleter.queryFragment = searchableText
    }
}

extension ContentViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        Task { @MainActor in
            print (completer.results)
            results = completer.results.map {
                AddressResult(title: $0.title, subtitle: $0.subtitle)
            }
        }
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        print(error)
    }
}
