//
//  MainView.swift
//  jv-stock-ios
//
//  Created by Alexis Gailleton on 17/10/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            GamesView()
                .foregroundColor(.red)
                .tabItem {
                    Label("Games", systemImage: "gamecontroller")
                }
            HomeView()
                .foregroundColor(.blue)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            PurchasesView()
                .foregroundColor(.green)
                .tabItem {
                    Label("Purchases", systemImage: "cart")
                }
            SalesView()
                .foregroundColor(.yellow)
                .tabItem {
                    Label("Sales", systemImage: "dollarsign.circle")
                }

        }.accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
