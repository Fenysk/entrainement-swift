//
//  ContentView.swift
//  jv-stock-ios
//
//  Created by Alexis Gailleton on 16/10/2023.
//

import SwiftUI

struct GamesView: View {

    var body: some View {

        let games = [
            HomeView.Game(name: "The Legend of Zelda: Breath of the Wild", console: "Nintendo Switch", price: 50, etat: 4.5, buyed_at: Date(), color: .green),
            HomeView.Game(name: "Super Mario Odyssey", console: "Nintendo Switch", price: 50, etat: 4.5, buyed_at: Date(), color: .green),
        ]

        VStack(alignment: .leading) {
            Text("Games")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
        }
    }
}
