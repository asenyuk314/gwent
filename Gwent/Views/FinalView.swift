//
//  FinalView.swift
//  Gwent
//
//  Created by Александр Сенюк on 05.02.2022.
//

import SwiftUI

struct FinalView: View {
  let message: String
  let score: String
  let restartGame: () -> Void

  var body: some View {
    VStack {
      Text(message)
        .foregroundColor(Color("darkBrown"))
        .font(.title)
      Text(score)
        .padding()
        .foregroundColor(Color("darkBrown"))
        .font(.title3)
      StyledButton(text: "Начать сначала", action: restartGame)
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    .background(Color("lightGreen"))
  }
}

struct FinalView_Previews: PreviewProvider {
  static var previews: some View {
    FinalView(message: "WIN", score: "1:0", restartGame: {})
  }
}
