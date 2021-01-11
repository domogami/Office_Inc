//
//  node.swift
//  Office Inc.
//
//  Created by Dominick Lee on 1/8/21.
//  Copyright © 2021 Domogami. All rights reserved.
//

import SwiftUI

class node : Codable {
    var mainText: String
    var subText: String
    var leftText: String
    var rightText: String
    var image: String
    var left: node?
    var right: node?
  
  init(mainText: String, subText: String, leftText: String, rightText: String, image: String, left: node?, right: node?) {
      self.mainText = mainText
      self.subText = subText
      self.leftText = leftText
      self.rightText = rightText
      self.image = image
      self.left = left
      self.right = right
      
    }
}
