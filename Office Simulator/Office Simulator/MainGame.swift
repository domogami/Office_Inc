//
//  MainGame.swift
//  Office Simulator
//
//  Created by Dominick Lee on 7/1/20.
//  Copyright © 2020 Domogami. All rights reserved.
//

import SwiftUI

struct MainGame: View {
  
  @State var viewStatePrevious = CGSize.zero
  @State var viewStateCurrent = CGSize.zero
  @State var flipped = false
  @Binding var playerName: String
  @Binding var index: Int
  @Binding var showMain: Int
  
  var body: some View {
    ZStack {
      // Background Color
      Color(#colorLiteral(red: 0.9490196078, green: 0.9647058824, blue: 1, alpha: 1))
        .edgesIgnoringSafeArea(.all)
      
      // Fun Nametag
      VStack {
        HStack {
          NameTag(playerName: self.$playerName)
            .rotationEffect(.degrees(-20))
            .onTapGesture {
              self.index = 0
          }
          Spacer()
          Coffee()
            .scaleEffect(0.6)
            .offset(y: 10)
            .rotationEffect(.degrees(180))
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
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
        
        Group {
          if (self.showMain > 14) {
            VStack {
              Text("More Content Coming Soon!")
                .padding(30)
                .font(.system(size: 18, weight: .bold, design: .default))
                .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
                
              Text("Thank you for your support. Please provide beta feedback to let us know what we can do better")
                .padding(.horizontal, 30)
                .font(.system(size: 16, weight: .semibold, design: .default))
                .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
            }
            .frame(width: screen.width * (3/4), height: screen.height / 2)
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            .rotationEffect(.degrees(-5))
          }
          // MARK: - Card 14
          if (self.showMain == 14) {
            GenericCard(
              viewStatePrevious: self.$viewStatePrevious,
              viewStateCurrent: self.$viewStateCurrent,
              showMain: self.$showMain,
              flipped: self.$flipped,
              cardNumber: 14,
              MainText: "card 6",
              LeftText: "Oh, I didn’t realize - what do you need?",
              RightText: "I’m sorry, but I can’t be bothered about that right now.",
              imageName: "Desk-animated-illustration",
              rightChoice: 30,
              leftChoice: 29
              
            )
          }
          
          // MARK: - Card 13
          if (self.showMain == 13) {
            GenericCard(
              viewStatePrevious: self.$viewStatePrevious,
              viewStateCurrent: self.$viewStateCurrent,
              showMain: self.$showMain,
              flipped: self.$flipped,
              cardNumber: 13,
              MainText: "card 6",
              LeftText: "Oh, I didn’t realize - what do you need?",
              RightText: "I’m sorry, but I can’t be bothered about that right now.",
              imageName: "Desk-animated-illustration",
              rightChoice: 28,
              leftChoice: 27
              
            )
          }
          
          // MARK: - Card 12
          if (self.showMain == 12) {
            GenericCard(
              viewStatePrevious: self.$viewStatePrevious,
              viewStateCurrent: self.$viewStateCurrent,
              showMain: self.$showMain,
              flipped: self.$flipped,
              cardNumber: 12,
              MainText: "card 6",
              LeftText: "Oh, I didn’t realize - what do you need?",
              RightText: "I’m sorry, but I can’t be bothered about that right now.",
              imageName: "Desk-animated-illustration",
              rightChoice: 26,
              leftChoice: 25
              
            )
          }
          
          
          // MARK: - Card 11
          if (self.showMain == 11) {
            GenericCard(
              viewStatePrevious: self.$viewStatePrevious,
              viewStateCurrent: self.$viewStateCurrent,
              showMain: self.$showMain,
              flipped: self.$flipped,
              cardNumber: 11,
              MainText: "card 11",
              LeftText: "Oh, I didn’t realize - what do you need?",
              RightText: "I’m sorry, but I can’t be bothered about that right now.",
              imageName: "Desk-animated-illustration",
              rightChoice: 24,
              leftChoice: 23
              
            )
          }
          
          // MARK: - Card 10
          if (self.showMain == 10) {
            GenericCard(
              viewStatePrevious: self.$viewStatePrevious,
              viewStateCurrent: self.$viewStateCurrent,
              showMain: self.$showMain,
              flipped: self.$flipped,
              cardNumber: 10,
              MainText: "card 10",
              LeftText: "Oh, I didn’t realize - what do you need?",
              RightText: "I’m sorry, but I can’t be bothered about that right now.",
              imageName: "Desk-animated-illustration",
              rightChoice: 22,
              leftChoice: 21
              
            )
          }
        }// End Of Group
        
        Group {
          // MARK: - Card 9
          if (self.showMain == 9) {
            GenericCard(
              viewStatePrevious: self.$viewStatePrevious,
              viewStateCurrent: self.$viewStateCurrent,
              showMain: self.$showMain,
              flipped: self.$flipped,
              cardNumber: 9,
              MainText: "card 9",
              LeftText: "Oh, I didn’t realize - what do you need?",
              RightText: "I’m sorry, but I can’t be bothered about that right now.",
              imageName: "Desk-animated-illustration",
              rightChoice: 20,
              leftChoice: 19
            )
          }
          
          // MARK: - Card 8
          if (self.showMain == 8) {
            GenericCard(
              viewStatePrevious: self.$viewStatePrevious,
              viewStateCurrent: self.$viewStateCurrent,
              showMain: self.$showMain,
              flipped: self.$flipped,
              cardNumber: 8,
              MainText: "card 6",
              LeftText: "Oh, I didn’t realize - what do you need?",
              RightText: "I’m sorry, but I can’t be bothered about that right now.",
              imageName: "Desk-animated-illustration",
              rightChoice: 18,
              leftChoice: 17
              
            )
          }
          
          // MARK: - Card 7
          if (self.showMain == 7) {
            GenericCard(
              viewStatePrevious: self.$viewStatePrevious,
              viewStateCurrent: self.$viewStateCurrent,
              showMain: self.$showMain,
              flipped: self.$flipped,
              cardNumber: 7,
              MainText: "card 6",
              LeftText: "Oh, I didn’t realize - what do you need?",
              RightText: "I’m sorry, but I can’t be bothered about that right now.",
              imageName: "Desk-animated-illustration",
              rightChoice: 16,
              leftChoice: 15
              
            )
          }
          
          // MARK: - Card 6
          if (self.showMain == 6) {
            GenericCard(
              viewStatePrevious: self.$viewStateCurrent,
              viewStateCurrent: self.$viewStatePrevious,
              showMain: self.$showMain,
              flipped: self.$flipped,
              cardNumber: 6,
              MainText: "card 6",
              LeftText: "Oh, I didn’t realize - what do you need?",
              RightText: "I’m sorry, but I can’t be bothered about that right now.",
              imageName: "Desk-animated-illustration",
              rightChoice: 14,
              leftChoice: 13
              
            )
          }
          
          // MARK: - Card 5
          if (self.showMain == 5) {
            GenericCard(
              viewStatePrevious: self.$viewStateCurrent,
              viewStateCurrent: self.$viewStatePrevious,
              showMain: self.$showMain,
              flipped: self.$flipped,
              cardNumber: 5,
              MainText: "card 5",
              LeftText: "Oh, I didn’t realize - what do you need?",
              RightText: "I’m sorry, but I can’t be bothered about that right now.",
              imageName: "Desk-animated-illustration",
              rightChoice: 12,
              leftChoice: 11
              
            )
          }
          // MARK: - Card 4
          if (self.showMain == 4) {
            GenericCard(
              viewStatePrevious: self.$viewStateCurrent,
              viewStateCurrent: self.$viewStatePrevious,
              showMain: self.$showMain,
              flipped: self.$flipped,
              cardNumber: 4,
              MainText: "card 4",
              LeftText: "Oh, I didn’t realize - what do you need?",
              RightText: "I’m sorry, but I can’t be bothered about that right now.",
              imageName: "Desk-animated-illustration",
              rightChoice: 10,
              leftChoice: 9
              
            )
          }
          // MARK: - Card 3
          if (self.showMain == 3) {
            GenericCard(
              viewStatePrevious: self.$viewStateCurrent,
              viewStateCurrent: self.$viewStatePrevious,
              showMain: self.$showMain,
              flipped: self.$flipped,
              cardNumber: 3,
              MainText: "card 3",
              LeftText: "Oh, I didn’t realize - what do you need?",
              RightText: "I’m sorry, but I can’t be bothered about that right now.",
              imageName: "Desk-animated-illustration",
              rightChoice: 8,
              leftChoice: 7
              
            )
          }
          
          // MARK: - Card 2
          if (self.showMain == 2) {
            GenericCard(
              viewStatePrevious: self.$viewStatePrevious,
              viewStateCurrent: self.$viewStateCurrent,
              showMain: self.$showMain,
              flipped: self.$flipped,
              cardNumber: 2,
              MainText: "Look - please, I work for Newspaper Inc. - There’s something up here, and I need help.",
              LeftText: "Oh, I didn’t realize - what do you need?",
              RightText: "I’m sorry, but I can’t be bothered about that right now.",
              imageName: "Desk-animated-illustration",
              rightChoice: 6,
              leftChoice: 5
              
            )
          }
          
          // MARK: - Card 1
          if (self.showMain == 1) {
            GenericCard(
              viewStatePrevious: self.$viewStatePrevious,
              viewStateCurrent: self.$viewStateCurrent,
              showMain: self.$showMain,
              flipped: self.$flipped,
              cardNumber: 1,
              MainText: "I’m Isey - I work for Newspaper Inc. and I’m here on a tip,  can we go outside?",
              LeftText: "I’m a little busy, can you come by later?",
              RightText: "Yeah, I’m not so busy right now",
              imageName: "Desk-animated-illustration",
              rightChoice: 4,
              leftChoice: 3
            )
          }
          
          // MARK: - Card 0
          if (self.showMain == 0) {
            PrimaryCard(
              playerName: self.$playerName,
              viewState: self.$viewStatePrevious,
              showMain: self.$showMain,
              flipped: self.$flipped,
              MainText: "\(self.playerName) - you’re new around here right? Can I have a moment of your time?",
              LeftText: "Yeah, um, who are you?",
              RightText: "No - I’m kinda busy right now",
              imageName: "Desk-animated-illustration"
            )
          }
        } // End Of Group
      }
    }
  }
  func simpleSuccess() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.success)
  }
}

#if DEBUG
struct MainGame_Previews: PreviewProvider {
  @State static var index = 0
  @State static var showMain = 0
  @State static var choice = 0
  
  static var previews: some View {
    
    MainGame(viewStatePrevious: CGSize.zero, viewStateCurrent: CGSize.zero, flipped: false, playerName: .constant("Eric"), index: $index, showMain: $showMain)
  }
}
#endif
