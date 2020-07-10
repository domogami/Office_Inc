//
//  MainGame.swift
//  Office Simulator
//
//  Created by Dominick Lee on 7/1/20.
//  Copyright © 2020 Domogami. All rights reserved.
//

import SwiftUI

struct MainGame: View {
  
  @State var flipped = false
  @State var flipped1 = false
  var customOffset = false
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
          if (self.showMain > 15) {
            VStack {
              Text("More Content Coming Soon!")
                .padding(30)
                .font(.system(size: 18, weight: .bold, design: .default))
                .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
              
              Text("Thank you for your support. Please provide beta feedback to let us know what we can do better")
                .padding(.horizontal, 30)
                .font(.system(size: 16, weight: .semibold, design: .default))
                .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
              Button("Home") {
                self.index = 0
              }
              .padding(.horizontal, 30)
              .padding(.vertical, 10)
              .font(.system(size: 16, weight: .semibold, design: .default))
              .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
              .background(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
              .cornerRadius(20)
              .padding(.top, 30)
            }
            .frame(width: screen.width * (3/4), height: screen.height / 2)
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
          }
        }
        
        // MARK: - Next 10 Cards
        Group {
          // MARK: - Card 15
          if (self.showMain == 15 || self.showMain == 7) {
            GenericCard(
              showMain: self.$showMain,
              flipped: self.$flipped1,
              flipped1: self.$flipped,
              cardNumber: 14,
              MainText: "Are you sure you don’t want to help?",
              SubText: "",
              LeftText: "Fine! What do you want?",
              RightText: "Do I need to call securtiy?",
              imageName: "Desk-animated-illustration",
              rightChoice: 31,
              leftChoice: 30,
              italic: 0
              
            )
          }
          
          // MARK: - Card 14
          if (self.showMain == 14 || self.showMain == 7) {
            GenericCard(
              showMain: self.$showMain,
              flipped: self.$flipped1,
              flipped1: self.$flipped,
              cardNumber: 14,
              MainText: "Wonderful! Can we step outside for this, I don’t want to attract any attention here.",
              SubText: "",
              LeftText: "Sure - I’ll be right with you!",
              RightText: "I don’t think I can just walk out right now...",
              imageName: "Desk-animated-illustration",
              rightChoice: 29,
              leftChoice: 28,
              italic: 0
              
            )
          }
          
          // MARK: - Card 13
          if (self.showMain == 13 || self.showMain == 6) {
            GenericCard(
              showMain: self.$showMain,
              flipped: self.$flipped1,
              flipped1: self.$flipped,
              cardNumber: 13,
              MainText: "The Reporter hands you a small, black device. They start to walk out quietly.",
              SubText: "Yes - take this letter,  read it, and take these too...",
              LeftText: "Examine the device",
              RightText: "Examine the letter.",
              imageName: "",
              rightChoice: 27,
              leftChoice: 26,
              italic: 1
              
            )
          }
          
          // MARK: - Card 12
          if (self.showMain == 12 || self.showMain == 6) {
            GenericCard(
              showMain: self.$showMain,
              flipped: self.$flipped1,
              flipped1: self.$flipped,
              cardNumber: 12,
              MainText: "They take you to their car.",
              SubText: "I’ve got two leads - the Riverside Plant and the Factory... where to?",
              LeftText: "Sure - I’ll be right with you!",
              RightText: "I don’t think I can just walk out right now...",
              imageName: "Desk-animated-illustration",
              rightChoice: 25,
              leftChoice: 24,
              italic: 1
              
            )
          }
          
          
          // MARK: - Card 11
          if (self.showMain == 11 || self.showMain == 5) {
            GenericCard(
              showMain: self.$showMain,
              flipped: self.$flipped1,
              flipped1: self.$flipped,
              cardNumber: 11,
              MainText: "Oh - um, well,  Jake hasn’t been doing his work lately anyhow. Thankfully you’ve been ahead of schedule.",
              SubText: "",
              LeftText: "Yeah - Jake’s really not been pulling his weight.",
              RightText: "Actually, Abe, it isn’t Jake. It’s me.",
              imageName: "Desk-animated-illustration",
              rightChoice: 23,
              leftChoice: 22,
              italic: 0
              
            )
          }
          
          // MARK: - Card 10
          if (self.showMain == 10 || self.showMain == 6) {
            GenericCard(
              showMain: self.$showMain,
              flipped: self.$flipped1,
              flipped1: self.$flipped,
              cardNumber: 10,
              MainText: "Abe takes you to the presentation room, and in a couple minutes, coworkers start to fill in the tables.",
              SubText: "",
              LeftText: "Take a seat in the back, by the door.",
              RightText: "Sit next to Abe in the front.",
              imageName: "Desk-animated-illustration",
              rightChoice: 21,
              leftChoice: 20,
              italic: 0
            )
          }
        }// End Of Group
        
