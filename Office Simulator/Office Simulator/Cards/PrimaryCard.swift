//
//  PrimaryCard.swift
//  Office Simulator
//
//  Created by Dominick Lee on 7/5/20.
//  Copyright © 2020 Domogami. All rights reserved.
//

import SwiftUI

struct PrimaryCard: View {
  @Binding var playerName: String
  @Binding var viewState: CGSize
  @Binding var showMain: Int
  @Binding var flipped: Bool
  var MainText: String
  var LeftText: String
  var RightText: String
  var imageName: String

  var body: some View {
    ZStack {
      // Left Post It
      VStack {
        Text(self.LeftText)
          .opacity(viewState.width > 30 ? 1: 0)
          .font(.system(size: 20, weight: .semibold, design: .default))
          .fixedSize(horizontal: false, vertical: true)
          .padding(.horizontal, 30)
          .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
      }
      .frame(width: 200, height: 200)
      .background(Color(#colorLiteral(red: 1, green: 0.9725490196, blue: 0.3019607843, alpha: 1)))
      .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
      .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
      .offset(y: viewState.height/4)
      .offset(x: -screen.width / 2, y: 50)
      .offset(x: viewState.width * 3/4)
      .rotationEffect(.degrees(-10))
      .animation(.easeInOut)
      .offset(x: (self.showMain == 1) ? -800 : 0)
      .animation(.spring())
      
      // Right Post It
      VStack {
        Text(self.RightText)
          .opacity(viewState.width < -30 ? 1: 0)
          .font(.system(size: 20, weight: .semibold, design: .default))
          .fixedSize(horizontal: false, vertical: true)
          .padding(.horizontal, 30)
          .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
      }
      .frame(width: 200, height: 200)
      .background(Color(#colorLiteral(red: 0.1764705882, green: 0.3843137255, blue: 0.7843137255, alpha: 1)))
      .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
      .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
      .offset(y: viewState.height / 4)
      .offset(x: screen.width / 2, y: -100)
      .offset(x: viewState.width * (3/4))
      .rotationEffect(.degrees(10))
      .animation(Animation.easeInOut.delay(0))
      .offset(x: (self.showMain == 2) ? 800 : 0)
      .animation(Animation.spring().delay(1.5))
      
      MainCard(
        image: self.imageName,
        text: self.MainText,
        customOffset: true
      )
      .offset(x: viewState.width, y: viewState.height)
      .rotationEffect(.degrees(1/20 * Double(viewState.width)))
      .gesture(
        DragGesture().onChanged { value in
          self.viewState = value.translation
        }
        .onEnded { value in
          if (self.viewState.width < -70) {     // Right Choice
//            self.viewState.width = -800         // Slide out animation
            self.flipped = true                 // Flip the back card
            self.simpleSuccess()                // Haptic Feedback
            self.showMain = 2                  // Record binary decision
            UserDefaults.standard.set(self.showMain, forKey: "showMain")
          }
          else if (self.viewState.width > 70) { // Left Choice
            self.viewState.width = 800          // Slide out animation
            self.flipped = true                 // Flip the back card
            self.simpleSuccess()                // Haptic Feedback
            self.showMain = 1                  // Record binary decision
            UserDefaults.standard.set(self.showMain, forKey: "showMain")
          }
          else {
            self.viewState = .zero
          }
        }
      )
      .animation(.spring())
      .opacity(self.showMain == 0 ? 1 : 0)
    }
  }
  func simpleSuccess() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.success)
  }
}

struct PrimaryCard_Previews: PreviewProvider {
    static var PlayerName = "Kat"
    static var previews: some View {
        PrimaryCard(
           playerName: .constant("Kat"),
           viewState: .constant(CGSize.zero),
           showMain: .constant(0),
           flipped: .constant(false),
           MainText: "\(self.PlayerName) - you’re new around here right? Can I have a moment of your time?",
           LeftText: "Yeah, um, who are you?",
           RightText: "No - I’m kinda busy right now",
           imageName: "Desk-animated-illustration"
        )
    }
}
