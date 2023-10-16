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
                .foregroundColor(.gray)
            VStack(alignment: .leading) {
                Text(game.name)
                    .font(.title2)
                    .bold()
                Text(game.console)
                    .font(.title3)
            }
            Spacer()
            // if price > 30 text is red. if between 10 and 20 text is orange. else text is green
            Text("\(game.price) €")
                .bold()
                .foregroundColor(game.price >= 50 ? .red : game.price >= 10 ? .yellow : .green)
        }
    }
}
