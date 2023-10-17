//
//  ContentView.swift
//  jv-stock-ios
//
//  Created by Alexis Gailleton on 16/10/2023.
//

import SwiftUI

struct HomeView: View {

    @State private var gamesListDisplayed = false
    @State private var newGameModalDisplayed = false
    
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
            Text("Jeux en stock")
                .font(.title)
                .fontWeight(.bold)
            
            Button("Créer un nouveau jeu") {
                newGameModalDisplayed.toggle()                
            }.sheet(isPresented: $newGameModalDisplayed) {
                    AddGameModal(games: $games)
                }

            Button("Effacer les jeux") {
                games.removeAll()
            }
            
            if(games.count > 0) {
                List(games, id: \.name) { game in
                    GameMiniatureView(game: game)
                }
            }
        }
    }
}
