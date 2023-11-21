//
//  ForgetPassView.swift
//  RealityFence
//
//  Created by Secret on 7/7/23.
//

import SwiftUI

struct ForgetPassView: View {
    
    @StateObject var userData = UserData()
    @StateObject private var viewModel = ViewModel()
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State private var gotoSignUp: Bool = false
    @State private var gotoMain: Bool = false
    
    @State private var path = NavigationPath()
    func getSizeClassWidth() -> CGFloat {
            if horizontalSizeClass == .compact {
                return 337
            } else {
                return 600
            }
        }
    func getSizeClassHeight() -> CGFloat {
            if horizontalSizeClass == .compact {
                return 460
            } else {
                return 700
            }
        }
    var body: some View {
                    VStack() {
                        AuthHeader()
                        if UIDevice.current.userInterfaceIdiom == .pad{
                            Spacer()
                                .frame(height: 100)
                        } else {
                            Spacer()
                                .frame(height: 60)
                        }
                        
                        VStack(alignment: .leading, spacing: 24) {
                            Text("Forgot Password")
                              .foregroundColor(.black)
                              .font(.system(size: 28, weight: .bold))
                            // Body/Large/Regular
                            Text("Enter the email address you used when you joined and we’ll send you instructions to reset your password.")
                              .font(Font.custom("DM Sans", size: 18))
                              .foregroundColor(Color(red: 0.41, green: 0.44, blue: 0.55))
                              .frame(maxWidth: .infinity, minHeight: 96, maxHeight: 96, alignment: .topLeading)
                                CaptionedTextField(caption: "Email Address", text: $viewModel.email)
                            if viewModel.errorMessage != "" {
                                Text(viewModel.errorMessage)
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(Color.red)
                            }
                            HStack {
                                Spacer()
                                SubmitButton(text: "Send", submitAction: { await viewModel.attemptSend(userData: self.userData)}, buttonWidth: 170)

                                Spacer()
                            }
                          
                        }
                        .padding(.horizontal, 40)
                        .padding(.vertical, 48)
                        .frame(width: getSizeClassWidth(), height: getSizeClassHeight(), alignment: .topLeading)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        Group{
                            Spacer()
                            HStack(){
                                Spacer()
                                Text("Don’t have an account?")
                                    .font(Font.custom("Public Sans", size: 14))
                                    .multilineTextAlignment(.trailing)
                                    .foregroundColor(Color(red: 0.13, green: 0.17, blue: 0.21))
                                Text("Register")
                                    .font(Font.custom("Public Sans", size: 14))
                                    .multilineTextAlignment(.trailing)
                                    .foregroundColor(Color(red: 0, green: 0.48, blue: 1))
                                    .onTapGesture {
                                        // Perform action when the text is tapped
                                        gotoSignUp = true
                                    }
                                Spacer()
                            }
                            Spacer()
                                .frame(height: 20)
                        }
                    }
                    .fullScreenCover(isPresented: $viewModel.isLoading) {
                                ZStack {
                                    Color.black.opacity(0.1)
                                        .ignoresSafeArea(edges: [.all])
                                    ProgressView()
                                }
                                .background(BlurredBackground())
                            }.onAppear {
                                UIView.setAnimationsEnabled(false)
                            }
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(0.47))
                    .navigationDestination(isPresented: $gotoSignUp) {
                    PlanView()
                    }
                    .navigationDestination(isPresented: $viewModel.authSuccessful) {
                        VerificodeView()
                    }
                    .navigationBarBackButtonHidden(true)
    }
}

struct ForgetPassView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPassView()
    }
}
