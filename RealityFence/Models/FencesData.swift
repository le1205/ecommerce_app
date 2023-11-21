//
//  FencesData.swift
//  RealityFence
//
//  Created by Secret on 7/18/23.
//

import Foundation

class FencesData: ObservableObject {
    @Published var data: CategoryData
    
    struct CategoryData: Codable {
        let category: [Categories]
        let selectedFences: [Fences]
        let favouriteFences: [Fences]
    }

    struct Categories: Codable {
        var id: String = ""
        var name: String = ""
        let images: Images
        let sub_categories: [Styles]
        let styles: [Styles]
        let colors: [Styles]
    }
    
    struct Fences: Codable {
        var id: String = ""
        var name: String = ""
        var description: String = ""
        let filesImages: [Images]
        var category: String = ""
        var sub_category: String = ""
        var style: String = ""
        var color: String = ""
        var size: String = ""
        let tags: [String]
        // Add more properties as needed
    }

    struct Images: Codable {
        var preview: String = ""
//        var key: String = ""
    }
    
    struct Styles: Codable, Hashable {
        var title: String = ""
        var preview: String = ""
    }
    
    // Add initializer
    init(data: CategoryData) {
        self.data = data
    }
}

class CategoryData: ObservableObject {
    @Published var data: Categories

    struct Categories: Codable {
        var id: String = ""
        var name: String = ""
        let images: Images
        let sub_categories: [Styles]
        let styles: [Styles]
        let colors: [Styles]
    }

    struct Images: Codable {
        var preview: String = ""
//        var key: String = ""
    }
    
    struct Styles: Codable, Hashable {
        var title: String = ""
        var preview: String = ""
    }
    
    // Add initializer
    init(data: Categories) {
        self.data = data
    }
}



