//
//  testGame.swift
//  Office Inc.
//
//  Created by Dominick Lee on 8/12/20.
//  Copyright © 2020 Domogami. All rights reserved.
//

import SwiftUI
import Foundation
import Combine

struct testGame: View {
  // JSON API call to get data
  @ObservedObject var store = FetchNodes()
  @State var flipped = false
  var body: some View {
    testCard(
      showMain: .constant(0),
      flipped: true,
      cardNumber: 1,
      MainText: store.nodes[0].mainText,
      SubText: store.nodes[0].subText,
      LeftText: store.nodes[0].leftText,
      RightText: store.nodes[0].rightText,
      imageName: store.nodes[0].image,
      rightChoice: 1,
      leftChoice: 1,
      italic: 0
    ).onAppear(perform: {
      
      print(store.nodes[0].left!.mainText)
    })
  }
}

struct testGame_Previews: PreviewProvider {
  static var previews: some View {
    testGame(
      flipped: true
    )
  }
}

class FetchNodes: ObservableObject {
  // 1.
  @Published var nodes = [node]()
     
    init() {
      do {
        if let path = Bundle.main.path(forResource: "story", ofType: "json") {
            let file = URL(fileURLWithPath: path)
            let data = try Data(contentsOf: file)
            let decoder = JSONDecoder()
          let nodedata : [node] = try! decoder.decode([node].self, from: data)
            nodes = nodedata
        }
      }
      catch {
        print(error)
      }
//      if let path = Bundle.main.path(forResource: "story", ofType: "json") {
//        let file = URL(fileURLWithPath: path)
//        print(file)
//        URLSession.shared.dataTask(with: file) {(data, response, error) in
//
//            do {
//                if let nodeData = data {
//                    // 3.
//
//                    let decodedData = try JSONDecoder().decode([node].self, from: nodeData)
//                    DispatchQueue.main.async {
//                        self.nodes = decodedData
//                      print(decodedData)
//                    }
//                } else {
//                    print("No data")
//                }
//            } catch {
//                print("Error with node shit")
//            }
//        }.resume()
//      }
        
    }
}
