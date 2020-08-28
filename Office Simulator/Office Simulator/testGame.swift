//
//  testGame.swift
//  Office Inc.
//
//  Created by Dominick Lee on 8/12/20.
//  Copyright © 2020 Domogami. All rights reserved.
//

import SwiftUI

struct testGame: View {
  @State var flipped = false
  var body: some View {
    testCard(
      showMain: .constant(0),
      flipped: true,
      cardNumber: 1,
      MainText: "I’m Isey - I work for Newspaper Inc. and I’m here on a tip, can we go outside?",
      SubText: "",
      LeftText: "I’m a little busy, can you come by later?",
      RightText: "Yeah, I’m not so busy right now",
      imageName: "coffee",
      rightChoice: 1,
      leftChoice: 1,
      italic: 0
    )
  }
}

struct testGame_Previews: PreviewProvider {
  static var previews: some View {
    testGame()
  }
}
