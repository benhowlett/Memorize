//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Ben Howlett on 2022-01-19.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
