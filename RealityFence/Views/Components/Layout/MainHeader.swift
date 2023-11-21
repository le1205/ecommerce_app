//
//  MainHeader.swift
//  RealityFence
//
//  Created by Secret on 7/1/23.
//

import SwiftUI

struct MainHeader: View {
    @State private var gotoHome: Bool = false
    @EnvironmentObject var uData: UserData
    @EnvironmentObject var fData: FencesData
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                    .frame(width: 30)
                Image("rf_brand")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 50)
                    .clipped()
                    .onTapGesture {
                        // Perform action when the text is tapped
                        gotoHome = true
                    }
                Spacer()
                NavigationLink(destination: MainView(active: 9, id: "").environmentObject(fData).environmentObject(uData)) {
                    Image("ic_menu")
                }
                Spacer()
                    .frame(width: 30)
            }
            Spacer()
                .frame(height: 20)
            Divider()
            .background(Color(red: 217/255, green: 217/255, blue: 217/255))
        }
            .background(.white)
            .navigationDestination(isPresented: $gotoHome) {
                ContentView()
            }
            .frame(maxWidth: .infinity)
            .navigationBarBackButtonHidden(true)
        }
}
