//
//  ContentView.swift
//  Office Simulator
//
//  Created by Dominick Lee on 6/27/20.
//  Copyright © 2020 Domogami. All rights reserved.
//

import SwiftUI
import Combine
import AVKit

struct ContentView: View {
  @State var index = 0
  @State var oldGame = true
    //UserDefaults.standard.bool(forKey: "oldGame")
  @State var showMain = UserDefaults.standard.integer(forKey: "showMain")
  @State var musicToggle = UserDefaults.standard.bool(forKey: "music")
  @State var titlePlayer: AVAudioPlayer!
  @ObservedObject var player = playerObject()
  
  var body: some View {
    ZStack {
      ZStack {
        Color(#colorLiteral(red: 0.9490196078, green: 0.9647058824, blue: 1, alpha: 1))
        //        Color(#colorLiteral(red: 0.5203282833, green: 0.6935389042, blue: 0.7111260891, alpha: 1))
        
        //Color(#colorLiteral(red: 0.8666666667, green: 0.8470588235, blue: 0.8352941176, alpha: 1))
        //Color(#colorLiteral(red: 0.8352941176, green: 0.8196078431, blue: 0.9098039216, alpha: 1))
          .edgesIgnoringSafeArea(.all)
          .onTapGesture {
            self.hideKeyboard()
          }
        VStack {
          HStack {
            Spacer()
            Coffee()
              .scaleEffect(screen.height / 1300)
              .offset(x: (screen.height < 700) ? -10 : 20, y: (screen.height < 700) ? 30 : -30)
              .rotationEffect(.degrees(180))
              .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
              .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
          }
          Spacer()
        }
        .edgesIgnoringSafeArea(.top)
        // Background Card slightly rotated
        VStack {
          Spacer()
        }
        .frame(width: screen.width * (3/4), height: (screen.height < 700) ? 400 : 450)
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
        .rotationEffect(.degrees(-5))
        
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
          Spacer()
        }
        .frame(width: screen.width * (3/4), height: (screen.height < 700) ? 400 : 450)
        .compositingGroup()
        .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
        
        ZStack {
          if (self.oldGame) {
            Button("Continue Game") {
              self.index = 1
              self.simpleSuccess()
            }
            .fixedSize(horizontal: false, vertical: true)
            .font(.system(size: 22, weight: .semibold, design: .default))
            .padding(.horizontal, 20)
            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            .frame(width: screen.width * (2/5), height: screen.width * (2/5))
            .background(Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            .rotationEffect(.degrees(-10))
            .offset(x: -screen.width / 7, y: -50)
            Spacer()
          }
          
          Button("New Game") {
            self.player.name = ""
            self.showMain = 0
            UserDefaults.standard.set(self.showMain, forKey: "showMain")
            self.index = 2
            self.simpleSuccess()
          }
          .fixedSize(horizontal: false, vertical: true)
          .font(.system(size: 22, weight: .semibold, design: .default))
          .padding(.horizontal, 20)
          .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
          .frame(width: screen.width * (2/5), height: screen.width * (2/5))
          .background(Color(#colorLiteral(red: 0.1764705882, green: 0.3843137255, blue: 0.7843137255, alpha: 1)))
          .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
          .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
          .rotationEffect(.degrees(15))
          .offset(x: screen.width / 6, y: self.oldGame ? 40 : -20)
          .zIndex(100)
          
          Spacer()
          
          Button ("Settings") {
            self.index = 3
            self.simpleSuccess()
          }
          
          .fixedSize(horizontal: false, vertical: true)
          .font(.system(size: 22, weight: .semibold, design: .default))
          .padding(.horizontal, 20)
          .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
          .frame(width: screen.width * (2/5), height: screen.width * (2/5))
          .background(Color(#colorLiteral(red: 1, green: 0.9725490196, blue: 0.3019607843, alpha: 1)))
          .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
          .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
          .rotationEffect(.degrees(-20))
          .offset(x: -screen.width / 6, y: self.oldGame ? 130 : 60)
          Spacer()
        }
        
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
            Spacer()
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
            .padding(.horizontal, 10)
            HStack {
              Text("Name of Candidate")
                .font(.system(size: 20, weight: .regular, design: .default))
                .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
              Spacer()
            }.padding(.horizontal, 10)
            CustomTextField(
              placeholder: Text("Enter your name").foregroundColor(Color(#colorLiteral(red: 0.5490196078, green: 0.5490196078, blue: 0.5490196078, alpha: 1))),
              text: self.$player.name
            )
            .padding(10)
            .frame(maxWidth: screen.width * (3/4) - 40)
            .background(Color(#colorLiteral(red: 0.8705882353, green: 0.8705882353, blue: 0.8705882353, alpha: 1)))
            .font(.system(size: 16, weight: .regular, design: .default))
            .cornerRadius(25)
            .padding(.vertical, 10)
            .foregroundColor(Color.black)
            Spacer()
            
            ZStack {
              RoundedRectangle(cornerRadius: 20)
                .padding(.trailing, screen.width / 3)
                .padding(.horizontal, 5)
                .frame(height: 15)
                .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
                .padding(.vertical, 10)
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
              
            }
            Spacer()
            Group {
              
              RoundedRectangle(cornerRadius: 20)
                .padding(.horizontal, 5)
                .frame(height: 15)
                .foregroundColor(Color(#colorLiteral(red: 0.8705882353, green: 0.8705882353, blue: 0.8705882353, alpha: 1)))
                .padding(.vertical, 10)
              
              RoundedRectangle(cornerRadius: 20)
                .padding(.trailing, screen.width / 3)
                .padding(.horizontal, 5)
                .frame(height: 15)
                .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
                .padding(.vertical, 10)
              
              RoundedRectangle(cornerRadius: 20)
                .padding(.horizontal, 5)
                .frame(height: 15)
                .foregroundColor(Color(#colorLiteral(red: 0.8705882353, green: 0.8705882353, blue: 0.8705882353, alpha: 1)))
                .padding(.vertical, 10)
              
              
            }
            
            Spacer()
            
          }
          .onTapGesture {
            self.hideKeyboard()
          }
          .padding()
          .frame(width: screen.width * (3/4), height: (screen.height < 700) ? 400 : 450)
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
            .padding(.horizontal, 10)
            Spacer()
            HStack {
              Text("Music")
                .font(.system(size: 20, weight: .regular, design: .default))
                .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
              Spacer()
              Button(action: {
                self.musicToggle.toggle()
                if(self.musicToggle) {
                  self.titlePlayer.pause()
                } else {
                  self.titlePlayer.play()
                }
              }) {
                Text(!self.musicToggle ? "On" : "off")
                  .font(.system(size: 20, weight: .regular, design: .default))
                  .foregroundColor(self.musicToggle ? Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)) : Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
              }
              .padding(.horizontal, 30)
              .padding(.vertical, 10)
              .background(self.musicToggle ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1019607843, green: 0.1294117647, blue: 0.3176470588, alpha: 1)))
              .cornerRadius(20)
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
    .onAppear {
      let sound = Bundle.main.path(forResource: "TitleTheme", ofType: "mp3")
      self.titlePlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
      if (!self.musicToggle) {
        self.titlePlayer.play()
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
    Group {
      ContentView()
        .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
        .previewDisplayName("iPhone 8")
      
      ContentView()
        .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
        .previewDisplayName("iPhone 11 Pro Max")
    }
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
        .font(.custom("WaitingfortheSunrise", size: 30))
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
          .animation(Animation.easeInOut(duration: 0.1).delay(0.1))
        back.opacity(flipped ? 1.0 : 0.0)
          .animation(Animation.easeInOut(duration: 0.1).delay(0.1))
      }
      .modifier(FlipEffect(flipped: $flipped, angle: showBack ? 180 : 0, axis: (x: 1, y: 0)))
//            .onTapGesture {
//              withAnimation(Animation.linear(duration: 0.5)) {
//                self.showBack.toggle()
//              }
//            }
      .animation(.easeInOut(duration: 0.6))
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

struct CustomTextField: View {
  var placeholder: Text
  @Binding var text: String
  var editingChanged: (Bool)->() = { _ in }
  var commit: ()->() = { }
  
  var body: some View {
    ZStack(alignment: .leading) {
      if text.isEmpty { placeholder }
      TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
    }
  }
}

#if canImport(UIKit)
extension View {
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
#endif
