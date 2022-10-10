//
//  Memory_GameApp.swift
//  Memory_Game
//
//  Created by Rita Frias on 10/6/22.
//

import SwiftUI

@main
struct Memory_GameApp: App {
    let game = AnimalMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
