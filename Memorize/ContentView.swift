//
//  ContentView.swift
//  Memorize
//
//  Created by Ben Howlett on 2022-01-19.
//

import SwiftUI

struct ContentView: View {
//    var themes = [["🚗", "🛵", "🚀", "🚂", "🛻", "🚚", "🚜", "🛺", "🚔", "✈️", "🚁", "🛸", "🛶", "⛵️", "🚛", "🏍", "🚖", "🚒", "🚐", "🛴", "🚲", "🚃", "🚈", "🚤"], ["🇨🇦", "🏳️‍🌈", "🇦🇺", "🇬🇧", "🇺🇸", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇩🇰", "🇭🇺", "🇬🇷", "🇵🇫", "🇬🇾", "🇩🇪", "🇭🇰", "🇯🇵", "🇯🇲", "🇮🇱", "🇮🇩", "🇲🇸", "🇲🇰", "🇵🇬"], ["🐒", "🐔", "🐧", "🦆", "🦅", "🦉", "🐺", "🦄", "🐝", "🦂", "🐳", "🦖", "🐫", "🐈", "🐉", "🦨", "🕊", "🦌", "🦥", "🐇"]]
    let viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) {card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        ContentView(viewModel: game)
            .previewDevice("iPhone 13 mini")
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .previewDevice("iPhone 13 Pro")
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .previewDevice("iPhone 13 Pro Max")
    }
}
