//
//  StyledButton.swift
//  Gwent
//
//  Created by Александр Сенюк on 05.02.2022.
//

import SwiftUI

struct StyledButton: View {
  let text: String
  let action: () -> Void
  var isDisabled = false
  
  var body: some View {
    Button {
      action()
    } label: {
      Text(text)
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color("lightBrown"))
        .foregroundColor(Color("lightGreen"))
        .cornerRadius(10)
    }
    .disabled(isDisabled)
    .padding()
    .shadow(radius: 3)
  }
}

struct StyledButton_Previews: PreviewProvider {
  static var previews: some View {
    StyledButton(text: "Press", action: {})
  }
}
