//
//  SubFencesView.swift
//  RealityFence
//
//  Created by Secret on 7/19/23.
//

import SwiftUI

struct SubFencesView: View {
    @State var active: Int
    @State var id: Int

    @EnvironmentObject var cData: CategoryData
    @EnvironmentObject var fData: FencesData
    @EnvironmentObject var uData: UserData
    
    var body: some View {
        VStack {
                MainHeader()
                if UIDevice.current.userInterfaceIdiom == .pad {
                    Spacer()
                        .frame(height: 60)
                } else {
                    Spacer()
                        .frame(height: 2)
                }
            Group {
                if (active == 5) { SubCategoriesView(id: id).environmentObject(cData)
                    .environmentObject(fData)}
                if (active == 6) { StyleDesignView(id: id).environmentObject(cData)
                    .environmentObject(fData)}
                if (active == 7) { ColorsView(id: id).environmentObject(cData)
                    .environmentObject(fData) }
                if (active == 8) { Fences(id: id).environmentObject(fData).environmentObject(cData)}
            }
                Footer(active: $active).environmentObject(fData).environmentObject(uData)
                .onAppear{print("#$#$#$", $active)}
        }
        .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(0.47))
        .navigationBarBackButtonHidden(true)
    }
}


