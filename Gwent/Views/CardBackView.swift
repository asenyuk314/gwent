//
//  CardBackView.swift
//  Gwent
//
//  Created by Александр Сенюк on 05.02.2022.
//

import SwiftUI

struct CardBackView: View {
  var backImage: String = K.emoji.wolf
  let cardNumber: Int

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 5)
        .fill(Color("darkBrown"))
        .frame(width: 25, height: 50)
      VStack {
        Text(backImage).font(.system(size: 10))
        Text(String(cardNumber))
          .font(.system(size: 14))
          .foregroundColor(Color("lightGreen"))
      }
    }
    .padding()
    .opacity(cardNumber > 0 ? 1 : 0.5)
  }
}

struct DeckView_Previews: PreviewProvider {
  static var previews: some View {
    CardBackView(cardNumber: 10)
  }
}
