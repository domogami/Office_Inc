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
  @Binding var playerName: String
  @Binding var index: Int
  @Binding var showMain: Int
  var customOffset = false
  
  var body: some View {
    ZStack {
      // Background Color
      Color(#colorLiteral(red: 0.9490196078, green: 0.9647058824, blue: 1, alpha: 1))
      //Color(#colorLiteral(red: 0.8352941176, green: 0.8196078431, blue: 0.9098039216, alpha: 1))
        .edgesIgnoringSafeArea(.all)
      
      // Fun Nametag
      VStack {
        HStack {
          NameTag(playerName: self.$playerName)
            .scaleEffect(screen.height / 800)
            .offset(x: (screen.height < 700) ? 10 : 20, y: (screen.height < 700) ? -50 : -30)
            .rotationEffect(.degrees(-20))
            .onTapGesture {
              self.index = 0
            }
          Spacer()
          Coffee()
            .scaleEffect(screen.height / 1300)
            .offset(x: (screen.height < 700) ? -20 : 0, y: (screen.height < 700) ? 50 : 30)
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
        
//        Group {
//          if (self.showMain > 31) {
//            VStack {
//              Text("More Content Coming Soon!")
//                .padding(30)
//                .font(.system(size: 18, weight: .bold, design: .default))
//                .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
//
//              Text("Thank you for your support. Please provide beta feedback to let us know what we can do better")
//                .padding(.horizontal, 30)
//                .font(.system(size: 16, weight: .semibold, design: .default))
//                .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
//              Button("Home") {
//                self.index = 0
//              }
//              .padding(.horizontal, 30)
//              .padding(.vertical, 10)
//              .font(.system(size: 16, weight: .semibold, design: .default))
//              .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
//              .background(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
//              .cornerRadius(20)
//              .padding(.top, 30)
//            }
//            .frame(width: screen.width * (3/4), height: screen.height / 2)
//            .background(Color.white)
//            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
//            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
//          }
//        }
//        // MARK: - Card 31
//        if (self.showMain == 31 || self.showMain == 15) {
//          GenericCard(
//            showMain: self.$showMain,
//            flipped: self.$flipped,
//            flipped1: self.$flipped1,
//            cardNumber: 31,
//            MainText: "No no! I’ll be on my way! Get back to your job, and I’ll get back to mine.",
//            SubText: "",
//            LeftText: "Good  Riddance",
//            RightText: "Good  Riddance",
//            imageName: "Reporter1",
//            rightChoice: 63,
//            leftChoice: 62,
//            italic: 0
//          )
//        }
//        // MARK: - Card 30
//        if (self.showMain == 30 || self.showMain == 15) {
//          GenericCard(
//            showMain: self.$showMain,
//            flipped: self.$flipped,
//            flipped1: self.$flipped1,
//            cardNumber: 30,
//            MainText: "I’m here on a bit of an investigation - I need some people on the inside to help - would you mind talking with me outside?",
//            SubText: "",
//            LeftText: "Sure - I’ll be right with you!",
//            RightText: "I don’t think I can just walk out right now...",
//            imageName: "Reporter1",
//            rightChoice: 61,
//            leftChoice: 60,
//            italic: 0
//          )
//        }
//        // MARK: - Next 10 Cards
//        Group {
//          // MARK: - Card 29
//          if (self.showMain == 29 || self.showMain == 14) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped,
//              flipped1: self.$flipped1,
//              cardNumber: 29,
//              MainText: "Alright, well, we can talk later right?",
//              SubText: "",
//              LeftText: "Yeah - how about after I get done here I talk to you",
//              RightText: "Sorry, I don’t know when I can chat..",
//              imageName: "Reporter1",
//              rightChoice: 59,
//              leftChoice: 58,
//              italic: 0
//            )
//          }
//          // MARK: - Card 28
//          if (self.showMain == 28 || self.showMain == 14) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped,
//              flipped1: self.$flipped1,
//              cardNumber: 28,
//              MainText: "Alright, so you probably don’t believe me - but Office Inc. - they’re pretty shady. I think they’re up to no good, and I’m this close to finding out some big secret.",
//              SubText: "",
//              LeftText: "What kind of big secret?",
//              RightText: "What do you mean, “No-Good”",
//              imageName: "Reporter1",
//              rightChoice: 57,
//              leftChoice: 56,
//              italic: 0
//            )
//          }
//          // MARK: - Card 27
//          if (self.showMain == 27 || self.showMain == 13) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped,
//              flipped1: self.$flipped1,
//              cardNumber: 27,
//              MainText: "Alright, well, we can talk later right?",
//              SubText: "",
//              LeftText: "Yeah - how about after I get done here I talk to you",
//              RightText: "Sorry, I don’t know when I can chat...",
//              imageName: "Reporter1",
//              rightChoice: 55,
//              leftChoice: 54,
//              italic: 0
//            )
//          }
//          // MARK: - Card 26
//          if (self.showMain == 26 || self.showMain == 13) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped,
//              flipped1: self.$flipped1,
//              cardNumber: 26,
//              MainText: "That device is a tracker - you can strap it to your bosses’ car, hide it someone’s briefcase, whatever you think will work. Find someone suspicious, and put it somewhere it won’t be found.",
//              SubText: "",
//              LeftText: "What kind of big secret?",
//              RightText: "What kind of big secret?",
//              imageName: "Reporter1",
//              rightChoice: 53,
//              leftChoice: 52,
//              italic: 0
//            )
//          }
//          // MARK: - Card 25
//          if (self.showMain == 25 || self.showMain == 12) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped,
//              flipped1: self.$flipped1,
//              cardNumber: 25,
//              MainText: "The factory is bustling already - you’ll need to try something more subtle...",
//              SubText: "",
//              LeftText: "Climb the fire escape",
//              RightText: "Look for a back door",
//              imageName: "Reporter1",
//              rightChoice: 51,
//              leftChoice: 50,
//              italic: 0
//            )
//          }
//          // MARK: - Card 24
//          if (self.showMain == 24 || self.showMain == 12) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped,
//              flipped1: self.$flipped1,
//              cardNumber: 24,
//              MainText: "The Riverside Plant is quiet - no one’s here yet - where should you go first?",
//              SubText: "",
//              LeftText: "The Main Entryway",
//              RightText: "Look for a back entrance",
//              imageName: "Reporter1",
//              rightChoice: 49,
//              leftChoice: 48,
//              italic: 0
//            )
//          }
//          // MARK: - Card 23
//          if (self.showMain == 23 || self.showMain == 11) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped,
//              flipped1: self.$flipped1,
//              cardNumber: 23,
//              MainText: "Hey! I appreciate the honesty \(self.playerName) - we need to get this done though, so how about we rehearse, then go for it!",
//              SubText: "",
//              LeftText: "Oh - it’s just stage fright - let’s do this!",
//              RightText: "Sure - a walkthrough will make me feel better.",
//              imageName: "Abe1",
//              rightChoice: 47,
//              leftChoice: 46,
//              italic: 0
//            )
//          }
//          // MARK: - Card 22
//          if (self.showMain == 22 || self.showMain == 11) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped,
//              flipped1: self.$flipped1,
//              cardNumber: 22,
//              MainText: "Ugh. I’ll go speak with him - in any case, I do have a special project coming up - think you’re up to the task?",
//              SubText: "Ladies and Gentlemen...",
//              LeftText: "I don’t really think I’m ready for that",
//              RightText: "Of course! What’s up?",
//              imageName: "Abe1",
//              rightChoice: 45,
//              leftChoice: 44,
//              italic: 0
//            )
//          }
//          // MARK: - Card 21
//          if (self.showMain == 21 || self.showMain == 10) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped,
//              flipped1: self.$flipped1,
//              cardNumber: 21,
//              MainText: "Abe begins the presentation",
//              SubText: "Ladies and Gentlemen...",
//              LeftText: "...Thank you all for your time this Friday",
//              RightText: "... Feast your eyes on this!!!",
//              imageName: "Meeting",
//              rightChoice: 43,
//              leftChoice: 42,
//              italic: 2
//            )
//          }
//          // MARK: - Card 20
//          if (self.showMain == 20 || self.showMain == 10) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped,
//              flipped1: self.$flipped1,
//              cardNumber: 20,
//              MainText: "Abe gestures for you to come over.",
//              SubText: "",
//              LeftText: "Stay Put",
//              RightText: "Move to Abe.",
//              imageName: "Abe1",
//              rightChoice: 41,
//              leftChoice: 40,
//              italic: 2
//
//            )
//          }
//        }
//        // MARK: - Next 10 Cards
//        Group {
//          // MARK: - Card 19
//          if (self.showMain == 19 || self.showMain == 9) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped,
//              flipped1: self.$flipped1,
//              cardNumber: 19,
//              MainText: "Oh them! They’ve been trying to find some “big secret” for months, I honestly don’t know where they get off.",
//              SubText: "",
//              LeftText: "What do you mean by “big secret”",
//              RightText: "Honestly they were pretty annoying",
//              imageName: "Anne1",
//              rightChoice: 39,
//              leftChoice: 38,
//              italic: 0
//
//            )
//          }
//          // MARK: - Card 18
//          if (self.showMain == 18 || self.showMain == 9) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped,
//              flipped1: self.$flipped1,
//              cardNumber: 18,
//              MainText: "Well that’s just weird. Anyhow, how are you liking your desk space? Anything you need?",
//              SubText: "",
//              LeftText: "It’s perfect - thank you for asking!",
//              RightText: "Well, I was gonna ask about that - when can I get a better one?",
//              imageName: "Anne1",
//              rightChoice: 37,
//              leftChoice: 36,
//              italic: 0
//            )
//          }
//
//          // MARK: - Card 17
//          if (self.showMain == 17 || self.showMain == 8) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped,
//              flipped1: self.$flipped1,
//              cardNumber: 17,
//              MainText: "Oh them! They’ve been trying to find some “big secret” for months, I honestly don’t know where they get off.",
//              SubText: "",
//              LeftText: "What do you mean by “big secret”",
//              RightText: "Honestly they were pretty annoying",
//              imageName: "Anne1",
//              rightChoice: 35,
//              leftChoice: 34,
//              italic: 0
//
//            )
//          }
//
//          // MARK: - Card 16
//          if (self.showMain == 16 || self.showMain == 8) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped,
//              flipped1: self.$flipped1,
//              cardNumber: 16,
//              MainText: "Well that’s just weird. Anyhow, how are you liking your desk space? Anything you need?",
//              SubText: "",
//              LeftText: "It’s perfect - thank you for asking!",
//              RightText: "Well, I was gonna ask about that - when can I get a better one?",
//              imageName: "Anne1",
//              rightChoice: 33,
//              leftChoice: 32,
//              italic: 0
//
//            )
//          }
//
//          // MARK: - Card 15
//          if (self.showMain == 15 || self.showMain == 7) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped1,
//              flipped1: self.$flipped,
//              cardNumber: 15,
//              MainText: "Are you sure you don’t want to help?",
//              SubText: "",
//              LeftText: "Fine! What do you want?",
//              RightText: "Do I need to call securtiy?",
//              imageName: "Reporter1",
//              rightChoice: 31,
//              leftChoice: 30,
//              italic: 0
//
//            )
//          }
//
//          // MARK: - Card 14
//          if (self.showMain == 14 || self.showMain == 7) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped1,
//              flipped1: self.$flipped,
//              cardNumber: 14,
//              MainText: "Wonderful! Can we step outside for this, I don’t want to attract any attention here.",
//              SubText: "",
//              LeftText: "Sure - I’ll be right with you!",
//              RightText: "I don’t think I can just walk out right now...",
//              imageName: "Reporter1",
//              rightChoice: 29,
//              leftChoice: 28,
//              italic: 0
//
//            )
//          }
//
//          // MARK: - Card 13
//          if (self.showMain == 13 || self.showMain == 6) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped1,
//              flipped1: self.$flipped,
//              cardNumber: 13,
//              MainText: "The Reporter hands you a small, black device. They start to walk out quietly.",
//              SubText: "Yes - take this letter,  read it, and take these too...",
//              LeftText: "Examine the device",
//              RightText: "Examine the letter.",
//              imageName: "LetterorBox",
//              rightChoice: 27,
//              leftChoice: 26,
//              italic: 1
//
//            )
//          }
//
//          // MARK: - Card 12
//          if (self.showMain == 12 || self.showMain == 6) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped1,
//              flipped1: self.$flipped,
//              cardNumber: 12,
//              MainText: "They take you to their car.",
//              SubText: "I’ve got two leads - the Riverside Plant and the Factory... where to?",
//              LeftText: "Sure - I’ll be right with you!",
//              RightText: "I don’t think I can just walk out right now...",
//              imageName: "Car",
//              rightChoice: 25,
//              leftChoice: 24,
//              italic: 2
//
//            )
//          }
//
//
//          // MARK: - Card 11
//          if (self.showMain == 11 || self.showMain == 5) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped1,
//              flipped1: self.$flipped,
//              cardNumber: 11,
//              MainText: "Oh - um, well,  Jake hasn’t been doing his work lately anyhow. Thankfully you’ve been ahead of schedule.",
//              SubText: "",
//              LeftText: "Yeah - Jake’s really not been pulling his weight.",
//              RightText: "Actually, Abe, it isn’t Jake. It’s me.",
//              imageName: "Abe1",
//              rightChoice: 23,
//              leftChoice: 22,
//              italic: 0
//
//            )
//          }
//
//          // MARK: - Card 10
//          if (self.showMain == 10 || self.showMain == 6) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped1,
//              flipped1: self.$flipped,
//              cardNumber: 10,
//              MainText: "Perfect!!",
//              SubText: "Abe takes you to the presentation room, and in a couple minutes, coworkers start to fill in the tables.",
//              LeftText: "Take a seat in the back, by the door.",
//              RightText: "Sit next to Abe in the front.",
//              imageName: "Meeting",
//              rightChoice: 21,
//              leftChoice: 20,
//              italic: 1
//            )
//          }
//        }// End Of Group
//
//        // MARK: - First 10 Cards
//        Group {
//          // MARK: - Card 9
//          if (self.showMain == 9 || self.showMain == 4) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped1,
//              flipped1: self.$flipped,
//              cardNumber: 9,
//              MainText: "\(self.playerName), who was that there?",
//              SubText: "",
//              LeftText: "I don’t know,  I just told them to leave",
//              RightText: "Oh, they said they was a reporter from Newspaper Inc",
//              imageName: "Anne1",
//              rightChoice: 19,
//              leftChoice: 18,
//              italic: 0
//            )
//          }
//
//          // MARK: - Card 8
//          if (self.showMain == 8 || self.showMain == 4) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped1,
//              flipped1: self.$flipped,
//              cardNumber: 8,
//              MainText: "\(self.playerName), who was that there?",
//              SubText: "",
//              LeftText: "I don’t know,  I just told them to leave",
//              RightText: "Oh, they said they was a reporter from Newspaper Inc",
//              imageName: "Anne1",
//              rightChoice: 17,
//              leftChoice: 16,
//              italic: 0
//
//            )
//          }
//
//          // MARK: - Card 7
//          if (self.showMain == 7 || self.showMain == 3) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped,
//              flipped1: self.$flipped1,
//              cardNumber: 7,
//              MainText: "Come on - I’ve worked at this case for months, please I just need one person here to work with me.",
//              SubText: "",
//              LeftText: "Alright - you’ve caught my interest.",
//              RightText: "I said no - please leave me alone.",
//              imageName: "Reporter1",
//              rightChoice: 15,
//              leftChoice: 14,
//              italic: 0
//
//            )
//          }
//
//          // MARK: - Card 6
//          if (self.showMain == 6 || self.showMain == 3) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped,
//              flipped1: self.$flipped1,
//              cardNumber: 6,
//              MainText: "You step outside the office.",
//              SubText: "I found out where they’re doing it. Can you come with me?",
//              LeftText: "Alright - you’ve caught my interest.",
//              RightText: "I said no - please leave me alone.",
//              imageName: "Reporter1",
//              rightChoice: 13,
//              leftChoice: 12,
//              italic: 1
//
//            )
//          }
//
//          // MARK: - Card 5
//          if (self.showMain == 5 || self.showMain == 2) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped,
//              flipped1: self.$flipped1,
//              cardNumber: 5,
//              MainText: "Hey! We’ve got that presentation today \(self.playerName) - I hope the boss likes what we’ve got for all this. Are you ready?",
//              SubText: "",
//              LeftText: "Heck yeah! Let’s get to it!",
//              RightText: "Actually - I was gonna ask if we can wait on that",
//              imageName: "Abe1",
//              rightChoice: 11,
//              leftChoice: 10,
//              italic: 0
//
//            )
//          }
//          // MARK: - Card 4
//          if (self.showMain == 4 || self.showMain == 2) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped1,
//              flipped1: self.$flipped,
//              cardNumber: 4,
//              MainText: "Anne is at her desk - she’s got something in her free hand while the other clicks at her keyboard.",
//              SubText: "",
//              LeftText: "What’s that, Anne?",
//              RightText: "Hey Anne!",
//              imageName: "Anne1",
//              rightChoice: 9,
//              leftChoice: 8,
//              italic: 0
//            )
//          }
//
//          // MARK: - Card 3
//          if (self.showMain == 3 || self.showMain == 1) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped1,
//              flipped1: self.$flipped,
//              cardNumber: 3,
//              MainText: "\(self.playerName) - You will not believe what I’ve got on the boss! Can we meet outside real quick?",
//              SubText: "",
//              LeftText: "You got me at the right time - let’s go!",
//              RightText: "We almost got caught last time! Can you come back tommorow?",
//              imageName: "Reporter1",
//              rightChoice: 7,
//              leftChoice: 6,
//              italic: 0
//            )
//          }
//
//          // MARK: - Card 2
//          if (self.showMain == 2  || self.showMain == 1) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped1,
//              flipped1: self.$flipped,
//              cardNumber: 2,
//              MainText: "The office is bustling - you have a project to attend to, or you could see someone else...",
//              SubText: "",
//              LeftText: "I wonder if Anne’s busy right now...",
//              RightText: "I should go finish my project with Abe!",
//              imageName: "office-desk",
//              rightChoice: 5,
//              leftChoice: 4,
//              italic: 2
//            )
//          }
//
//          // MARK: - Card 1
//          if (self.showMain == 1 || self.showMain == 0) {
//            GenericCard(
//              showMain: self.$showMain,
//              flipped: self.$flipped,
//              flipped1: self.$flipped1,
//              cardNumber: 1,
//              MainText: "Morning \(self.playerName) - you’re here early today. That solicitor, eh, the one from a week ago, they’re still here waiting for you",
//              SubText: "",
//              LeftText: "Them again! Tell them I’m busy...",
//              RightText: "Oh! Tell them I’ll be right with them.",
//              imageName: "Coffee-1",
//              rightChoice: 3,
//              leftChoice: 2,
//              italic: 0
//            )
//          }
//
//          // MARK: - Card 0
//          if (self.showMain == 0) {
//            PrimaryCard(
//              playerName: self.$playerName,
//              showMain: self.$showMain,
//              flipped: self.$flipped,
//              cardNumber: 0,
//              MainText: "Welcome to the Office Inc. Closed Beta! Thank you for helping us work on this project! We need as many eyes on this as we can get, so for real, thank you! \n- The Office Inc. Team",
//              SubText: "",
//              LeftText: "It’s honestly no worries!",
//              RightText: "Of course,  you’re welcome!",
//              imageName: "Coffee-1",
//              leftChoice: 1,
//              rightChoice: 1,
//              italic: 0
//            )
//          }
//        } // End Of Group
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
  
  static var previews: some View {
    
    Group {
      MainGame(flipped: false, playerName: .constant("Eric"), index: $index, showMain: $showMain)
        .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
        .previewDisplayName("iPhone 8")
      MainGame(flipped: false, playerName: .constant("Eric"), index: $index, showMain: $showMain)
        .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
        .previewDisplayName("iPhone 11 Pro Max")
    }
  }
}
#endif
