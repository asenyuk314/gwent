//
//  GameView.swift
//  Gwent
//
//  Created by Александр Сенюк on 05.02.2022.
//

import SwiftUI

struct GameView: View {
  @Binding var gameManager: GameManager
  
  var body: some View {
    VStack {
      ZStack {
        ScrollView(.horizontal) {
          LazyHStack {
            ForEach(0..<gameManager.game.computerHand.count, id: \.self) { _ in
              CardView(isSmall: false)
            }
          }
        }
        .padding(.horizontal)
        if gameManager.game.computerSkippedTurn {
          Text("Компьютер спасовал")
            .padding()
            .foregroundColor(Color("darkBrown"))
            .background(Color("lightGreen"))
            .cornerRadius(5)
        }
      }
      
      ZStack {
        VStack {
          CardView(cardNumber: gameManager.game.computerPower, isCardBack: false)
          Spacer()
          VStack {
            Text("Счёт \(gameManager.game.score)")
              .padding(.top)
              .padding(.horizontal)
              .foregroundColor(Color("darkBrown"))
            Text("Раунд \(gameManager.game.turnNumber)")
              .padding(.bottom)
              .padding(.horizontal)
              .foregroundColor(Color("darkBrown"))
          }
          .background(Color("lightGreen"))
          .cornerRadius(5)
          .padding()
          Spacer()
          CardView(cardNumber: gameManager.game.userPower, isCardBack: false)
        }
        HStack {
          Spacer()
          VStack {
            CardView(cardNumber: gameManager.game.computerDeckCount)
            Spacer()
            StyledButton(text: "Пас", action: {
              gameManager.skipTurn(for: .user)
            }, isDisabled: gameManager.game.isComputerRound)
            Spacer()
            CardView(cardNumber: gameManager.game.userDeckCount)
          }
        }
      }
      
      ScrollView(.horizontal) {
        LazyHStack {
          ForEach(0..<gameManager.game.userHandCount, id: \.self) { index in
            Button {
              gameManager.playCard(for: .user, at: index)
            } label: {
              CardView(cardNumber: gameManager.getCardPower(for: .user, at: index), isCardBack: false, isSmall: false)
            }
            .disabled(gameManager.game.isComputerRound)
            .cornerRadius(5)
            .shadow(radius: 3)
          }
        }
      }
      .padding(.horizontal)
    }
    .background(Color("darkGreen"))
    .sheet(isPresented: $gameManager.game.turnIsFinished) {
      gameManager.startNextTurn()
    } content: {
      InfoView(score: gameManager.game.score, power: gameManager.game.power)
    }
  }
}

struct GameView_Previews: PreviewProvider {
  static var previews: some View {
    GameView(gameManager: .constant(GameManager()))
  }
}
