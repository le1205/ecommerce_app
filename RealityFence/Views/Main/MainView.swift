//
//  MainView.swift
//  RealityFence
//
//  Created by Secret on 7/1/23.
//

import SwiftUI

struct MainView: View {
    @State var active: Int
    @State var id: String

    @StateObject var fData = FencesData(data: FencesData.CategoryData(category: [], selectedFences: [], favouriteFences: []))
    
    @EnvironmentObject var uData: UserData
    
    var body: some View {
        VStack {
            MainHeader().environmentObject(fData).environmentObject(uData)
                if UIDevice.current.userInterfaceIdiom == .pad {
                    Spacer()
                        .frame(height: 60)
                } else {
                    Spacer()
                        .frame(height: 2)
                }
            Group {
                if (active == 1) { FavourView().environmentObject(fData)}
                if (active == 2) { FencesView().environmentObject(fData).environmentObject(uData)}
                if active == 3 || (active == 8 && active == 7 && active == 6 && active == 5)  { ProfileView() }
                if (active == 4) { SyncDataView().environmentObject(fData)}
                if (active == 9) { NotificationView().environmentObject(fData)
                        .onAppear{print ("#####")}
                }
            }
            Footer(active: $active).environmentObject(fData).environmentObject(uData)
        }
//        .onAppear{if uData.getFences != true {
//            active = 4
//        }}
        .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(0.47))
        .navigationBarBackButtonHidden(true)
    }
}

#if DEBUG
//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView(active: 2)
//    }
//}
#endif

