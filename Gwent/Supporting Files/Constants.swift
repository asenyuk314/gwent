//
//  Constants.swift
//  Gwent
//
//  Created by Александр Сенюк on 05.02.2022.
//

import Foundation

struct K {
  static let roundsToWin = 2
  static let totalRounds = 3
  // [сила: количество]
  static let cardsCount = [
    6: 2,
    4: 3,
    2: 5,
    1: 10
  ]

  struct numberOfCardsToTakeAt {
    static let gameStart = 5
    static let roundStart = 3
  }
  
  enum playerNames {
    case user
    case computer
  }
  
  static let playerReadableNames: [playerNames: String] = [
    .user: "Игрок",
    .computer: "Компьютер"
  ]
  
  struct cardImage {
    static let back = "🐺"
    static let front = "⚔️"
  }
}
