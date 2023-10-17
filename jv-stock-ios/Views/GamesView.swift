//
//  ContentView.swift
//  jv-stock-ios
//
//  Created by Alexis Gailleton on 16/10/2023.
//

import SwiftUI

struct GamesView: View {

    // @State private var games:[Game] = [
    //     Game(id: 1, name: "Super Mario Bros", console: "NES", edition: "PAL", region: "EUR", released_year: 1985, barcode: "045496630041", image_url: "https://cdn.mobygames.com/b26e0410-aba3-11ed-a519-02420a00019d.webp"),
    //     Game(id: 2, name: "Mario Kart 7", console: "3DS", edition: "PAL", region: "EUR", released_year: 2011, barcode: "045496741747", image_url: "https://cdn.mobygames.com/covers/6785923-mario-kart-7-nintendo-3ds-front-cover.jpg"),
    //     Game(id: 3, name: "Super Mario 3D Land", console: "3DS", edition: "PAL", region: "EUR", released_year: 2011, barcode: "045496741723", image_url: "https://cdn.mobygames.com/1ae24886-abee-11ed-897b-02420a00012d.webp"),
    // ]

    class Game: ObservableObject {
        let id: Int
        @Published var name: String
        @Published var console: String
        @Published var edition: String
        @Published var region: String
        @Published var released_year: Int
        @Published var barcode: String
        @Published var image_url: String

        init() {
            self.id = 0
            self.name = "Super Mario Bros"
            self.console = "NES"
            self.edition = "PAL"
            self.region = "EUR"
            self.released_year = 1985
            self.barcode = "045496630041"
            self.image_url = "https://cdn.mobygames.com/b26e0410-aba3-11ed-a519-02420a00019d.webp"
        }
    }

    @StateObject var game = Game()


    var body: some View {

        VStack(alignment: .leading) {

            NavigationStack {
                List {

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
                .navigationTitle("Games")
            }
        }
    }
}
