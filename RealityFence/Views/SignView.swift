//
//  SignView.swift
//  RealityFence
//
//  Created by Secret on 7/1/23.
//

import SwiftUI

struct SignView: View {
    @StateObject private var viewModel = ViewModel()
    @StateObject var userData = UserData()
    @State private var select = false
    
    @State private var gotoPast: Bool = false
    @State private var gotoLogin: Bool = false
    @State private var gotoNext:Bool = false
    @State private var gotoLocationList:Bool = false
    @State private var gotoCountryList:Bool = false
    @State private var gotoStateList:Bool = false
    @State var resetFlag: Bool = true
    
    let options = ["Ready to buy", "Just looking"]
    @State private var selectedOption = 0
    
    var selectButton: UIButton!
    
    @State private var path = NavigationPath()
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                AuthHeader()
                if UIDevice.current.userInterfaceIdiom == .pad {
                    Spacer()
                        .frame(height: 100)
                } else {
                    Spacer()
                        .frame(height: 5)
                }
                Text("Register Your RealityFence")
                    .font(.system(size: 25, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.13, green: 0.17, blue: 0.21))
                    .frame(width: 324, height: 35, alignment: .top)
                    .padding(.top, 20)
                Text("Shopper Account")
                    .font(.system(size: 25, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.13, green: 0.17, blue: 0.21))
                    .frame(width: 324, height: 40, alignment: .top)
                if gotoNext == false {
                    VStack (){
                        CaptionedTextField(caption: "Name", text: $viewModel.username)
                        CaptionedTextField(caption: "Address Line 1", text: $viewModel.address1)
                        CaptionedTextField(caption: "Address Line 2 (Optional)", text: $viewModel.address2)
                        HStack{
                            CaptionedTextField(caption: "Country", text: $viewModel.country)
                                .onTapGesture {
                                    gotoCountryList = true
                                }
                            CaptionedTextField(caption: "State", text: $viewModel.state)
                                .onTapGesture {
                                    gotoStateList = true
                                }
//                            CaptionedTextField(caption: "Country & State", text: $viewModel.location)
//                                .onTapGesture {
//                                    gotoLocationList = true
//                                }
                        }
                        HStack{
                            CaptionedTextField(caption: "Zip Code", text: $viewModel.zip_code)
                            VStack {
                                Picker("Select an option", selection: $viewModel.interest_level) {
                                    ForEach(0..<options.count, id: \.self) { index in
                                        Text(options[index])
                                    }
                                }
                                .colorMultiply(.black)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 55)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 7)
                                        .stroke(Color(red: 80/255, green: 193/255, blue: 241/255 ))
                                )
                                .padding(.top, -5)
                                Text("Interest Level")
                                    .font(.system(size: 11))
                                    .kerning(0.066)
                                    .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.6))
                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .leading)
                            }
//                            .padding(.vertical, -20)
                        }
                        
                        
                    }
                    .padding()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 650 : nil)
                    Spacer()
                    CustomButton2(text: "Next", status: true, buttonWidth: 350){
                        gotoNext = true
                    }
                } else {
                    VStack {
                        CaptionedTextField(caption: "Email", text: $viewModel.email)
                        CaptionedTextField(caption: "Phone", text: $viewModel.phone)
                        VStack(spacing:-10) {
                            ViewableSecureField(caption: "Password", text: $viewModel.password)
                            ViewableSecureField(caption: "Confirm_Password", text: $viewModel.confirmedPassword)
                        }
                        Spacer()
                        if viewModel.errorMessage != "" {
                            Text(viewModel.errorMessage)
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(Color.red)
                        }
                        CustomButton2(text: "Back", status: true, buttonWidth: 350){
                            gotoNext = false
                        }
                        SubmitButton(text: "Register", submitAction: { await viewModel.attemptCreateAccount(userData: self.userData)}, buttonWidth: 350)
                    }
                    .padding()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 650 : nil)
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
                            gotoLogin = true
                        }
                    Spacer()
                }
                Spacer()
                    .frame(height:25)
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
            .navigationDestination(isPresented: $gotoLogin) {
                LogInView()
            }
//            .navigationDestination(isPresented: $gotoLocationList) {
//                LocationSearchView(location: $viewModel.location, resetFlag: $resetFlag)
//            }
            .navigationDestination(isPresented: $gotoCountryList) {
                CountrySearchView(country: $viewModel.country)
            }
            .navigationDestination(isPresented: $gotoStateList) {
                StateSearchView(state: $viewModel.state)
            }
            .navigationBarBackButtonHidden(true)
        }
    }

// MARK: - Preview

#if DEBUG
struct SignView_Previews: PreviewProvider {
    static var previews: some View {
        SignView()
    }
}
#endif
