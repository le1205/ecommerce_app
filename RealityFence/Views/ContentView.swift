//
//  ContentView.swift
//  RealityFence
//
//  Created by Secret on 7/1/23.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    var body: some View {
        
        NavigationStack (path: $path) {
            NavigationLink(destination: LandView()) {
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [.init(#colorLiteral(red: 0.1058823529, green: 0.662745098, blue: 1, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomLeading)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        Image("rf_logo")
                            .resizable()
                            .aspectRatio(contentMode:.fit)
                        
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
