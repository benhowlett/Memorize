//
//  ContentView.swift
//  Memorize
//
//  Created by Ben Howlett on 2022-01-19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .stroke(lineWidth: 3)
                    
            Text("Hello, world!")
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
