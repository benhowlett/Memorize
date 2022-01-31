//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Ben Howlett on 2022-01-19.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            HStack {
                Text(game.getCurrentThemeName())
                Spacer()
                Text("Score: \(game.getCurrentScore())")
            }
            .font(.title)
            .foregroundColor(game.getCurrentThemeColor())
//            ScrollView {
//                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
//                    ForEach(game.cards) {card in
            
            AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
                CardView(card: card)
                    .onTapGesture {
                        game.choose(card)
                }
                .padding(4)
            })
                        
//                    }
//                }
//            }
            .foregroundColor(game.getCurrentThemeColor())
            Button {
                game.createNewGame()
            } label: {
                Text("New Game")
                    .font(.title)
            }
        }
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Pie(startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 20)).opacity(DrawingConstants.pieOpacity).padding(4)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched{
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.65
        static let pieOpacity: CGFloat = 0.5
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
            .previewDevice("iPhone 13 mini")
            .preferredColorScheme(.light)
//        EmojiMemoryGameView(game: game)
//            .previewDevice("iPhone 13 Pro")
//            .preferredColorScheme(.dark)
//        EmojiMemoryGameView(game: game)
//            .previewDevice("iPhone 13 Pro Max")
//        EmojiMemoryGameView(game: game)
//            .previewDevice("iPhone SE (2nd generation)")
//        EmojiMemoryGameView(game: game)
//            .previewDevice("iPhone 8")
//        EmojiMemoryGameView(game: game)
//            .previewDevice("iPhone 8 Plus")
    }
}
