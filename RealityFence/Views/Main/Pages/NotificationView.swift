//
//  NotificationView.swift
//  RealityFence
//
//  Created by Secret on 7/4/23.
//

import SwiftUI

struct NotificationView: View {
//    var isSuccess : Bool
    @StateObject private var viewModel = ViewModel()
    @State private var path = NavigationPath()
    @EnvironmentObject var fData: FencesData
    @EnvironmentObject var uData: UserData
    //  Using for go back to previous page
    @Environment(\.dismiss) private var dismiss
    @State private var visitHistory: String = ""
    @State private var isVStackVisible:Bool = true
    @State private var isClicked = true
    @State private var isOn = false
    @State private var isSuccess = false
    
    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .pad{
            ipadStack
        } else {
            iphoneStack
        }
            
    }
    var iphoneStack: some View {
        VStack {
            Spacer()
                .frame(minHeight: 10, maxHeight: 15)
            VStack {
                if isVStackVisible {
                    VStack(alignment: .center, spacing: 16) {
                        CustomeButton3(text: "Sync Data", submitAction: { await viewModel.getCategories(uData: uData, fData: fData)
                            isVStackVisible = false
                        })
                    }
                } else {
                    VStack {
                        Progressbar(type: 1, totalTime: uData.duration)
                    }
                    .padding()
                }
                if uData.getFences {
                    Text("You’re fully synced!")
                        .font(.system(size: 12))
                        .kerning(0.066)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.01, green: 0.83, blue: 0.47))
                        .frame(width: 136, height: 12, alignment: .center)
                    } else {
                        Text("You have data that’s not synced!")
                          .font(.system(size: 12))
                          .kerning(0.066)
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.95, green: 0.26, blue: 0.26))
                          .frame(width: 190, height: 12, alignment: .center)
                    }
                
            }
            Divider()
                .background(Color(#colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)))
            VStack {
                HStack {
                    Text("Notifications")
                        .font(.system(size: 20, weight: isClicked ? .bold : .regular))
                        .kerning(0.36)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(width: 204, height: 30, alignment: .top)
                        .onTapGesture {
                            isClicked = true
                        }
                    Text("Settings")
                        .font(.system(size: 20, weight: isClicked ? .regular : .bold))
                        .kerning(0.36)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(width: 204, height: 30, alignment: .top)
                        .onTapGesture {
                            isClicked = false
                        }
                }
                .padding(.vertical, 30)
                if isClicked == true {
                    CustomeNotificationCard(type: 1, img: "ic_msg", text: "Check out RealityFence’s most recent blog post!")
                        .onTapGesture {
                            if let url = URL(string: "https://main.dzvyr271pvmp2.amplifyapp.com/blogfence"){
                                UIApplication.shared.open(url)
                            }
                        }
                    CustomeNotificationCard(type: 2, img: "ic_fence", text: "Your Fence Request has been fulfilled, please sync your data.")
                    CustomeNotificationCard(type: 3, img: "ic_movie", text: "Check out the new post on RealityFence ED!")
                        .onTapGesture {
                            if let url = URL(string: "https://main.dzvyr271pvmp2.amplifyapp.com/edfence"){
                                UIApplication.shared.open(url)
                            }
                        }
                } else {
                    HStack() {
                        Toggle(isOn: $isOn) {
                            EmptyView()
                        }
                        .toggleStyle(SwitchToggleStyle(tint: Color(red: 0, green: 0.67, blue: 0.33)))
                        .frame(width: 80)
                        Spacer()
                            .frame(width: 60)
                        Text("Notify me with news and  updates from RealityFence")
                            .font(Font.custom("Inter", size: 17))
                            .foregroundColor(Color(red: 0.08, green: 0.09, blue: 0.09))
                            .frame(height: 40, alignment: .topLeading)
                        // Components/Button/Small
                        Text("View Tutorial")
                          .font(
                            Font.custom("Public Sans", size: 13)
                              .weight(.bold)
                          )
                            .foregroundColor(Color(red: 0.59, green: 0.59, blue: 0.59))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .cornerRadius(8)
                            .overlay(
                              RoundedRectangle(cornerRadius: 8)
                                .inset(by: 0.5)
                                .stroke(Color(red: 0.59, green: 0.59, blue: 0.59), lineWidth: 1)
                        )
                        
                    }
                    .padding(.horizontal, 20)
                }
                Spacer()
            }
        }
            .foregroundColor(.clear)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(0.47))
            .navigationBarBackButtonHidden(true)
    }
    
    var ipadStack: some View {
        HStack {
            ScrollView {
                VStack {
                    Text("Notifications")
                        .font(.system(size: 25, weight: .bold ))
                        .kerning(0.36)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(width: 204, height: 30, alignment: .top)
                    CustomeNotificationCard(type: 1, img: "ic_msg", text: "Check out RealityFence’s most recent blog post!")
                        .onTapGesture {
                            if let url = URL(string: "https://main.dzvyr271pvmp2.amplifyapp.com/blogfence"){
                                UIApplication.shared.open(url)
                            }
                        }
                    CustomeNotificationCard(type: 2, img: "ic_fence", text: "Your Fence Request has been fulfilled, please sync your data.")
                    CustomeNotificationCard(type: 3, img: "ic_movie", text: "Check out the new post on RealityFence ED!")
                        .onTapGesture {
                            if let url = URL(string: "https://main.dzvyr271pvmp2.amplifyapp.com/edfence"){
                                UIApplication.shared.open(url)
                            }
                        }
                        
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.75)
            VStack {
                if isVStackVisible {
                    VStack(alignment: .center, spacing: 16) {
                        CustomeButton3(text: "Sync Data", submitAction: { await viewModel.getCategories(uData: uData, fData: fData)
                            isVStackVisible = false
                        })
                    }
                } else {
                    VStack {
                        Progressbar(type: 1, totalTime: uData.duration)
                    }
                    .padding()
                }
                if uData.getFences {
                    Text("You’re fully synced!")
                        .font(.system(size: 12))
                        .kerning(0.066)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.01, green: 0.83, blue: 0.47))
                        .frame(width: 136, height: 12, alignment: .center)
                    } else {
                        Text("You have data that’s not synced!")
                          .font(.system(size: 12))
                          .kerning(0.066)
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.95, green: 0.26, blue: 0.26))
                          .frame(width: 190, height: 12, alignment: .center)
                    }
                
                Text("Settings")
                    .font(.system(size: 25, weight:.bold))
                    .kerning(0.36)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .frame(width: 204, height: 30, alignment: .top)
                    
                HStack() {
                    Toggle(isOn: $isOn) {
                        EmptyView()
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color(red: 0, green: 0.67, blue: 0.33)))
                    .frame(width: 80)
                    Spacer()
                        .frame(width: 60)
                    Text("Notify me with news and  updates from RealityFence")
                        .font(Font.custom("Inter", size: 17))
                        .foregroundColor(Color(red: 0.08, green: 0.09, blue: 0.09))
                        .frame(height: 40, alignment: .topLeading)
                    
                }
                .padding(.horizontal, 20)
            }
            .frame(width: UIScreen.main.bounds.width * 0.25)
            
        }
            .foregroundColor(.clear)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(0.47))
            .navigationBarBackButtonHidden(true)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
