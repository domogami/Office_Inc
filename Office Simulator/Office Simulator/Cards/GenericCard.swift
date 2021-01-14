//
//  GenericCard.swift
//  Office Simulator
//
//  Created by Dominick Lee on 7/5/20.
//  Copyright © 2020 Domogami. All rights reserved.
//

import SwiftUI

struct GenericCard: View {
  @State var viewState = CGSize.zero
  @Binding var showMain: Int
  @Binding var flipped: Bool
  @Binding var flipped1: Bool
  @Binding var currentNode: node
  var cardNumber: Int
  var MainText: String
  var SubText: String
  var LeftText: String
  var RightText: String
  var imageName: String
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
      .offset(x: (!self.flipped) ? -800 : 0)
      .animation(Animation.spring().delay(1.5))
      .opacity(self.flipped ? 1 : 0)
      .animation(Animation.easeInOut(duration: 0.1).delay(0.2))
      
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
      .offset(x: (!self.flipped) ? 800 : 0)
      .animation(Animation.spring().delay(1.5))
      .opacity(self.flipped ? 1 : 0)
      .animation(Animation.easeInOut(duration: 0.1).delay(0.2))
      
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
          .animation(Animation.easeInOut(duration: 0))
         
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
            self.flipped = false
            self.flipped1 = true
            self.simpleSuccess()
            if currentNode.right != nil {
              self.currentNode = self.currentNode.right!
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.showMain += 1
            }
          }
          else if (self.viewState.width > 70) {
            self.viewState.width = 800
            self.flipped = false
            self.flipped1 = true
            self.simpleSuccess()
            if currentNode.left != nil {
              self.currentNode = self.currentNode.left!
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.showMain += 1
            }
          }
          else {
            self.viewState = .zero
          }
        }
      )
      
      .animation(Animation.spring().delay(0))
    }
  }
  func simpleSuccess() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.success)
  }
}

struct GenericCard_Previews: PreviewProvider {
    static var previews: some View {
      Group {
//        GenericCard(
//          showMain: .constant(0),
//          flipped: .constant(true),
//          flipped1: .constant(false),
//          cardNumber: 1,
//          MainText: "I’m Isey - I work for Newspaper Inc. and I’m here on a tip, can we go outside?",
//          SubText: "",
//          LeftText: "I’m a little busy, can you come by later?",
//          RightText: "Yeah, I’m not so busy right now",
//          imageName: "coffee",
//          rightChoice: 1,
//          leftChoice: 1,
//          italic: 0
//        )
      }
    }
}
