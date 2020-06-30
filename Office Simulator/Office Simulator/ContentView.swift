//
//  ContentView.swift
//  Office Simulator
//
//  Created by Dominick Lee on 6/27/20.
//  Copyright © 2020 Domogami. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State var viewState = CGSize.zero
  @State var viewState1 = CGSize.zero
  @State var choice = -1
  @State var flipped = false
  @State var showMain = 0
  @State var showOne = false

  
  var body: some View {
    ZStack {
      // Background Color
      Color(#colorLiteral(red: 0.9490196078, green: 0.9647058824, blue: 1, alpha: 1))
        .edgesIgnoringSafeArea(.all)
      
      // Fun Nametag
      VStack {
        HStack {
          NameTag()
            .rotationEffect(.degrees(-20))
          Spacer()
        }
        Spacer()
      }
        
      // Stack Of Cards
      ZStack {
        // Background Card slightly rotated
        VStack {
          Spacer()
        }
        .frame(width: screen.width * (3/4), height: screen.height / 2)
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
        .rotationEffect(.degrees(-5))
        
        if (self.showMain == 1 || self.showMain == 0 || (self.choice == 2 || self.choice == 3)) {
          MainCard(
            image: "Designing-animated-illustration",
            text: "Yolanda is on about how ‘the world will never change’ or something, I didn’t hear the first part of her rant. I know that Jeremy isn’t going to stop until she storms off, though.",
            customOffset: false
          )
          .frame(width: screen.width * (3/4), height: screen.height / 2)
          .offset(x: self.viewState1.width, y: self.viewState1.height)
          .rotationEffect(.degrees(1/20 * Double(viewState1.width)))
          .animation(Animation.default.delay(0))
          .opacity(self.flipped ? 1 : 0)
          .animation(Animation.easeInOut(duration: 0.2).delay(1))
          .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
          .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
          .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
          .foregroundColor(self.flipped ? .white : Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
          .rotation3DEffect(self.flipped ? Angle(degrees: 0): Angle(degrees: 180), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
          .animation(Animation.easeInOut(duration: 0.7).delay(0.5))
          .gesture(
            DragGesture().onChanged { value in
              self.viewState1 = value.translation
            }
            .onEnded { value in
              if (self.viewState1.width < -50) {
                self.viewState1.width = -800
//                self.flipped.toggle()
                self.simpleSuccess()
                self.choice = 2
                self.showMain = 3
                self.viewState = CGSize.zero
              }
              else if (self.viewState1.width > 50) {
                self.viewState1.width = 800
//                self.flipped.toggle()
                self.simpleSuccess()
                self.choice = 3
                self.showMain = 4
                self.viewState = CGSize.zero
              }
              else {
                self.viewState1 = .zero
              }
            }
          )
          .id("two")
          .animation(.spring())
        }
        
        if (self.showMain == 2 || self.showMain == 0 || (self.choice == 4 || self.choice == 5)) {
          MainCard(
            image: "Desk-animated-illustration",
            text: "Page Blah",
            customOffset: true
          )
          .frame(width: screen.width * (3/4), height: screen.height / 2)
          .offset(x: self.viewState1.width, y: self.viewState1.height)
          .rotationEffect(.degrees(1/20 * Double(viewState1.width)))
          .animation(Animation.default.delay(0))
          .opacity(self.flipped ? 1 : 0)
          .animation(Animation.easeInOut(duration: 0.2).delay(1))
          .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
          .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
          .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
          .foregroundColor(self.flipped ? .white : Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
          .rotation3DEffect(self.flipped ? Angle(degrees: 0): Angle(degrees: 180), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
          .animation(Animation.easeInOut(duration: 0.7).delay(0.5))
          .gesture(
            DragGesture().onChanged { value in
              self.viewState1 = value.translation
            }
            .onEnded { value in
              if (self.viewState1.width < -50) {
                self.viewState1.width = -800
//                self.flipped.toggle()
                self.simpleSuccess()
                self.choice = 4
                self.showMain = 5
                self.viewState = CGSize.zero
              }
              else if (self.viewState1.width > 50) {
                self.viewState1.width = 800
//                self.flipped.toggle()
                self.simpleSuccess()
                self.choice = 5
                self.showMain = 6
                self.viewState = CGSize.zero
              }
              else {
                self.viewState1 = .zero
              }
            }
          )
          .id("three")
          .animation(.spring())
        }
        
        if(self.showMain == 0 || (self.choice == 0 || self.choice == 1)) {
          // Left Post It
          VStack {
            Text("I was going there anyways.")
              .opacity(viewState.width > 50 ? 1: 0)
              .font(.system(size: 20, weight: .semibold, design: .default))
              .fixedSize(horizontal: false, vertical: true)
              .padding(.horizontal)
              .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
          }
          .frame(width: 200, height: 200)
          .background(Color(#colorLiteral(red: 1, green: 0.9725490196, blue: 0.3019607843, alpha: 1)))
          .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
          .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
          .offset(y: viewState.height/4)
          .offset(x: -screen.width / 2, y: 50)
          .offset(x: viewState.width / 2)
          .rotationEffect(.degrees(-10))
          .animation(.easeInOut)
          .offset(x: self.choice == 1 ? -800 : 0)
          .animation(.spring())
          
          // Right Post It
          VStack {
            Text("I bet that Abe wants an update on my project.")
              .opacity(viewState.width < -50 ? 1: 0)
              .font(.system(size: 20, weight: .semibold, design: .default))
              .fixedSize(horizontal: false, vertical: true)
              .padding(.horizontal)
              .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
          }
          .frame(width: 200, height: 200)
          .background(Color(#colorLiteral(red: 0.1764705882, green: 0.3843137255, blue: 0.7843137255, alpha: 1)))
          .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
          .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
          .offset(y: viewState.height/4)
          .offset(x: screen.width / 2, y: -100)
          .offset(x: viewState.width / 2)
          .rotationEffect(.degrees(10))
          .animation(Animation.easeInOut.delay(0))
          .offset(x: self.choice == 0 ? 800 : 0)
          .animation(Animation.spring().delay(1.5))
        
          // MARK: - Card 1
        
          MainCard(
            image: "Desk-animated-illustration",
            text: "Everyone in the office today is tired; it’s Monday after all. There’s an argument between Jeremey and Yolanda from HR over in the breakroom.",
            customOffset: true
          )
          .offset(x: viewState.width, y: viewState.height)
          .rotationEffect(.degrees(1/20 * Double(viewState.width)))
          .gesture(
            DragGesture().onChanged { value in
              self.viewState = value.translation
            }
            .onEnded { value in
              if (self.viewState.width < -50) {     // Right Choice
                self.viewState.width = -800         // Slide out animation
                self.flipped = true                 // Flip the back card
                self.simpleSuccess()                // Haptic Feedback
                self.choice = 0                     // Record the choice
                self.showMain = 1                   // Record binary decision
              }
              else if (self.viewState.width > 50) { // Left Choice
                self.viewState.width = 800          // Slide out animation
                self.flipped = true                 // Flip the back card
                self.simpleSuccess()                // Haptic Feedback
                self.choice = 1                     // Record the choice
                self.showMain = 2                   // Record binary decision
              }
              else {
                self.viewState = .zero
              }
            }
          )
          .animation(.spring())
        } // End of If
      }
    }
  }
  func simpleSuccess() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.success)
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

let screen = UIScreen.main.bounds


struct NameTag: View {
  var body: some View {
    VStack {
      Spacer()
      Text("Hello")
        .font(.system(size: 25, weight: .semibold, design: .default))
        .foregroundColor(.white)
      Text("My Name Is")
        .font(.system(size: 10, weight: .regular, design: .default))
        .foregroundColor(.white)
      
      Spacer()
      
      Text("Eric")
        .font(.system(size: 25, weight: .semibold, design: .default))
        .foregroundColor(Color.black)
        .frame(width: 150, height: 40)
        .background(Color.white)
      Spacer()
      
    }
    .frame(width: 150, height: 100)
    .background(Color(#colorLiteral(red: 0.6588235294, green: 0, blue: 0, alpha: 1)))
    .cornerRadius(15)
  }
}

// Modifiers and Extensions
extension AnyTransition {
  static var moveAndFade: AnyTransition {
    let insertion = AnyTransition.move(edge: .bottom)
      .combined(with: .opacity)
    let removal = AnyTransition.move(edge: .bottom)
      .combined(with: .opacity)
    return .asymmetric(insertion: insertion, removal: removal)
  }
}

extension Font {
    static func YesevaOne(size: CGFloat) -> Font {
        Font.custom("YesevaOne-Regular", size: size)
    }
}
