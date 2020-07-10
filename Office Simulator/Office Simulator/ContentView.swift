//
//  ContentView.swift
//  Office Simulator
//
//  Created by Dominick Lee on 6/27/20.
//  Copyright © 2020 Domogami. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
  @State var index = 0
  @ObservedObject var player = playerObject()
  @State var oldGame = UserDefaults.standard.bool(forKey: "oldGame")
  @State var showMain = UserDefaults.standard.integer(forKey: "showMain")
  
  var body: some View {
    ZStack {
      ZStack {
        Color(#colorLiteral(red: 0.9490196078, green: 0.9647058824, blue: 1, alpha: 1))
          .edgesIgnoringSafeArea(.all)
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
          
          if (self.oldGame) {
            Button("Continue Game") {
              self.index = 1
            }
            .fixedSize(horizontal: false, vertical: true)
            .font(.system(size: 22, weight: .semibold, design: .default))
            .padding(.horizontal, 20)
            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            .frame(width: 150, height: 150)
            .background(Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            .rotationEffect(.degrees(-10))
            .offset(x: -screen.width / 6, y: 30)
            Spacer()
            
          }
          
          Button("New Game") {
            self.player.name = ""
            // For Beta
            self.showMain = 0
            UserDefaults.standard.set(self.showMain, forKey: "showMain")
            self.index = 2
          }
          .fixedSize(horizontal: false, vertical: true)
          .font(.system(size: 22, weight: .semibold, design: .default))
          .padding(.horizontal, 20)
          .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
          .frame(width: 150, height: 150)
          .background(Color(#colorLiteral(red: 0.1764705882, green: 0.3843137255, blue: 0.7843137255, alpha: 1)))
          .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
          .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
          .rotationEffect(.degrees(15))
          .offset(x: screen.width / 5, y: 0)
          .zIndex(100)
          
          Spacer()
          
          Button ("Settings") {
            self.index = 3
          }
            
          .fixedSize(horizontal: false, vertical: true)
          .font(.system(size: 22, weight: .semibold, design: .default))
          .padding(.horizontal, 20)
          .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
          .frame(width: 150, height: 150)
          .background(Color(#colorLiteral(red: 1, green: 0.9725490196, blue: 0.3019607843, alpha: 1)))
          .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
          .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
          .rotationEffect(.degrees(-5))
          .offset(x: -screen.width / 7, y: -50)
          Spacer()
          
        }
        .frame(width: screen.width * (3/4), height: screen.height / 2)
        .compositingGroup()
        .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
        
        if (index == 1) {
          MainGame(
            playerName: self.$player.name,
            index: self.$index,
            showMain: self.$showMain
          )
            .animation(Animation.easeInOut(duration: 0.5))
            .transition(.moveAndFade)
        }
        else if (index == 2) {
          VStack {
            HStack {
              Text("Resume")
                .font(.YesevaOne(size: 40))
                .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
              Spacer()
              Button(action: {
                self.index = 0
              }) {
                // How the button looks like
                Image(systemName: "xmark")
                  .font(.system(size: 30, weight: .regular, design: .default))
                  .padding(10)
                  .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
              }
            }
            HStack {
              Text("Name of Candidate")
                .font(.system(size: 20, weight: .regular, design: .default))
                .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
              Spacer()
            }
            TextField("Enter your name", text: $player.name)
              .padding(10)
              .background(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
              .font(.system(size: 16, weight: .regular, design: .default))
              .cornerRadius(15)
              .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            HStack {
              Spacer()
              Button("Continue") {
                self.index = 1
                self.oldGame = true
                UserDefaults.standard.set(self.oldGame, forKey: "oldGame")
              }
              .font(.system(size: 20, weight: .regular, design: .default))
              .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
              Image(systemName: "chevron.right")
                .font(.system(size: 20))
                .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
              
            }
            
            Spacer()
          }
          .padding()
          .frame(width: screen.width * (3/4), height: screen.height / 2)
          .compositingGroup()
          .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
          .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
          .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
          .animation(Animation.spring(response: 0.5, dampingFraction: 0.9, blendDuration: 0.5))
          .transition(.moveAndFade)
        }
        else if (index == 3){
          VStack {
            HStack {
              Text("Settings")
                .font(.YesevaOne(size: 40))
                .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
              Spacer()
              Button(action: {
                self.index = 0
              }) {
                // How the button looks like
                Image(systemName: "xmark")
                  .font(.system(size: 30, weight: .regular, design: .default))
                  .padding(10)
                  .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
              }
            }
            Spacer()
            HStack {
              Text("Setting 1")
                .font(.system(size: 20, weight: .regular, design: .default))
                .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
              Spacer()
            }
            
            
            Spacer()
          }
          .padding()
          .frame(width: screen.width * (3/4), height: screen.height / 2)
          .compositingGroup()
          .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
          .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
          .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
          .animation(Animation.spring(response: 0.5, dampingFraction: 0.9, blendDuration: 0.5))
          .transition(.moveAndFade)
        }
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
  @Binding var playerName: String
  
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
      
      Text("\(self.playerName)")
        .font(.WaitingfortheSunrise(size: 20))
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
  static func WaitingfortheSunrise(size: CGFloat) -> Font {
    Font.custom("WaitingfortheSunrise-Regular", size: size)
  }
}

struct FlipView<SomeTypeOfViewA : View, SomeTypeOfViewB : View> : View {
  
  var front : SomeTypeOfViewA
  var back : SomeTypeOfViewB
  
  @State private var flipped = false
  @Binding var showBack : Bool
  
  var body: some View {
    
    return VStack {
      Spacer()
      
      ZStack() {
        front.opacity(flipped ? 0.0 : 1.0)
        back.opacity(flipped ? 1.0 : 0.0)
      }
      .modifier(FlipEffect(flipped: $flipped, angle: showBack ? 180 : 0, axis: (x: 1, y: 0)))
      //      .onTapGesture {
      //        withAnimation(Animation.linear(duration: 1.5)) {
      //          self.showBack.toggle()
      //        }
      //      }
      //.animation(.easeInOut(duration: 1))
      Spacer()
    }
  }
}

struct FlipEffect: GeometryEffect {
  
  var animatableData: Double {
    get { angle }
    set { angle = newValue }
  }
  
  @Binding var flipped: Bool
  var angle: Double
  let axis: (x: CGFloat, y: CGFloat)
  
  func effectValue(size: CGSize) -> ProjectionTransform {
    
    DispatchQueue.main.async {
      self.flipped = self.angle >= 90 && self.angle < 270
    }
    
    let tweakedAngle = flipped ? -180 + angle : angle
    let a = CGFloat(Angle(degrees: tweakedAngle).radians)
    
    var transform3d = CATransform3DIdentity;
    transform3d.m34 = -1/max(size.width, size.height)
    
    transform3d = CATransform3DRotate(transform3d, a, axis.y, axis.x, 0)
    transform3d = CATransform3DTranslate(transform3d, -size.width/2.0, -size.height/2.0, 0)
    
    let affineTransform = ProjectionTransform(CGAffineTransform(translationX: size.width / 2.0, y: size.height / 2.0))
    
    return ProjectionTransform(transform3d).concatenating(affineTransform)
  }
}

class playerObject: ObservableObject {
  private static let userDefaultTextKey = "playerName"
  @Published var name = UserDefaults.standard.string(forKey: playerObject.userDefaultTextKey) ?? ""
  
  private var canc: AnyCancellable!
  
  init() {
    canc = $name.debounce(for: 0.2, scheduler: DispatchQueue.main).sink { newText in
      UserDefaults.standard.set(newText, forKey: playerObject.userDefaultTextKey)
    }
  }
  
  deinit {
    canc.cancel()
  }
}
