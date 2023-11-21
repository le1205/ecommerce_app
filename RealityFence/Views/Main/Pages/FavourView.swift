//
//  FavourView.swift
//  RealityFence
//
//  Created by Secret on 7/1/23.
//

import SwiftUI

struct FavourView: View {
    @StateObject var userData = UserData()
    @State private var path = NavigationPath()
    @State private var gotoSubCategory: Bool = false
    @EnvironmentObject var fData: FencesData

    var gridItems: [GridItem] {
        #if os(iOS)
        if UIDevice.current.userInterfaceIdiom == .pad {
            return [GridItem(.flexible()), GridItem(.flexible())]
        } else {
            return [GridItem(.flexible())]
        }
        #endif
    }
    
    var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                    ScrollView {
                        LazyVGrid(columns: gridItems, spacing: 10) {
                            ForEach(fData.data.favouriteFences , id:\.id) { property in
                                CustomeFavourCard(property: CustomeFavourCard.Property(name: property.name, image: property.filesImages[0].preview, category: property.category, sub_category: property.sub_category, color: property.color,size: property.size))
                                   
                            }
                           
                        }
                    }
                }
                .padding()
                .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(0.47))
            }
}

struct FavourView_Previews: PreviewProvider {
    static var previews: some View {
        FavourView()
    }
}
