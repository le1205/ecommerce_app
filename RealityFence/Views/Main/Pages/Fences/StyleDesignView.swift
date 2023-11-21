//
//  StyleDesignView.swift
//  RealityFence
//
//  Created by Secret on 7/3/23.
//

import SwiftUI

struct StyleDesignView: View {
    @State private var visitHistory: String = ""
    @State private var path = NavigationPath()
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
                    SubHeader(text: "back", title: "Styles/Designs", act: 5)
                    ScrollView {
                        LazyVGrid(columns: gridItems, spacing: 10) {
                            ForEach(cData.data.styles.indices, id: \.self) { index in
                                let property = cData.data.styles[index]
                                FenceCard(property: FenceCard.Property(image: property.preview, category: property.title))
                                    .onTapGesture {
                                        id = index
                                        gotoNext = true
                                        
                                    }
                            }
                           
                        }
                    }
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(0.47))
                }
                .padding()
                .navigationBarBackButtonHidden(true)
                .navigationDestination(isPresented: $gotoNext) {
                    SubFencesView(active: 7, id: id).environmentObject(cData)
                        .environmentObject(fData).environmentObject(uData)
                }
        
        }
}


