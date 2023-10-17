//
//  GameDetails.swift
//  jv-stock-ios
//
//  Created by Alexis Gailleton on 17/10/2023.
//

import SwiftUI

struct GameDetails: View {
    
    let game: GamesView.Game

    var body: some View {
            
        VStack(alignment: .leading) {
            Text(game.console)
                .font(.subheadline)
                .padding(.bottom, 5)
            Text(game.edition)
                .font(.subheadline)
                .padding(.bottom, 5)
            Text(game.region)
                .font(.subheadline)
                .padding(.bottom, 5)
            // formated date in local
            Text(String(game.released_year))
                .font(.subheadline)
                .padding(.bottom, 5)
            Text(game.barcode)
        }

        AsyncImage(url: URL(string: game.image_url)!) { phase in
            switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 256, height: 256)
                        .clipped()
                        .cornerRadius(5)
                case .failure:
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: 256, height: 256)
                        .cornerRadius(5)
                @unknown default:
                    Text("Une erreur inattendue s'est produite")
            }
        }
    }
}
