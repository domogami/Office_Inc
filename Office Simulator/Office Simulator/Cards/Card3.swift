//
//  Card3.swift
//  Office Simulator
//
//  Created by Dominick Lee on 7/1/20.
//  Copyright © 2020 Domogami. All rights reserved.
//

import SwiftUI

struct Card3: View {
  @Binding var viewState: CGSize
  @Binding var viewState1: CGSize
  @Binding var choice: Int
  @Binding var showMain: Int
  @Binding var flipped: Bool
  var body: some View {
    ZStack {
      // Left Post it
      VStack {
        Text("Oh, I didn’t realize - what do you need?")
          .opacity(viewState1.width > 50 ? 1: 0)
          .font(.system(size: 20, weight: .semibold, design: .default))
          .fixedSize(horizontal: false, vertical: true)
          .padding(.horizontal)
          .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
      }
      .frame(width: 200, height: 200)
      .background(Color(#colorLiteral(red: 1, green: 0.9725490196, blue: 0.3019607843, alpha: 1)))
      .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
      .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
      .offset(y: viewState1.height/4)
      .offset(x: -screen.width / 2, y: 50)
      .offset(x: viewState1.width / 2)
      .rotationEffect(.degrees(-10))
      .animation(.easeInOut)
      .offset(x: self.choice == 4 ? -800 : 0)
      .animation(.spring())
      .opacity(self.flipped ? 1 : 0)
      .animation(Animation.easeInOut(duration: 0.2).delay(1))
      
      // Right Post It
      VStack {
        Text("I’m sorry, but I can’t be bothered about that right now.")
          .opacity(viewState1.width < -50 ? 1: 0)
          .font(.system(size: 20, weight: .semibold, design: .default))
          .fixedSize(horizontal: false, vertical: true)
          .padding(.horizontal)
          .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
      }
      .frame(width: 200, height: 200)
      .background(Color(#colorLiteral(red: 0.1764705882, green: 0.3843137255, blue: 0.7843137255, alpha: 1)))
      .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
      .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
      .offset(y: viewState1.height / 4)
      .offset(x: screen.width / 2, y: -100)
      .offset(x: viewState1.width / 2)
      .rotationEffect(.degrees(10))
      .animation(Animation.easeInOut.delay(0))
      .offset(x: self.choice == 5 ? 800 : 0)
      .animation(Animation.spring().delay(1.5))
      .opacity(self.flipped ? 1 : 0)
      .animation(Animation.easeInOut(duration: 0.2).delay(1))
      
      FlipView(
        front:
         VStack{
            Spacer()
          }
          .frame(width: screen.width * (3/4), height: screen.height / 2)
          .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
          .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
          .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1),
      back:
      ( MainCard(
          image: "Designing-animated-illustration",
          text: "Look - please, I work for Newspaper Inc. - There’s something up here, and I need help.",
          customOffset: false
        )
        .frame(width: screen.width * (3/4), height: screen.height / 2)
        .opacity(self.flipped ? 1 : 0)
      ),
      showBack: self.$flipped)
      .offset(x: self.viewState1.width, y: self.viewState1.height)
      .rotationEffect(.degrees(1/20 * Double(viewState1.width)))
      .gesture(
        DragGesture().onChanged { value in
          self.viewState1 = value.translation
        }
        .onEnded { value in
          if (self.viewState1.width < -50) {
            self.viewState1.width = -800
            //self.flipped.toggle()
            self.simpleSuccess()
            self.choice = 2
            //self.showMain = 3
            self.viewState = CGSize.zero
          }
          else if (self.viewState1.width > 50) {
            self.viewState1.width = 800
            //self.flipped.toggle()
            self.simpleSuccess()
            self.choice = 3
            //self.showMain = 4
            self.viewState = CGSize.zero
          }
          else {
            self.viewState1 = .zero
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

struct Card3_Previews: PreviewProvider {
  static var previews: some View {
    Card3(
      viewState: .constant(CGSize.zero),
      viewState1: .constant(CGSize.zero),
      choice: .constant(0),
      showMain: .constant(0),
      flipped: .constant(false)
    )
  }
}
