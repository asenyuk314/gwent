//
//  GameModel.swift
//  Gwent
//
//  Created by Александр Сенюк on 05.02.2022.
//

import Foundation

struct GameModel {
  var turnIsFinished = false
  var turnNumber = 0
  var currentPlayer: K.playerNames = .user
  var players: [K.playerNames: PlayerManager] = [
    .user: PlayerManager(),
    .computer: PlayerManager()
  ]
  
  // MARK: - Players Information
  
  var userPower: Int {
    players[.user]!.power
  }
  var userHandCount: Int {
    players[.user]!.hand.count
  }
  var userDeckCount: Int {
    players[.user]!.deck.count
  }
  var computerPower: Int {
    players[.computer]!.power
  }
  var computerHand: [Int] {
    players[.computer]!.hand
  }
  var computerDeckCount: Int {
    players[.computer]!.deck.count
  }
  var computerSkippedTurn: Bool {
    players[.computer]!.skippedTurn
  }
  
  // MARK: - Game Information
  
  var isComputerRound: Bool {
    currentPlayer == .computer
  }
  var nextPlayer: K.playerNames {
    currentPlayer == .user ? .computer : .user
  }
  var isGameFinished: Bool {
    !turnIsFinished && (turnNumber > K.totalRounds || players.contains { _, player in
      player.score == K.roundsToWin
    })
  }
  var winner: K.playerNames {
    players[.user]!.score > players[.computer]!.score ? .user : .computer
  }
  
  // MARK: - Messages
  
  var score: String {
    "\(players[.user]!.score):\(players[.computer]!.score)"
  }
  var power: String {
    "\(K.emoji.power) \(userPower):\(computerPower)"
  }
  var finalMessage: String {
    players[.user]!.score != players[.computer]!.score
    ? "\(K.playerReadableNames[winner]!) победил"
    : "Ничья ¯\\_(ツ)_/¯"
  }
}
