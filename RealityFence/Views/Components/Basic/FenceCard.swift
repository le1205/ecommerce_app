//
//  FenceCard.swift
//  RealityFence
//
//  Created by Secret on 7/18/23.
//

import SwiftUI

struct FenceCard: View {
    struct Property {
        var image = ""
        var category  = ""
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
                    }
                   
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: 30)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(0.47))
                    
                    Text(property.category)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                }
            }
            
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

