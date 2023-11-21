//
//  SubCategoriesView.swift
//  RealityFence
//
//  Created by Secret on 7/3/23.
//

import SwiftUI

struct SubCategoriesView: View {
    @State private var visitHistory: String = ""
    @State private var path = NavigationPath()
    @State private var gotoStyleDesign: Bool = false
    @State var id: Int
    @EnvironmentObject var cData: CategoryData
    @EnvironmentObject var fData: FencesData
    @EnvironmentObject var uData: UserData
    @State private var gotoNext: Bool = false
    
    let gridItems = [
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
    var body: some View {
                VStack (alignment: .leading){
                    SubHeader(text: "back", title: "Sub-Categories", act: 2)
                    ScrollView {
                        LazyVGrid(columns: gridItems, spacing: 10) {
                            ForEach(cData.data.sub_categories.indices, id: \.self) { index in
                                let property = cData.data.sub_categories[index]
                                FenceCard(property: FenceCard.Property(image:property.preview , category: property.title))
                                    .onTapGesture {
                                        id = index
                                        gotoNext = true
                                    }
                                }
                            
                           
                        }
                    }
                }
                
                .padding()
                .navigationDestination(isPresented: $gotoNext) {
                    SubFencesView(active: 6, id: id).environmentObject(cData).environmentObject(fData).environmentObject(uData)
                }
                .navigationBarBackButtonHidden(true)
        
        }
    
}

