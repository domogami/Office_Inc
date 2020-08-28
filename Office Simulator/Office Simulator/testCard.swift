//
//  testCard.swift
//  Office Inc.
//
//  Created by Dominick Lee on 8/12/20.
//  Copyright © 2020 Domogami. All rights reserved.
//

import SwiftUI

struct testCard: View {
  @State var viewState = CGSize.zero
  @Binding var showMain: Int
  @State var flipped: Bool
  var cardNumber: Int
  var MainText: String
  var SubText: String
  var LeftText: String
  var RightText: String
  var imageName: String
  var rightChoice: Int
  var leftChoice: Int
  var italic: Int
  
  var body: some View {
    ZStack {
      // Left Post It
      VStack {
        Text(LeftText)
          .opacity(viewState.width > 20 ? 1 : 0)
          .font(.system(size: 18, weight: .semibold, design: .default))
          .padding(.leading, 15)
          .padding(.trailing, 20)
          .fixedSize(horizontal: false, vertical: true)
          .padding(.horizontal, 30)
          .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
      }
      .frame(width: 200, height: 200)
      .background(Color(#colorLiteral(red: 1, green: 0.9725490196, blue: 0.3019607843, alpha: 1)))
      .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
      .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
      .offset(y: viewState.height / 4)
      .offset(x: -screen.width / 2, y: 50)
      .offset(x: viewState.width * (2/3))
      .rotationEffect(.degrees(-10))
      .animation(.easeInOut)
      .offset(x: (self.showMain != cardNumber) ? -800 : 0)
      .animation(.spring())
      .opacity(self.flipped ? 1 : 0)
      .animation(.easeInOut)
      
      // Right Post It
      VStack {
        Text(RightText)
          .opacity(viewState.width < -20 ? 1 : 0)
          .font(.system(size: 18, weight: .semibold, design: .default))
          .padding(.leading, 15)
          .padding(.trailing, 20)
          .fixedSize(horizontal: false, vertical: true)
          .padding(.horizontal)
          .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
      }
      .frame(width: 200, height: 200)
      .background(Color(#colorLiteral(red: 0.1764705882, green: 0.3843137255, blue: 0.7843137255, alpha: 1)))
      .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
      .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
      .offset(y: viewState.height / 4)
      .offset(x: screen.width / 2, y: -100)
      .offset(x: viewState.width * (2/3))
      .rotationEffect(.degrees(10))
      .animation(Animation.easeInOut.delay(0))
      .offset(x: (self.showMain != cardNumber) ? 800 : 0)
      .animation(Animation.spring().delay(1.5))
      .opacity(self.flipped ? 1 : 0)
      .animation(.easeInOut)
      
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
            subText: SubText,
            italic: italic
          )
          .frame(width: screen.width * (3/4), height: screen.height / 2)
          .opacity(self.flipped ? 1 : 0)
          ),
        showBack: self.$flipped
      )
      .offset(x: self.viewState.width, y: self.viewState.height)
      .rotationEffect(.degrees(1/20 * Double(viewState.width)))
      .gesture(
        DragGesture().onChanged { value in
          self.viewState = value.translation
        }
        .onEnded { value in
          if (self.viewState.width < -70) {
            self.viewState.width = -800
            self.simpleSuccess()
            self.showMain = self.rightChoice
            print(self.showMain)
            self.flipped = false
          }
          else if (self.viewState.width > 70) {
            self.viewState.width = 800
            self.simpleSuccess()
            self.showMain = self.leftChoice
            print(self.showMain)
            self.flipped = false
          }
          else {
            self.viewState = .zero
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


struct testCard_Previews: PreviewProvider {
  
  static var previews: some View {
    testCard(
      showMain: .constant(0),
      flipped: true,
      cardNumber: 1,
      MainText: "I’m Isey - I work for Newspaper Inc. and I’m here on a tip, can we go outside?",
      SubText: "",
      LeftText: "I’m a little busy, can you come by later?",
      RightText: "Yeah, I’m not so busy right now",
      imageName: "coffee",
      rightChoice: 1,
      leftChoice: 1,
      italic: 0
    )
  }
}
