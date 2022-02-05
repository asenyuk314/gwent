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
              Text(K.emoji.wolf)
                .font(.system(size: 30))
                .frame(width: 50, height: 100)
                .background(Color("darkBrown"))
                .cornerRadius(5)
                .opacity(gameManager.game.computerSkippedTurn ? 0.5 : 1)
                .padding(.vertical)
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
          CardBackView(backImage: K.emoji.power, cardNumber: gameManager.game.computerPower)
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
          CardBackView(backImage: K.emoji.power, cardNumber: gameManager.game.userPower)
        }
        HStack {
          Spacer()
          VStack {
            CardBackView(cardNumber: gameManager.game.computerDeckCount)
            Spacer()
            StyledButton(text: "Пас", action: {
              gameManager.skipTurn(for: .user)
            }, isDisabled: gameManager.game.isComputerRound)
            Spacer()
            CardBackView(cardNumber: gameManager.game.userDeckCount)
          }
        }
      }
      
      ScrollView(.horizontal) {
        LazyHStack {
          ForEach(0..<gameManager.game.userHandCount, id: \.self) { index in
            Button {
              gameManager.playCard(for: .user, at: index)
            } label: {
              ZStack {
                RoundedRectangle(cornerRadius: 5)
                  .fill(Color("lightGreen"))
                  .frame(width: 50, height: 100)
                VStack(spacing: 15) {
                  Text(K.emoji.power)
                    .font(.system(size: 12))
                  Text(gameManager.getCardPower(for: .user, at: index))
                    .foregroundColor(Color("darkBrown"))
                }
              }
            }
            .disabled(gameManager.game.isComputerRound)
            .cornerRadius(5)
            .shadow(radius: 3)
            .padding(.vertical)
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
