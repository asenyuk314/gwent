//
//  FinalView.swift
//  Gwent
//
//  Created by Александр Сенюк on 05.02.2022.
//

import SwiftUI
import AVFoundation

struct FinalView: View {
  let winner: K.playerNames?
  let score: String
  let restartGame: () -> Void
  @State private var player: AVAudioPlayer!
  
  var body: some View {
    VStack {
      Text(winner != nil ? "\(K.playerReadableNames[winner!]!) победил" : "Ничья")
        .foregroundColor(Color("darkBrown"))
        .font(.title)
      Text(score)
        .padding()
        .foregroundColor(Color("darkBrown"))
        .font(.title3)
      StyledButton(text: "Начать сначала", action: restartGame)
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    .background(Color("lightGreen"))
    .onAppear(perform: playSound)
  }
  
  private func playSound() {
    if let safeWinner = winner {
      let url = Bundle.main.url(forResource: K.soundByPlayer[safeWinner], withExtension: "wav")
      player = try! AVAudioPlayer(contentsOf: url!)
      player.play()
    }
  }
}

struct FinalView_Previews: PreviewProvider {
  static var previews: some View {
    FinalView(winner: .user, score: "1:0", restartGame: {})
  }
}
