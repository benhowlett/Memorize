//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ben Howlett on 2022-01-25.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static var vehicleTheme = Theme(name: "Vehicles", emojis: ["🚗", "🛵", "🚀", "🚂", "🛻", "🚚", "🚜", "🛺", "🚔", "✈️", "🚁", "🛸", "🛶", "⛵️", "🚛", "🏍", "🚖", "🚒", "🚐", "🛴", "🚲", "🚃", "🚈", "🚤"], numberOfPairsOfCards: 8, color: .red)
    static var flagTheme = Theme(name: "Flags", emojis: ["🇨🇦", "🏳️‍🌈", "🇦🇺", "🇬🇧", "🇺🇸", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇩🇰", "🇭🇺", "🇬🇷", "🇵🇫", "🇬🇾", "🇩🇪", "🇭🇰", "🇯🇵", "🇯🇲", "🇮🇱", "🇮🇩", "🇲🇸", "🇲🇰", "🇵🇬"], numberOfPairsOfCards: 10, color: .blue)
    static var animalTheme = Theme(name: "Animals", emojis: ["🐒", "🐔", "🐧", "🦆", "🦅", "🦉", "🐺", "🦄", "🐝", "🦂", "🐳", "🦖", "🐫", "🐈", "🐉", "🦨", "🕊", "🦌", "🦥", "🐇"], numberOfPairsOfCards: 12, color: .green)
    static var toolTheme = Theme(name: "Tools", emojis: ["🔨", "🪛", "🔧", "⛏", "🪚", "🪓", "🧲", "🧰", "🪜", "⚙️", "🧱", "🔪"], numberOfPairsOfCards: 10, color: .purple)
    static var sportsTheme = Theme(name: "Sports", emojis: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🥏", "🏒", "🏸"], numberOfPairsOfCards: 8, color: .yellow)
    static var musicTheme = Theme(name: "Music", emojis: ["🎤", "🎧", "🎼", "🎹", "🥁", "🎷", "🎺", "🪗", "🎸", "🪕", "🎻"], numberOfPairsOfCards: 10, color: .orange)
    
    static var themes: [Theme] = [vehicleTheme, flagTheme, animalTheme, toolTheme, sportsTheme, musicTheme]
    
    static func createMemoryGame() -> MemoryGame<String> {
        let randomThemeIndex = Int.random(in: 0..<6)
        let shuffledEmojis = themes[randomThemeIndex].emojis.shuffled()
        
        if themes[randomThemeIndex].numberOfPairsOfCards > shuffledEmojis.count {
            themes[randomThemeIndex].numberOfPairsOfCards = shuffledEmojis.count
        }
        
        return MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
                shuffledEmojis[pairIndex]
        }
    }
        
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
