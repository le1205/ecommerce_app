//
//  CustomeNotificationCard.swift
//  RealityFence
//
//  Created by Secret on 7/4/23.
//

import SwiftUI

struct CustomeNotificationCard: View {
    
    var type : Int
    var img: String = ""
    var text: String = ""
    var imgColor: Color {
        switch type {
        case 1:
            return Color(red: 0, green: 0.52, blue: 1).opacity(0.2)
        case 2:
            return Color(red: 0.56, green: 0.41, blue: 0.82).opacity(0.2)
        case 3:
            return Color(red: 0.85, green: 0.3, blue: 0.06).opacity(0.2)
            
        default:
            return Color(red: 0.85, green: 0.3, blue: 0.06).opacity(0.2)
        }
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 24) {
            ZStack {
                Image(img)
            }
            .frame(width: 60, height: 60)
            .background(imgColor)
            .cornerRadius(12)
            Text(text)
              .font(
                Font.custom("Inter", size: 14)
                  .weight(.semibold)
              )
              .foregroundColor(.black)
              .frame(maxWidth: .infinity, minHeight: 60, maxHeight: 60, alignment: .topLeading)
            if type != 2 {
                    Image("arrow_right")
                        .frame(width: 24, height: 24)
                } else {
                    EmptyView()
                }
        }
        .padding(.leading, 16)
        .padding(.trailing, 24)
        .padding(.vertical, 16)
        .frame(width: 309, alignment: .leading)
        .background(Color(red: 1, green: 1, blue: 1))
        .cornerRadius(12)
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .inset(by: 0.5)
            .stroke(Color(red: 0.91, green: 0.93, blue: 0.94), lineWidth: 1)
        )
    }
}

struct CustomeNotificationCard_Previews: PreviewProvider {
    static var previews: some View {
        CustomeNotificationCard(type: 1, img: "ic_msg", text: "Check out RealityFence’s most recent blog post!")
    }
}