        // MARK: - First 10 Cards
        Group {
          // MARK: - Card 9
          if (self.showMain == 9 || self.showMain == 4) {
            GenericCard(
              showMain: self.$showMain,
              flipped: self.$flipped1,
              flipped1: self.$flipped,
              cardNumber: 9,
              MainText: "\(self.playerName), who was that there?",
              SubText: "",
              LeftText: "I don’t know,  I just told them to leave",
              RightText: "Oh, they said they was a reporter from Newspaper Inc",
              imageName: "Desk-animated-illustration",
              rightChoice: 19,
              leftChoice: 18,
              italic: 0
            )
          }
          
          // MARK: - Card 8
          if (self.showMain == 8 || self.showMain == 4) {
            GenericCard(
              showMain: self.$showMain,
              flipped: self.$flipped1,
              flipped1: self.$flipped,
              cardNumber: 8,
              MainText: "\(self.playerName), who was that there?",
              SubText: "",
              LeftText: "I don’t know,  I just told them to leave",
              RightText: "Oh, they said they was a reporter from Newspaper Inc",
              imageName: "Desk-animated-illustration",
              rightChoice: 17,
              leftChoice: 16,
              italic: 0
              
            )
          }
          
          // MARK: - Card 7
          if (self.showMain == 7 || self.showMain == 3) {
            GenericCard(
              showMain: self.$showMain,
              flipped: self.$flipped,
              flipped1: self.$flipped1,
              cardNumber: 7,
              MainText: "Come on - I’ve worked at this case for months, please I just need one person here to work with me.",
              SubText: "",
              LeftText: "Alright - you’ve caught my interest.",
              RightText: "I said no - please leave me alone.",
              imageName: "Desk-animated-illustration",
              rightChoice: 15,
              leftChoice: 14,
              italic: 0
              
            )
          }
          
          // MARK: - Card 6
          if (self.showMain == 6 || self.showMain == 3) {
            GenericCard(
              showMain: self.$showMain,
              flipped: self.$flipped,
              flipped1: self.$flipped1,
              cardNumber: 6,
              MainText: "You step outside the office.",
              SubText: "I found out where they’re doing it. Can you come with me?",
              LeftText: "Alright - you’ve caught my interest.",
              RightText: "I said no - please leave me alone.",
              imageName: "reporter",
              rightChoice: 13,
              leftChoice: 12,
              italic: 1
              
            )
          }
          
          // MARK: - Card 5
          if (self.showMain == 5 || self.showMain == 2) {
            GenericCard(
              showMain: self.$showMain,
              flipped: self.$flipped,
              flipped1: self.$flipped1,
              cardNumber: 5,
              MainText: "Hey! We’ve got that presentation today \(self.playerName) - I hope the boss likes what we’ve got for all this. Are you ready?",
              SubText: "",
              LeftText: "Heck yeah! Let’s get to it!",
              RightText: "Actually - I was gonna ask if we can wait on that",
              imageName: "reporter",
              rightChoice: 11,
              leftChoice: 10,
              italic: 0
              
            )
          }
          // MARK: - Card 4
          if (self.showMain == 4 || self.showMain == 2) {
            GenericCard(
              showMain: self.$showMain,
              flipped: self.$flipped,
              flipped1: self.$flipped1,
              cardNumber: 4,
              MainText: "Anne is at her desk - she’s got something in her free hand while the other clicks at her keyboard.",
              SubText: "",
              LeftText: "What’s that, Anne?",
              RightText: "Hey Anne!",
              imageName: "woman-working",
              rightChoice: 9,
              leftChoice: 8,
              italic: 0
            )
          }
          
          // MARK: - Card 3
          if (self.showMain == 3 || self.showMain == 1) {
            GenericCard(
              showMain: self.$showMain,
              flipped: self.$flipped1,
              flipped1: self.$flipped,
              cardNumber: 3,
              MainText: "\(self.playerName) - You will not believe what I’ve got on the boss! Can we meet outside real quick?",
              SubText: "",
              LeftText: "You got me at the right time - let’s go!",
              RightText: "We almost got caught last time! Can you come back tommorow?",
              imageName: "reporter",
              rightChoice: 7,
              leftChoice: 6,
              italic: 0
            )
          }
          
          // MARK: - Card 2
          if (self.showMain == 2  || self.showMain == 1) {
            GenericCard(
              showMain: self.$showMain,
              flipped: self.$flipped1,
              flipped1: self.$flipped,
              cardNumber: 2,
              MainText: "The office is bustling - you have a project to attend to, or you could see someone else...",
              SubText: "",
              LeftText: "I wonder if Anne’s busy right now...",
              RightText: "I should go finish my project with Abe!",
              imageName: "Desk-animated-illustration",
              rightChoice: 5,
              leftChoice: 4,
              italic: 0
            )
          }
          
          // MARK: - Card 1
          if (self.showMain == 1 || self.showMain == 0) {
            GenericCard(
              showMain: self.$showMain,
              flipped: self.$flipped,
              flipped1: self.$flipped1,
              cardNumber: 1,
              MainText: "Morning \(self.playerName) - you’re here early today. That solicitor, eh, the one from a week ago, they’re still here waiting for you",
              SubText: "",
              LeftText: "Them again! Tell them I’m busy...",
              RightText: "Oh! Tell them I’ll be right with them.",
              imageName: "Working-animated-illustration-2",
              rightChoice: 3,
              leftChoice: 2,
              italic: 0
            )
          }
          
          // MARK: - Card 0
          if (self.showMain == 0) {
            PrimaryCard(
              playerName: self.$playerName,
              showMain: self.$showMain,
              flipped: self.$flipped,
              cardNumber: 0,
              MainText: "Welcome to the Office Inc. Closed Beta! Thank you for helping us work on this project! We need as many eyes on this as we can get, so for real, thank you! \n- The Office Inc. Team",
              SubText: "",
              LeftText: "It’s honestly no worries!",
              RightText: "Of course,  you’re welcome!",
              imageName: "coffee",
              leftChoice: 1,
              rightChoice: 1,
              italic: 0
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
    MainGame(flipped: false, playerName: .constant("Eric"), index: $index, showMain: $showMain)
  }
}
#endif
