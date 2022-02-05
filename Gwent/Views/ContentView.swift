//
//  ContentView.swift
//  Gwent
//
//  Created by Александр Сенюк on 05.02.2022.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var gameManager = GameManager()
  
  var body: some View {
    if gameManager.game.isGameFinished {
      FinalView(winner: gameManager.game.winner, score: gameManager.game.score, restartGame: gameManager.restartGame)
    } else {
      GameView(gameManager: .constant(gameManager))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
