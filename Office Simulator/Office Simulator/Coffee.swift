//
//  Coffee.swift
//  Office Simulator
//
//  Created by Dominick Lee on 7/5/20.
//  Copyright © 2020 Domogami. All rights reserved.
//

import SwiftUI

struct Coffee: View {
    var body: some View {
      ZStack {
        
        Rectangle()
        .frame(width: 30, height: 100)
        .cornerRadius(15)
        .foregroundColor(Color(#colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)))
        .rotationEffect(.degrees(45))
        .offset(x: -75,y: 75)
        
        Circle()
          .frame(width: 200, height: 200)
          .foregroundColor(.white)
        
        Circle()
          .frame(width: 170, height: 170)
          .foregroundColor(Color(#colorLiteral(red: 0.4470588235, green: 0.2784313725, blue: 0.02745098039, alpha: 1)))
        
        Circle()
          .frame(width: 140, height: 140)
          .foregroundColor(Color(#colorLiteral(red: 0.3411764706, green: 0.2117647059, blue: 0.01960784314, alpha: 1)))
          .offset(x:-5,y:-5)
        Circle()
        .frame(width: 150, height: 150)
          .foregroundColor(Color(#colorLiteral(red: 0.4470588235, green: 0.2784313725, blue: 0.02745098039, alpha: 1)))
          .offset(x:5,y:5)
        
      }
    }
}

struct Coffee_Previews: PreviewProvider {
    static var previews: some View {
        Coffee()
    }
}
