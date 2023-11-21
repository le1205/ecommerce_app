//
//  Footer.swift
//  RealityFence
//
//  Created by Secret on 7/1/23.
//

import SwiftUI

struct Footer: View {
    @Binding var active: Int
    @EnvironmentObject var fData: FencesData
    @EnvironmentObject var uData: UserData
    // footer type 1

    struct FavourIcon: View {
        var active: Int
        
        var body: some View {
            VStack {
                if (active == 1) {
                    Image("ic_heart_active")
                        .resizable()
                        .frame(width:30, height: 30)
                } else {
                    Image("ic_heart")
                        .resizable()
                        .frame(width:30, height: 30)
                }
                Text("Favorites")
                  .font(Font.custom("Public Sans", size: 12))
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color(red: 0.12, green: 0.66, blue: 1))
            }
        }
    }

    struct FencesIcon: View {
        var active: Int
        
        var body: some View {
            VStack {
                if (active == 2 || active == 4 || active == 5 || active == 6 || active == 7 || active == 8) {
                    Image("ic_fences_active")
                        .resizable()
                        .frame(width:30, height: 30)
                } else {
                    Image("ic_fences")
                        .resizable()
                        .frame(width:30, height: 30)
                }
                Text("Fences")
                  .font(Font.custom("Public Sans", size: 12))
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color(red: 0.12, green: 0.66, blue: 1))
            }
        }
    }

    struct ProfileIcon: View {
        var active: Int
        
        var body: some View {
            VStack {
                if (active == 3) {
                    Image("ic_user_active")
                        .resizable()
                        .frame(width:30, height: 30)
                } else {
                    Image("ic_user")
                        .resizable()
                        .frame(width:30, height: 30)
                }
                Text("Profile")
                  .font(Font.custom("Public Sans", size: 12))
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color(red: 0.12, green: 0.66, blue: 1))
            }
        }
    }

    
    var body: some View {
        VStack {
            Divider()
                .background(Color(red: 217/255, green: 217/255, blue: 217/255))
            HStack(spacing: 0) {
                Group {
                    Spacer()
                    NavigationLink(destination: MainView(active: active, id: "")) {
                        Button {
                            if (uData.getFences == true) {
                                    active = 1;
                            } else {
                                active = 4;
                            }
                        } label: { FavourIcon(active: active) }
                            .onAppear{print("#$#$", active)}
                    }
                    Spacer()
                }
                Group {
                    Spacer()
                    NavigationLink(destination: MainView(active: active, id: "")) {
                    Button {
                        if (uData.getFences == true) {
                                active = 2;
                        } else {
                            active = 4;
                        }
                        } label: { FencesIcon(active: active) }
                    }
                    Spacer()
                }
                Group {
                    Spacer()
                    NavigationLink(destination: MainView(active: active, id: "")) {
                        Button {
                            if (active != 3) {
                                active = 3;
                            }
                        } label: { ProfileIcon(active: active) }
                    }
                    Spacer()
                }
            }
        }
        .onAppear{
            if (uData.getFences == false && active != 4) {
                active = 9
            } else if ( uData.getFences == false && active == 4 ){
                active = 4
            }
        }
        .frame(maxWidth: .infinity)
        .background(.white)
    }
}
