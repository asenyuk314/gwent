//
//  GameManager.swift
//  Gwent
//
//  Created by Александр Сенюк on 05.02.2022.
//

import Foundation

class GameManager: ObservableObject {
  @Published var game = GameModel()
  
  init() {
    startGame()
  }
  
  // MARK: - Game Events
  
  private func startGame() {
    for (playerName, _) in game.players {
      game.players[playerName]?.takeCards(numberOfCards: K.numberOfCardsToTakeAt.gameStart)
    }
    game.turnNumber = 1
  }
  
  func restartGame() {
    game = GameModel()
    startGame()
  }
  
  // MARK: - Turn Events
  
  private func finishTurn() {
    if game.userPower != game.computerPower {
      let roundWinner: K.playerNames = game.userPower > game.computerPower ? .user : .computer
      game.players[roundWinner]!.score += 1
    }
    game.turnIsFinished = true
  }
  
  func startNextTurn() {
    game.turnIsFinished = false
    for (playerName, _) in game.players {
      game.players[playerName]!.takeCards(numberOfCards: K.numberOfCardsToTakeAt.roundStart)
      game.players[playerName]!.power = 0
      game.players[playerName]!.skippedTurn = false
    }
    game.turnNumber += 1
    game.currentPlayer = .user
  }
  
  private func togglePlayer() {
    if !game.players[game.nextPlayer]!.skippedTurn {
      game.currentPlayer = game.nextPlayer
    } else if game.players[game.currentPlayer]!.skippedTurn {
      finishTurn()
    }
    if game.currentPlayer == .computer && !game.players[game.currentPlayer]!.skippedTurn {
      computerTurn()
    }
  }
  
  // MARK: - Players Events
  
  func playCard(for playerName: K.playerNames, at index: Int) {
    game.players[playerName]!.playCard(at: index)
    togglePlayer()
  }
  
  func skipTurn(for playerName: K.playerNames) {
    game.players[playerName]!.skippedTurn = true
    togglePlayer()
  }
  
  func getCardPower(for playerName: K.playerNames, at index: Int) -> Int {
    return game.players[playerName]!.getCardPower(at: index)
  }
  
// MARK: - Computer Events

  private func computerTurn() {
    let willPlayCard = !game.computerHand.isEmpty && Bool.random()
    if willPlayCard {
      playCard(for: .computer, at: Int.random(in: 0..<game.computerHand.count))
    } else {
      skipTurn(for: .computer)
    }
  }
}
