//
//  ProfileView.swift
//  RealityFence
//
//  Created by Secret on 7/1/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var viewModel = ViewModel()

    @State private var select = false
    @State private var isVStackVisible:Bool = true
    @State private var gotoPast: Bool = false
    @State private var gotoLogin: Bool = false
    @State private var gotoNext:Bool = false
    
    @EnvironmentObject var fData: FencesData
//    @EnvironmentObject var uData: UserData
    @StateObject var userData = UserData()
    
    var selectButton: UIButton!
    
    @State private var path = NavigationPath()
    
    var body: some View {
            GeometryReader { geometry in
                VStack {
                    VStack (spacing: -15){
                        Text("Sales Profile")
                            .font(.system(size: geometry.size.width * 0.06, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.13, green: 0.17, blue: 0.21))
                            .padding()
                        Text("All photos and videos captured with RealityFence are automatically watermarked with the seller's contact information, ensuring that when visualizations are shared with customers, your details remain front and center for easy follow-up.")
                            .font(Font.custom("Poppins", size: geometry.size.width * 0.021))
                            .kerning(0.066)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.6))
                            .frame(width: geometry.size.width * 0.6, height: geometry.size.height * 0.09, alignment: .center)
                    }
                    VStack {
                        CaptionedTextField(caption: "Company Name", text: $viewModel.company_name)
                        CaptionedTextField(caption: "Saller's Name", text: $viewModel.saller_name)
                        CaptionedTextField(caption: "Saller's Phone", text: $viewModel.saller_phone)
                        CaptionedTextField(caption: "Saller's Email", text: $viewModel.saller_email)
                    }
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? geometry.size.width * 0.8 : nil)
//                                                CustomeButton3(text: "Save", status: true){
//                                                  gotoNext = true
//                                                }
                    CustomeButton3(text: "Save", submitAction: { await viewModel.attemptCreateAccount(userData: self.userData)
                        isVStackVisible = false
                    })
                   
                        Spacer()
                        Group {
                            Spacer()
                            Spacer()
                        }
                }
                .padding()
                .frame(width: geometry.size.width)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(0.47))
                .navigationDestination(isPresented: $gotoLogin) {
                    LogInView()
                }
                .navigationDestination(isPresented: $gotoNext) {
                    SignView()
                }
            }
            .navigationBarBackButtonHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
