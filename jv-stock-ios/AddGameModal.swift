//
//  AddGameView.swift
//  jv-stock-ios
//
//  Created by Alexis Gailleton on 16/10/2023.
//

import SwiftUI

struct AddGameView: View {
    
    @State private var gameName = ""
    @State private var gameConsole = ""
    @State private var gamePrice = 0
    @State private var gameEtat = 3.0
    @State private var gameBuyedAt = Date()
    @State private var gameColor = Color.red
    
    @Binding var games:[ContentView.Game]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {        
        
        VStack(alignment: .leading) {
            Text("Ajouter un jeu")
                .font(.title)
                .bold()
            
            TextField("Nom du jeu", text: $gameName)
                .textFieldStyle(.roundedBorder)
                .accentColor(.green)

            TextField("Console", text: $gameConsole)
                .textFieldStyle(.roundedBorder)
                .accentColor(.green)

            // Stepper for price with number in center. 0 to inifiy, step 5
            Stepper(value: $gamePrice, in: 0...Int.max, step: 5) {
                TextField("Prix", value: $gamePrice, formatter: NumberFormatter())
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
            }

            Slider(value: $gameEtat, in: 1...5, step: 1)
                .accentColor(.green)
            // Mapping strings for Etat. 0 = Bad, 5 = Medium, 10 = Good
            Text(
                    gameEtat == 0 ? "Pour pièces" :
                    gameEtat == 1 ? "Mauvais état" :
                    gameEtat == 2 ? "Moyen" :
                    gameEtat == 3 ? "Bon" :
                    gameEtat == 4 ? "Très bon" :
                                    "Neuf"
                )
            
            DatePicker("Acheté le", selection: $gameBuyedAt, displayedComponents: [.date])

            ColorPicker("Couleur", selection: $gameColor)

            Button("Valider") {
                games.append(ContentView.Game(
                    name: gameName,
                    console: gameConsole,
                    price: gamePrice,
                    etat: gameEtat,
                    buyed_at: gameBuyedAt,
                    color: gameColor
                    ))
                
                gameName = ""
                gameConsole = ""
                gamePrice = 0

                dismiss()
            }

            Spacer()
        }.padding()
    }
}
