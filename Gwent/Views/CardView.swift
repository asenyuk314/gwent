//
//  CardBackView.swift
//  Gwent
//
//  Created by Александр Сенюк on 05.02.2022.
//

import SwiftUI

struct CardView: View {
  var cardNumber: Int?
  var isCardBack = true
  var isSmall = true
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 5)
        .fill(Color(isCardBack ? "darkBrown" : "lightGreen"))
        .frame(width: isSmall ? 25 : 50, height: isSmall ? 50 : 100)
      VStack(spacing: isSmall ? 5 : 15) {
        Text(isCardBack ? K.cardImage.back : K.cardImage.front)
          .font(isSmall ? .caption2 : .title)
        if cardNumber != nil {
          Text(String(cardNumber!))
            .font(isSmall ? .footnote : .title3)
            .foregroundColor(Color(isCardBack ? "lightGreen" : "darkBrown"))
        }
      }
    }
    .padding(.vertical)
    .opacity(cardNumber == 0 ? 0.5 : 1)
  }
}

struct DeckView_Previews: PreviewProvider {
  static var previews: some View {
    CardView(cardNumber: 10)
  }
}
