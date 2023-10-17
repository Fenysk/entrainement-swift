//
//  ContentView.swift
//  jv-stock-ios
//
//  Created by Alexis Gailleton on 16/10/2023.
//

import SwiftUI

struct ContentView: View {

    @State private var gamesListDisplayed = false
    
    @State private var games:[Game] = []

    struct Game {
        let name: String
        let console: String
        let price: Int
        let etat: Double
        let buyed_at: Date
        let color: Color
    }

    var body: some View {
        VStack(alignment: .leading) {
            AddGameView(games: $games)


            Spacer()


            Button("Effacer les jeux") {
                games.removeAll()
            }
            
            ScrollView {
                // foreach
                ForEach(games, id: \.name) { game in
                    GameMiniatureView(game: game)
                }
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
