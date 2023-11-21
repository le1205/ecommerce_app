//
//  CustomeFenceCard.swift
//  RealityFence
//
//  Created by Secret on 7/3/23.
//

import SwiftUI

struct CustomeFenceCard: View {
    struct Property {
        var image = ""
        var category  = ""
        var isLike: Bool
        var id = UUID()
    }
    
    @State var property : Property
    
    var body: some View {

            GeometryReader { geometry in
                VStack(alignment: .center, spacing: 16) {
                Spacer()
                    ZStack{
                        AsyncImage(url: URL(string: property.image))
                        { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                Color.white
                            }
                        Image(property.isLike ? "ic_heart_active" : "ic_heart")
                            .frame(width: 16, height: 14)
                            .offset(x: geometry.size.width * 0.4, y: -geometry.size.height * 0.3)


                    }
                   
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
//                        .frame(width: .infinity, height: geometry.size.height * 0.2)
                        .frame(height: 30)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(0.47)
                        )
                    
                    Text(property.category)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
//                        .frame(height: .infinity, alignment: .topLeading)
                    
                }
            }
            
        }
//        .padding(.horizontal, 1)
        .onTapGesture {
                       // Handle the click action here
                       property.isLike.toggle()
                       // Perform any desired actions or navigation
                   }
        .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 350 : nil, height: UIDevice.current.userInterfaceIdiom == .pad ? 300 : 165, alignment: .top)
        .background(.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(red: 0.57, green: 0.62, blue: 0.67).opacity(0.24), lineWidth: 0)
        )
        
    }
}


