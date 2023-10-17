//
//  SubView.swift
//  jv-stock-ios
//
//  Created by Alexis Gailleton on 16/10/2023.
//

import SwiftUI

struct GameMiniatureView: View {

    let game: ContentView.Game

    var body: some View {
        HStack() {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 80, height: 80)
                .foregroundColor(game.color)
            VStack(alignment: .leading) {
                Text(game.name)
                    .font(.title2)
                    .bold()
                Text(game.console)
                    .font(.title3)
            }
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(game.price) €")
                    .bold()
                    .foregroundColor(game.price >= 50 ? .red : game.price >= 10 ? .yellow : .green)

                Text(
                        game.etat == 0 ? "Pour pièces" :
                        game.etat == 1 ? "Mauvais état" :
                        game.etat == 2 ? "Moyen" :
                        game.etat == 3 ? "Bon" :
                        game.etat == 4 ? "Très bon" :
                                         "Neuf"
                    )
                
                Text("\(game.buyed_at)")
            }
        }
    }
}
