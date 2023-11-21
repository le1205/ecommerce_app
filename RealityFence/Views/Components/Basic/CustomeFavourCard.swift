//
//  CustomeFavourCard.swift
//  RealityFence
//
//  Created by Secret on 7/12/23.
//

import SwiftUI

struct CustomeFavourCard: View {
    struct Property {
        var name = ""
        var image = ""
        var category  = ""
        var sub_category = ""
        var color = ""
        var size = ""
        var id = UUID()
    }
    
    @State private var isModalPresented = false
    @State var property : Property
    
    var body: some View {
        
            HStack {
                AsyncImage(url: URL(string: property.image))
                { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Color.white
                    }
                    VStack {
                        Text(property.name)
                            .font(
                                Font.custom("Inter", size: 16)
                                    .weight(.semibold)
                            )
                            .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                            .frame(maxWidth: .infinity, minHeight: 24, maxHeight: 24, alignment: .topLeading)
                        Text(property.category)
                            .font(
                                Font.custom("Public Sans", size: 12)
                                    .weight(.bold)
                            )
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, minHeight: 20, maxHeight: 20, alignment: .topLeading)
                        Text(property.color)
                            .font(
                                Font.custom("Public Sans", size: 12)
                                    .weight(.bold)
                            )
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, minHeight: 20, maxHeight: 20, alignment: .topLeading)
                        Text(property.size)
                            .font(
                                Font.custom("Public Sans", size: 12)
                                    .weight(.bold)
                            )
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, minHeight: 20, maxHeight: 20, alignment: .topLeading)
                    }
                    
                Image("ic_close_outline")
                  .frame(width: 24, height: 24)
                  .offset(x:-5, y:-32)
                  .onTapGesture {
                      isModalPresented = true
                  }
                
            }
            .background(.white)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(red: 0.57, green: 0.62, blue: 0.67).opacity(0.24), lineWidth: 0)
            )
            .sheet(isPresented: $isModalPresented, content: {
                        ModalView()
                    })
        
    }
    
}

struct CustomeFavourCard_Previews: PreviewProvider {
    static var previews: some View {
        FavourView()
    }
}
