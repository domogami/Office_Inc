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
    var customOffset: Bool
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
        
        HStack {
          Text(self.text)
            .fixedSize(horizontal: false, vertical: true)
            .font(.system(size: 18, weight: .semibold, design: .default))
            .padding(.horizontal, 30)
            .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
          
          Spacer()
        }
        
        LottieView(filename: self.image)
          .offset(x: self.customOffset ? -15:0, y: self.customOffset ? -10:0)
          .scaleEffect(1.2)
        
      }
      .frame(width: screen.width * (3/4), height: screen.height / 2)
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
      MainCard(
        image: "Desk-animated-illustration",
        text: "Everyone in the office today is tired; it’s Monday after all. There’s an argument between Jeremey and Yolanda from HR over in the breakroom.",
        customOffset: true
      )
    }
}
