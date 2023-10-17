//
//  ContentView.swift
//  jv-stock-ios
//
//  Created by Alexis Gailleton on 16/10/2023.
//

import SwiftUI

struct GamesView: View {

    @State private var games:[Game] = [
        Game(id: 1, name: "Super Mario Bros", console: "NES", edition: "PAL", region: "EUR", released_year: 1985, barcode: "045496630041", image_url: "https://cdn.mobygames.com/b26e0410-aba3-11ed-a519-02420a00019d.webp"),
        Game(id: 2, name: "Mario Kart 7", console: "3DS", edition: "PAL", region: "EUR", released_year: 2011, barcode: "045496741747", image_url: "https://cdn.mobygames.com/covers/6785923-mario-kart-7-nintendo-3ds-front-cover.jpg"),
        Game(id: 3, name: "Super Mario 3D Land", console: "3DS", edition: "PAL", region: "EUR", released_year: 2011, barcode: "045496741723", image_url: "https://cdn.mobygames.com/1ae24886-abee-11ed-897b-02420a00012d.webp"),
    ]

    struct Game {
        let id: Int
        let name: String
        let console: String
        let edition: String
        let region: String
        let released_year: Int
        let barcode: String
        let image_url: String
    }

    var body: some View {

        VStack(alignment: .leading) {

            NavigationStack {
                List {
                    ForEach(games, id: \.id) { game in
                        NavigationLink {
                            GameDetails(game: game)
                                .navigationTitle(game.name)
                        } label: {

                            AsyncImage(url: URL(string: game.image_url)!) { phase in
                                switch phase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 64, height: 64)
                                            .clipped()
                                            .cornerRadius(5)
                                    case .failure:
                                        Rectangle()
                                            .foregroundColor(.gray)
                                            .frame(width: 64, height: 64)
                                            .cornerRadius(5)
                                    @unknown default:
                                        Text("Une erreur inattendue s'est produite")
                                }
                            }
                                

                            Text(game.name)
                        }
                    }
                }
                .navigationTitle("Games")
            }
        }
    }
}
