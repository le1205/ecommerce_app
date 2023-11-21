//
//  VerificodeView.swift
//  RealityFence
//
//  Created by Secret on 7/7/23.
//

import SwiftUI

struct VerificodeView: View {

    @State private var path = NavigationPath()
    //  Using for go back to previous page
    @State var validCode: Bool = false
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
                    Text("Verification code")
                      .font(.system(size: 24, weight: .bold))
                      .multilineTextAlignment(.center)
                      .foregroundColor(Color(red: 0.12, green: 0.66, blue: 1))
                    Text("We have sent the code verification to your email ")
                      .font(Font.custom("Source Sans Pro", size: 18))
                      .kerning(0.54)
                      .multilineTextAlignment(.center)
                      .foregroundColor(.black)
                      .frame(width: 294, height: 46, alignment: .top)
                    
                    Spacer()
                    
                    SecureCodeVerifier(code: "******")
                        .onCodeFilled { isFilled in
                            validCode = true
                        }
                    
                    VStack {
                        CustomButton(text: "Submit", status: true) {
                            gotoSignIn = true
                        }
                    }
                    .navigationDestination(isPresented: $gotoSignIn) {
                        LogInView()
                    }
                    .navigationDestination(isPresented: $gotoSignUp) {
                        PlanView()
                    }
                    .foregroundColor(.clear)
                    .padding()
                }
                .foregroundColor(.clear)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(0.47))
                .navigationBarBackButtonHidden(true)
    }
}

struct VerificodeView_Previews: PreviewProvider {
    static var previews: some View {
        VerificodeView()
    }
}
