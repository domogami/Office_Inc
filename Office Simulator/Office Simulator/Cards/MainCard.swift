//
//  MainCard.swift
//  Office Simulator
//
//  Created by Dominick Lee on 6/29/20.
//  Copyright © 2020 Domogami. All rights reserved.
//

import SwiftUI

struct MainCard: View {
    var image: String
    var text: String
    var subText: String
    var italic: Int
  
    var body: some View {
      VStack {
        HStack {
          Rectangle()
            .frame(width: 25, height: 2)
            .foregroundColor(Color.gray)
            .rotationEffect(.degrees(-30))
            .padding(.leading)
            .offset(y: -10)
          
          Spacer()
          
          Text("Office Inc.")
            .font(.YesevaOne(size: 30))
            .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
            .padding()
        }
        
        if (self.italic == 0) {
          Text(self.text)
            .multilineTextAlignment(.leading)
            .lineSpacing(3.5)
            .fixedSize(horizontal: false, vertical: true)
            .font(.system(size: 18, weight: .semibold, design: .default))
            .padding(.horizontal, 30)
            .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
            
        }
        else if (self.italic == 1) {
          VStack {
            HStack {
              Text(self.text)
                .multilineTextAlignment(.leading)
                .lineSpacing(3.5)
                .fixedSize(horizontal: false, vertical: true)
                .font(.system(size: 18, weight: .semibold, design: .default))
                .padding(.horizontal, 30)
                .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
              
              Spacer()
            }
            Text("")
            .font(.system(size: 18, weight: .semibold, design: .default))
            HStack {
              Text(self.subText)
                .font(.system(size: 18, weight: .semibold, design: .default)).italic()
                .lineSpacing(3.5)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 30)
                .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
              
              Spacer()
            }
          }
        }
        else if (self.italic == 2) {
          VStack {
            HStack {
              Text(self.text)
                .font(.system(size: 18, weight: .semibold, design: .default)).italic()
                .multilineTextAlignment(.leading)
                .lineSpacing(3.5)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 30)
                .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
              
              Spacer()
            }
            Text("")
            .font(.system(size: 18, weight: .semibold, design: .default))
            HStack {
              Text(self.subText)
                .font(.system(size: 18, weight: .semibold, design: .default))
                .lineSpacing(3.5)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 30)
                .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
              
              Spacer()
            }
          }
        }
        Spacer()
        Image(image)
          .resizable()
          .scaledToFit()
          .frame(maxWidth: screen.width / 2, maxHeight: screen.height / 4)
//        LottieView(filename: self.image)
//          .offset(x: self.customOffset ? -15:0, y: self.customOffset ? -10:0)
//          .scaleEffect(1.2)
        Spacer()
        
      }
      .frame(width: screen.width * (3/4), height: (screen.height < 700) ? 400 : 450)
      .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
      .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
      .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
      
    }
    func simpleSuccess() {
      let generator = UINotificationFeedbackGenerator()
      generator.notificationOccurred(.success)
    }
}

struct MainCard_Previews: PreviewProvider {
    static var previews: some View {
      
      Group {
        MainCard(
          image: "coffee",
          text: "Everyone in the office today is tired; it’s Monday after all. There’s an argument between Jeremey and Yolanda from HR over in the breakroom.",
          subText: "Blah",
          italic: 1
        )
          .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
          .previewDisplayName("iPhone 8")
        MainCard(
          image: "coffee",
          text: "Everyone in the office today is tired; it’s Monday after all. There’s an argument between Jeremey and Yolanda from HR over in the breakroom.",
          subText: "Blah",
          italic: 1
        )
          .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
          .previewDisplayName("iPhone 11 Pro Max")
      }
    }
}
