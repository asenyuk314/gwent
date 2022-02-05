//
//  PlayerManager.swift
//  Gwent
//
//  Created by Александр Сенюк on 05.02.2022.
//

import Foundation

struct PlayerManager {
  var score = 0
  var power = 0
  var skippedTurn = false
  var deck: [Int] = []
  var hand: [Int] = []
  
  init() {
    shuffleCards()
  }
  
// MARK: - Cards Events
  
  private mutating func shuffleCards() {
    var newDeck: [Int] = []
    K.cardsCount.forEach { cardPower, cardCount in
      newDeck += Array(repeating: cardPower, count: cardCount)
    }
    deck = newDeck.shuffled()
    hand = []
  }
  
  mutating func takeCards(numberOfCards: Int) {
    let possibleCardsToTake = min(numberOfCards, deck.count)
    hand += deck[0..<possibleCardsToTake]
    deck = Array(deck[possibleCardsToTake..<deck.count])
  }
  
  mutating func playCard(at index: Int) {
    let cardPower = hand[index]
    hand.remove(at: index)
    power += cardPower
  }
  
  func getCardPower(at index: Int) -> Int {
    return hand[index]
  }
}
