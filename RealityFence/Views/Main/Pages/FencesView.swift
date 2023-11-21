//
//  FencesView.swift
//  RealityFence
//
//  Created by Secret on 7/1/23.
//

import SwiftUI

struct FencesView: View {

    @State private var path = NavigationPath()
    @EnvironmentObject var fData: FencesData
    @EnvironmentObject var uData: UserData
    @StateObject var cData = CategoryData(data: CategoryData.Categories(id: "", images: CategoryData.Images(preview: ""), sub_categories: [CategoryData.Styles(title: "", preview: "")], styles: [CategoryData.Styles(title: "", preview: "")], colors: [CategoryData.Styles(title: "", preview: "")]))
    @State private var act: Int = 0
    @State private var id: Int = 0
    @State private var category_id: String = ""
    @State private var gotoNext: Bool = false
    
    let gridItems = [
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
    var body: some View {
                VStack (alignment: .leading){
                    ScrollView {
                        LazyVGrid(columns: gridItems, spacing: 50) {
                                ForEach(fData.data.category, id: \.id) { category in
                                        FenceCard(property: FenceCard.Property(image: category.images.preview, category: category.name))
                                            .onTapGesture {
                                                let convertedData = convertCategoryToCategoryData(category: category)
                                                cData.data = convertedData!
                                                category_id = category.id
                                                if cData.data.sub_categories != [] {
                                                    act = 5
                                                } else {
                                                    act = 6
                                                }
                                                gotoNext = true
                                            }
                            }

                        }
                    }
                }
//                VStack (alignment: .leading) {
//                    ScrollView {
//                        LazyVGrid(columns: gridItems, spacing: 50) {
//                            ForEach(fData.data.category.filter { category in
//                                fData.data.selectedFences.contains { fence in
//                                    fence.category == category.name
//                                }
//                            }, id: \.id) { category in
//                                FenceCard(property: FenceCard.Property(image: category.images.preview, category: category.name))
//                                    .onTapGesture {
//                                        let convertedData = convertCategoryToCategoryData(category: category)
//                                        cData.data = convertedData!
//                                        category_id = category.id
//                                        if cData.data.sub_categories != [] {
//                                            act = 5
//                                        } else {
//                                            act = 6
//                                        }
//                                        gotoNext = true
//                                    }
//                            }
//                        }
//                    }
//                }
                .navigationDestination(isPresented: $gotoNext) {
                    SubFencesView(active: act, id: id).environmentObject(cData).environmentObject(fData).environmentObject(uData)
                }
                .padding()
                .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(0.47))
            }
    private func convertCategoryToCategoryData(category: FencesData.Categories) -> CategoryData.Categories? {
            guard let jsonData = try? JSONEncoder().encode(category),
                  let convertedData = try? JSONDecoder().decode(CategoryData.Categories.self, from: jsonData) else {
                return nil
            }
            return convertedData
        }
}

struct FencesView_Previews: PreviewProvider {
    static var previews: some View {
        FencesView()
    }
}
