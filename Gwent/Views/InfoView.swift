//
//  InfoView.swift
//  Gwent
//
//  Created by Александр Сенюк on 05.02.2022.
//

import SwiftUI

struct InfoView: View {
  @Environment(\.dismiss) var dismiss
  let score: String
  let power: String

  var body: some View {
    VStack {
      Text("\(K.playerReadableNames[.user]!) \(score) \(K.playerReadableNames[.computer]!)")
        .padding()
        .foregroundColor(Color("darkBrown"))
        .font(.title2)
      Text(power)
        .padding()
        .foregroundColor(Color("darkBrown"))
        .font(.title3)
      StyledButton(text: "Ок", action: {
        dismiss()
      })
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    .background(Color("lightGreen"))
  }
}

struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView(score: "0:0", power: "0:0")
  }
}
