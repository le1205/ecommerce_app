//
//  SyncDataView.swift
//  RealityFence
//
//  Created by Secret on 7/12/23.
//

import SwiftUI

struct SyncDataView: View {
    @StateObject private var viewModel = ViewModel()
    @EnvironmentObject var uData: UserData
    @EnvironmentObject var fData: FencesData
    @State private var path = NavigationPath()
    //  Using for go back to previous page
    @Environment(\.dismiss) private var dismiss
    @State private var isVStackVisible:Bool = true
    @State private var isSuccess = false
    
    var body: some View {

            VStack {
                Spacer()
                    .frame(minHeight: 100, maxHeight: 150)
                    VStack{
                        Text("Offline Mode")
                            .font(.system(size: 35, weight: .bold))
                            .kerning(0.36)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 475, height: 42 ,alignment: .center)
                        Text("Download 3D models for high-speed rendering.")
                            .font(.system(size: 10, weight: .bold))
                            .kerning(0.066)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.6))
                            .frame(width: 252, height: 12, alignment: .center)
                    }
                    .padding(.vertical, 20)
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
                if viewModel.errorMessage != "" {
                    Text(viewModel.errorMessage)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color.red)
                }
                Spacer()
            }
            .foregroundColor(.clear)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(0.47))
            .navigationBarBackButtonHidden(true)
    }
}


struct SyncDataView_Previews: PreviewProvider {
    static var previews: some View {
        SyncDataView()
    }
}
