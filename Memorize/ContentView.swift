//
//  ContentView.swift
//  Memorize
//
//  Created by Ben Howlett on 2022-01-19.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚗", "🛵", "🚀", "🚂", "🛻", "🚚", "🚜", "🛺", "🚔", "✈️", "🚁", "🛸", "🛶", "⛵️", "🚛", "🏍", "🚖", "🚒", "🚐", "🛴", "🚲", "🚃", "🚈", "🚤"]
    @State var emojiCount = 20
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) {emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                Spacer()
                vehicleTheme
                Spacer()
                flagTheme
                Spacer()
                animalTheme
                Spacer()
            }
            .padding(.horizontal)
            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
        }
        .padding(.horizontal)
    }
    
    var vehicleTheme: some View {
        Button {
            
        } label: {
            VStack {
                Image(systemName: "car")
                Text("Vehicles")
                    .font(.body)
            }
        }
    }
    
    var flagTheme: some View {
        Button {
            
        } label: {
            VStack {
                Image(systemName: "flag")
                Text("Flags")
                    .font(.body)
            }
        }
    }
    
    var animalTheme: some View {
        Button {
            
        } label: {
            VStack {
                Image(systemName: "pawprint")
                Text("Animals")
                    .font(.body)
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
.previewInterfaceOrientation(.portrait)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
