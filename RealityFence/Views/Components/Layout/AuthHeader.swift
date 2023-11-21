//
//  AuthHeader.swift
//  RealityFence
//
//  Created by Secret on 7/4/23.
//

import SwiftUI

struct AuthHeader: View {
    @State private var gotoHome: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Image("rf_brand")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 50)
                    .clipped()
                    .onTapGesture {
                        // Perform action when the text is tapped
                        gotoHome = true
                    }
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

struct AuthHeader_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeader()
    }
}
