//
//  Fences.swift
//  RealityFence
//
//  Created by Secret on 7/3/23.
//

import SwiftUI

struct Fences: View {
    @State private var visitHistory: String = ""
    @State private var path = NavigationPath()
    @State var id: Int
    @EnvironmentObject var fData: FencesData
    @EnvironmentObject var cData: CategoryData
    @EnvironmentObject var uData: UserData
    
    let gridItems = [
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
    var body: some View {
        VStack {
            SubHeader(text: "back", title: "Fences", act: 7)
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 10) {
                    ForEach(fData.data.selectedFences, id: \.id) { category in
                        let nameMatch = cData.data.name == category.category
                        let colorMatch = cData.data.colors[id].title == category.color
                        let styleMatch = cData.data.styles[id].title == category.style

                        if nameMatch && colorMatch && styleMatch {
                            CustomeFenceCard(property: CustomeFenceCard.Property(
                                image: category.filesImages[0].preview,
                                category: category.name, isLike: fData.data.favouriteFences.contains { Fences in
                                    return Fences.id == category.id
                                }
                            ))
                        }
                            }
                            
                    }
                }
            .onAppear{
                print("#$$%%%-----", uData.user_id)
            }
            }
            .padding()
            .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(0.47))
        }
    }


