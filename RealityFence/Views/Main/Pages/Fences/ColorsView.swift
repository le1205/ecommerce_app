//
//  Colors.swift
//  RealityFence
//
//  Created by Secret on 7/3/23.
//

import SwiftUI

struct ColorsView: View {
    @State private var visitHistory: String = ""
    @State private var path = NavigationPath()
    @State private var gotoNext: Bool = false
    @State var id: Int
    @EnvironmentObject var fData: FencesData
    @EnvironmentObject var cData: CategoryData
    @EnvironmentObject var uData: UserData

    let gridItems = [
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
    var body: some View {
                VStack (){
                    SubHeader(text: "back", title: "Colors", act: 6)
                    ScrollView {
                        LazyVGrid(columns: gridItems, spacing: 10) {
                            ForEach(cData.data.colors.indices, id: \.self) { index in
                                let property = cData.data.colors[index]
                                FenceCard(property: FenceCard.Property(image:property.preview , category: property.title))
                                    .onTapGesture {
                                            print("Clicked FenceCard at index \(index) with property: \(property)")
                                            id = index
                                            gotoNext = true
                                        }
                                    }
                        }
                    }
                }
                .padding()
                .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(0.47))
                .navigationDestination(isPresented: $gotoNext) {
                    SubFencesView(active: 8, id: id)
                        .environmentObject(fData)
                        .environmentObject(cData)
                        .environmentObject(uData)
                }
            }
        }

