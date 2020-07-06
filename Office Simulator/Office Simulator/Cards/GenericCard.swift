//
//  GenericCard.swift
//  Office Simulator
//
//  Created by Dominick Lee on 7/5/20.
//  Copyright © 2020 Domogami. All rights reserved.
//

import SwiftUI

struct GenericCard: View {
  @Binding var viewStatePrevious: CGSize
  @Binding var viewStateCurrent: CGSize
  @Binding var showMain: Int
  @Binding var flipped: Bool
  var cardNumber: Int
  var MainText: String
  var LeftText: String
  var RightText: String
  var imageName: String
  var rightChoice: Int
  var leftChoice: Int
  
  var body: some View {
    ZStack {
      // Left Post It
      VStack {
        Text(LeftText)
          .opacity(viewStateCurrent.width > 30 ? 1 : 0)
          .font(.system(size: 20, weight: .semibold, design: .default))
          .fixedSize(horizontal: false, vertical: true)
          .padding(.horizontal)
          .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
      }
      .frame(width: 200, height: 200)
      .background(Color(#colorLiteral(red: 1, green: 0.9725490196, blue: 0.3019607843, alpha: 1)))
      .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
      .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
      .offset(y: viewStateCurrent.height / 4)
      .offset(x: -screen.width / 2, y: 50)
      .offset(x: viewStateCurrent.width / 2)
      .rotationEffect(.degrees(-10))
      .animation(.easeInOut)
      .offset(x: (self.showMain == leftChoice) ? -800 : 0)
      .animation(.spring())
      .opacity(self.flipped ? 1 : 0)
      .animation(Animation.easeInOut(duration: 0.2).delay(1))
      
      // Right Post It
      VStack {
        Text(RightText)
          .opacity(viewStateCurrent.width < -30 ? 1 : 0)
          .font(.system(size: 20, weight: .semibold, design: .default))
          .fixedSize(horizontal: false, vertical: true)
          .padding(.horizontal)
          .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
      }
      .frame(width: 200, height: 200)
      .background(Color(#colorLiteral(red: 0.1764705882, green: 0.3843137255, blue: 0.7843137255, alpha: 1)))
      .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
      .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
      .offset(y: viewStateCurrent.height / 4)
      .offset(x: screen.width / 2, y: -100)
      .offset(x: viewStateCurrent.width / 2)
      .rotationEffect(.degrees(10))
      .animation(Animation.easeInOut.delay(0))
      .offset(x: (self.showMain == rightChoice) ? 800 : 0)
      .animation(Animation.spring().delay(1.5))
      .opacity(self.flipped ? 1 : 0)
      .animation(Animation.easeInOut(duration: 0.2).delay(1))
      
      FlipView(
        front:
         VStack{
            Spacer()
          }
          .frame(width: screen.width * (3/4), height: screen.height / 2)
          .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
          .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
          .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1),
        back:
        ( MainCard(
            image: imageName,
            text: MainText,
            customOffset: true
          )
          .frame(width: screen.width * (3/4), height: screen.height / 2)
          .opacity(self.flipped ? 1 : 0)
        ),
        showBack: self.$flipped
      )
      .offset(x: self.viewStateCurrent.width, y: self.viewStateCurrent.height)
      .rotationEffect(.degrees(1/20 * Double(viewStateCurrent.width)))
      .gesture(
        DragGesture().onChanged { value in
          self.viewStateCurrent = value.translation
        }
        .onEnded { value in
          if (self.viewStateCurrent.width < -70) {
            self.viewStatePrevious = CGSize.zero
            self.viewStateCurrent.width = -800
            self.flipped = true
            self.simpleSuccess()
            self.showMain = self.rightChoice
            print(self.showMain)
          }
          else if (self.viewStateCurrent.width > 70) {
            self.viewStatePrevious = CGSize.zero
            self.viewStateCurrent.width = 800
            self.flipped = true
            self.simpleSuccess()
            self.showMain = self.leftChoice
            print(self.showMain)
          }
          else {
            self.viewStateCurrent = .zero
          }
        }
      )
        .animation(.spring())
    }
  }
  func simpleSuccess() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.success)
  }
}

struct GenericCard_Previews: PreviewProvider {
    static var previews: some View {
        GenericCard(
          viewStatePrevious: .constant(CGSize.zero),
          viewStateCurrent: .constant(CGSize.zero),
          showMain: .constant(0),
          flipped: .constant(false),
          cardNumber: 1,
          MainText: "I’m Isey - I work for Newspaper Inc. and I’m here on a tip,  can we go outside?",
          LeftText: "I’m a little busy, can you come by later?",
          RightText: "Yeah, I’m not so busy right now",
          imageName: "Desk-animated-illustration",
          rightChoice: 0,
          leftChoice: 1
        )
    }
}
