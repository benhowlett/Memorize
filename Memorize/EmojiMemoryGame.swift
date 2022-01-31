//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ben Howlett on 2022-01-25.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    static var vehicleTheme = Theme(name: "Vehicles", emojis: ["🚗", "🛵", "🚀", "🚂", "🛻", "🚚", "🚜", "🛺", "🚔", "✈️", "🚁", "🛸", "🛶", "⛵️", "🚛", "🏍", "🚖", "🚒", "🚐", "🛴", "🚲", "🚃", "🚈", "🚤"], numberOfPairsOfCards: 8, color: .red)
    static var flagTheme = Theme(name: "Flags", emojis: ["🇨🇦", "🏳️‍🌈", "🇦🇺", "🇬🇧", "🇺🇸", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇩🇰", "🇭🇺", "🇬🇷", "🇵🇫", "🇬🇾", "🇩🇪", "🇭🇰", "🇯🇵", "🇯🇲", "🇮🇱", "🇮🇩", "🇲🇸", "🇲🇰", "🇵🇬"], numberOfPairsOfCards: 10, color: .blue)
    static var animalTheme = Theme(name: "Animals", emojis: ["🐒", "🐔", "🐧", "🦆", "🦅", "🦉", "🐺", "🦄", "🐝", "🦂", "🐳", "🦖", "🐫", "🐈", "🐉", "🦨", "🕊", "🦌", "🦥", "🐇"], numberOfPairsOfCards: 7, color: .green)
    static var toolTheme = Theme(name: "Tools", emojis: ["🔨", "🪛", "🔧", "⛏", "🪚", "🪓", "🧲", "🧰", "🪜", "⚙️", "🧱", "🔪"], numberOfPairsOfCards: 6, color: .purple)
    static var sportsTheme = Theme(name: "Sports", emojis: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🥏", "🏒", "🏸"], numberOfPairsOfCards: 9, color: .yellow)
    static var musicTheme = Theme(name: "Music", emojis: ["🎤", "🎧", "🎼", "🎹", "🥁", "🎷", "🎺", "🪗", "🎸", "🪕", "🎻"], numberOfPairsOfCards: 10, color: .orange)
    
    static var themes: [Theme] = [vehicleTheme, flagTheme, animalTheme, toolTheme, sportsTheme, musicTheme]
    
    static var currentThemeColor: Color = .red
    static var currentThemeName: String = ""
    
    static func createMemoryGame() -> MemoryGame<String> {
        let randomThemeIndex = Int.random(in: 0..<6)
        let shuffledEmojis = themes[randomThemeIndex].emojis.shuffled()
        
        currentThemeColor = themes[randomThemeIndex].color
        currentThemeName = themes[randomThemeIndex].name
        
        if themes[randomThemeIndex].numberOfPairsOfCards > shuffledEmojis.count {
            themes[randomThemeIndex].numberOfPairsOfCards = shuffledEmojis.count
        }
        
        return MemoryGame<String>(numberOfPairsOfCards: themes[randomThemeIndex].numberOfPairsOfCards) { pairIndex in
                shuffledEmojis[pairIndex]
        }
    }
        
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func createNewGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    func getCurrentThemeColor() -> Color {
        EmojiMemoryGame.currentThemeColor
    }
    
    func getCurrentThemeName() -> String {
        EmojiMemoryGame.currentThemeName
    }
    
    func getCurrentScore() -> Int {
        model.currentScore
    }
}
