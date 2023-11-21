//
//  LandView.swift
//  RealityFence
//
//  Created by Secret on 7/1/23.
//

import SwiftUI

struct LandView: View {
    @State private var path = NavigationPath()
    //  Using for go back to previous page
    @State private var gotoSignIn: Bool = false
    @State private var gotoSignUp: Bool = false
    
    var body: some View {
                VStack {
                    AuthHeader()
                    Spacer()
                    Image("rf_logo2")
                        .resizable()
                        .frame(width: 255, height: 255)
                    Spacer()
                    Spacer()
                    Spacer()
                    VStack {
                        CustomButton(text: "Login", status: true) {
                            gotoSignIn = true
                        }
                        CustomButton(text: "Register", status: true) {
                            gotoSignUp = true
                        }
                    }
                    .navigationDestination(isPresented: $gotoSignIn) {
                        LogInView()
                    }
                    .navigationDestination(isPresented: $gotoSignUp) {
                        PlanView()
//                        VerificodeView()
                    }
                    .foregroundColor(.clear)
                    .padding()
                }
                .foregroundColor(.clear)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(0.47))
                .navigationBarBackButtonHidden(true)
    }
}

#if DEBUG
struct LandView_Previews: PreviewProvider {
    static var previews: some View {
        LandView()
    }
}
#endif
