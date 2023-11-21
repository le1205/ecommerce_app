//
//  PlanView.swift
//  RealityFence
//
//  Created by Secret on 7/5/23.
//

import SwiftUI

struct PlanView: View {
    @State private var path = NavigationPath()
    //  Using for go back to previous page
    @Environment(\.dismiss) private var dismiss
    @State private var gotoSignIn: Bool = false
    @State private var gotoSignUp: Bool = false
    
    var body: some View {
  
                VStack {
                    AuthHeader()
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        Spacer()
                            .frame(height: 250)
                    } else {
                        Spacer()
                            .frame(height: 100)
                    }
                    Text("An Plan for Everyone")
                        .font(.system(size: 25, weight: .bold))
                        .kerning(0.36)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(width: 475, height: 42, alignment: .top)
                    Spacer()
                        .frame(height: 25)
                    Group {
                        if UIDevice.current.userInterfaceIdiom == .pad {
                            
                            HStack(spacing: 30) {
                                CustomeButton4(text: "Sell fences?\nTap here.",text_size: 24, button_size: 325, button_heigh: 200, status: true) {
                                    if let url = URL(string: "https://main.d25o9s9hmey070.amplifyapp.com/subscription") {
                                        UIApplication.shared.open(url)
                                    }
                                }
                                CustomeButton4(text: "In the market\n to buy a fence?\nTap  here.",text_size: 23, button_size: 325, button_heigh: 200, status: true) {
                                    gotoSignUp = true
                                }
                            }
                            
                        } else { VStack {
                            CustomeButton4(text: "Sell fences?\nTap here.",text_size: 16, button_size: 225, button_heigh: 70, status: true) {
                                if let url = URL(string: "https://main.d25o9s9hmey070.amplifyapp.com/subscription") {
                                    UIApplication.shared.open(url)
                                }
                            }
                            Spacer()
                                .frame(height: 15)
                            CustomeButton4(text: "In the market\n to buy a fence?\nTap  here.",text_size: 16, button_size: 225,button_heigh: 70, status: true) {
                                gotoSignUp = true
                            }
                        }
                        }
                    }
                    Spacer()
                    HStack(){
                        Spacer()
                        Text("Already have an account?")
                            .font(Font.custom("Public Sans", size: 14))
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(red: 0.13, green: 0.17, blue: 0.21))
                        Text("Login")
                            .font(Font.custom("Public Sans", size: 14))
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(red: 0, green: 0.48, blue: 1))
                            .onTapGesture {
                                // Perform action when the text is tapped
                                gotoSignIn = true
                            }
                        Spacer()
                    }
                    Spacer()
                        .frame(height:25)
                }
                .navigationDestination(isPresented: $gotoSignIn) {
                    LogInView()
                }
                .navigationDestination(isPresented: $gotoSignUp) {
                    SignView()
                }
                .foregroundColor(.clear)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(0.47))
                .navigationBarBackButtonHidden(true)
    }
}

#if DEBUG
struct PlanView_Previews: PreviewProvider {
    static var previews: some View {
        PlanView()
    }
}
#endif
