//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ben Howlett on 2022-01-25.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    static var vehicleTheme = Theme(name: "Vehicles", emojis: ["đ", "đľ", "đ", "đ", "đť", "đ", "đ", "đş", "đ", "âď¸", "đ", "đ¸", "đś", "âľď¸", "đ", "đ", "đ", "đ", "đ", "đ´", "đ˛", "đ", "đ", "đ¤"], numberOfPairsOfCards: 8, color: .red)
    static var flagTheme = Theme(name: "Flags", emojis: ["đ¨đŚ", "đłď¸âđ", "đŚđş", "đŹđ§", "đşđ¸", "đ´ó §ó ˘ó łó Łó ´ó ż", "đŠđ°", "đ­đş", "đŹđˇ", "đľđŤ", "đŹđž", "đŠđŞ", "đ­đ°", "đŻđľ", "đŻđ˛", "đŽđą", "đŽđŠ", "đ˛đ¸", "đ˛đ°", "đľđŹ"], numberOfPairsOfCards: 15, color: .blue)
    static var animalTheme = Theme(name: "Animals", emojis: ["đ", "đ", "đ§", "đŚ", "đŚ", "đŚ", "đş", "đŚ", "đ", "đŚ", "đł", "đŚ", "đŤ", "đ", "đ", "đŚ¨", "đ", "đŚ", "đŚĽ", "đ"], numberOfPairsOfCards: 7, color: .green)
    static var toolTheme = Theme(name: "Tools", emojis: ["đ¨", "đŞ", "đ§", "â", "đŞ", "đŞ", "đ§˛", "đ§°", "đŞ", "âď¸", "đ§ą", "đŞ"], numberOfPairsOfCards: 6, color: .purple)
    static var sportsTheme = Theme(name: "Sports", emojis: ["â˝ď¸", "đ", "đ", "âžď¸", "đž", "đĽ", "đ", "đ¸"], numberOfPairsOfCards: 9, color: .yellow)
    static var musicTheme = Theme(name: "Music", emojis: ["đ¤", "đ§", "đź", "đš", "đĽ", "đˇ", "đş", "đŞ", "đ¸", "đŞ", "đť"], numberOfPairsOfCards: 10, color: .orange)
    
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
