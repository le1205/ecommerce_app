//
//  LogInView.swift
//  RealityFence
//
//  Created by Secret on 7/1/23.
//

import SwiftUI


struct LogInView: View {
    
    @StateObject var userData = UserData()
    
    @StateObject private var viewModel = ViewModel()
    
    @State private var gotoPast: Bool = false
    @State private var gotoSignUp: Bool = false
    @State private var gotoMain: Bool = false
    @State private var gotoForget: Bool = false
    
    @State private var path = NavigationPath()
    @State private var isSecure: Bool = true
    
    var body: some View {
        NavigationStack (path: $path) {
                    VStack() {
                        AuthHeader()
                        Spacer()
                            .frame(height: 100)
                        Text("Welcome Back!")
                          .foregroundColor(.black)
                          .font(.system(size: 28, weight: .bold))
                          .kerning(0.36)
                          .multilineTextAlignment(.center)
                          .frame(width: 475, height: 42, alignment: .top)
                        Spacer()
                            .frame(height: 25)
                        VStack() {
                            CaptionedTextField(caption: "Email", text: $viewModel.email)
                            ViewableSecureField(caption: "Password", text: $viewModel.password)
                        }
                        .padding()
                        .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 500 : nil)
                       
                        if viewModel.errorMessage != "" {
                            Text(viewModel.errorMessage)
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(Color.red)
                        }
                            // Navigating to main view here
                           
                        Text("Forgot password?")
                          .font(Font.custom("Public Sans", size: 17))
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0, green: 0.48, blue: 1))
                          .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .center)
                          .onTapGesture {
                                 // Perform action when the text is tapped
                              gotoForget = true
                             }
                        Spacer()
                            .frame(height:50)
                        
                        SubmitButton(text: "Login", submitAction: { await viewModel.attemptLogin(userData: self.userData)}, buttonWidth: 350)

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
                    .navigationDestination(isPresented: $gotoForget) {
                    ForgetPassView()
                    }
                    .navigationDestination(isPresented: $gotoSignUp) {
                    PlanView()
                    }
                    .navigationDestination(isPresented: $viewModel.authSuccessful) {
                        MainView(active: 4, id: "").environmentObject(userData)
                    }
                
        }
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - Preview

#if DEBUG
struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
#endif
