//
//  ContentView.swift
//  jv-stock-ios
//
//  Created by Alexis Gailleton on 16/10/2023.
//

import SwiftUI

struct ContentView: View {

    struct Game {
        let name: String
        let console: String
        let price: Int
    }
    
    let games:[Game] = [
        Game(name: "The Legend of Zelda: OOT", console: "N64", price: 60),
        Game(name: "Super Mario Sunshine", console: "GameCube", price: 50),
        Game(name: "The Legend of Zelda: BOTW", console: "Switch", price: 30),
        Game(name: "The Last of Us", console: "PS4", price: 5),
    ]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Jeux vidéo en stock")
                .font(.title)
                .bold()
                .padding(.bottom, 20)
            ForEach(games, id: \.name) { game in
                GameMiniatureView(game: game)
            }
        }.padding()
    }
}

// #Preview {
//     ContentView()
// }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
