//
//  ContentView.swift
//  Memorize
//
//  Created by Ben Howlett on 2022-01-19.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.getCurrentThemeName())
                Spacer()
                Text("Score: \(viewModel.getCurrentScore())")
            }
            .font(.title)
            .foregroundColor(viewModel.getCurrentThemeColor())
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(viewModel.cards) {card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(viewModel.getCurrentThemeColor())
            Button {
                viewModel.createNewGame()
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
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched{
                shape.opacity(0)
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
