//
//  ResetPassView.swift
//  RealityFence
//
//  Created by Secret on 7/7/23.
//

import SwiftUI

struct ResetPassView: View {
    
    @StateObject private var viewModel = ViewModel()
    @StateObject var userData = UserData()
    @State private var gotoSignUp: Bool = false
    @State private var gotoMain: Bool = false
    
    @State private var path = NavigationPath()
    
    var body: some View {
                    VStack() {
                        AuthHeader()
                        Spacer()
                            .frame(height: 60)
                        VStack(alignment: .leading, spacing: 24) {
                            Text("Reset Password")
                              .foregroundColor(.black)
                              .font(.system(size: 28, weight: .bold))
                            // Body/Large/Regular
                            Text("Your new password must be different from previous used passwords")
                              .font(Font.custom("DM Sans", size: 18))
                              .foregroundColor(Color(red: 0.41, green: 0.44, blue: 0.55))
                              .frame(maxWidth: .infinity, minHeight: 96, maxHeight: 96, alignment: .topLeading)
                            VStack(spacing:-20){
                                ViewableSecureField(caption: "Password", text: $viewModel.password)
                                ViewableSecureField(caption: "Confirm_Password", text: $viewModel.confirmedPassword)
                            }
                            HStack {
                                Spacer()
                                SubmitButton(text: "Reset Password", submitAction: {await viewModel.attemptReset(userData: self.userData)}, buttonWidth: 150)
                                Spacer()
                            }
                          
                        }
                        .padding(.horizontal, 40)
                        .padding(.vertical, 48)
                        .frame(width: 337, height: 509, alignment: .topLeading)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                       Spacer()
                    }
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(0.47))
                    .navigationDestination(isPresented: $gotoSignUp) {
                    PlanView()
                    }
                    .navigationBarBackButtonHidden(true)
    }
}

struct ResetPassView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassView()
    }
}
