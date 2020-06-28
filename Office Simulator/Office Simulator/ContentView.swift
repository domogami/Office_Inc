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
  @State var choice = -1
  
    var body: some View {
      ZStack {
        Color(#colorLiteral(red: 0.9490196078, green: 0.9647058824, blue: 1, alpha: 1))
          .edgesIgnoringSafeArea(.all)
        VStack {
          HStack {
            Text("Office Simulator")
            .font(.system(size: 35, weight: .bold, design: .default))
            .padding(20)
            Spacer()
          }
          Spacer()
        }
        

        VStack {
          Text("Get Back To Work")
        }
        .frame(width: 200, height: 200)
        .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
        .cornerRadius(50)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
        .offset(y: viewState.height/4)
        .offset(x: viewState.width > 150 ? 1 : 200)
        .opacity(viewState.width > 150 ? 1: 0)
        .animation(.easeInOut)
        
        
        VStack {
          Text("Grab a Cup of Coffee")
        }
        .frame(width: 200, height: 200)
        .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
        .cornerRadius(50)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
        .offset(y: viewState.height/4)
        .offset(x: viewState.width < -150 ? 1 : -200)
        .scaleEffect(viewState.width < -150 ? 1 : 0)
        .opacity(viewState.width < -150 ? 1: 0)
        .animation(.easeInOut)

        // Card
        VStack {
          HStack {
            Text("Hello World")
              .font(.system(size: 30, weight: .semibold, design: .default))
              .padding(30)
            
            Spacer()
          }
          Spacer()

          LottieView()
            .offset(x:-20, y: -50)
           
          Spacer()
        }
        .frame(width: screen.width * (3/4), height: screen.height / 2)
        .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
        .cornerRadius(50)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
        .offset(x: viewState.width, y: viewState.height)
        
        .gesture(
            DragGesture().onChanged { value in
                self.viewState = value.translation
            }
            .onEnded { value in
              if (self.viewState.width < -150) {
                self.choice = 0
                self.viewState.width = -800
              }
              else if (self.viewState.width > 150) {
                self.choice = 1
                self.viewState.width = 800
              }
              else {
                self.viewState = .zero
              }
            }
        )
        .animation(.spring())
        
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

let screen = UIScreen.main.bounds

