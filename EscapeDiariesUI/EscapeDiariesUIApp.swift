//
//  EscapeDiariesUIApp.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 16/12/21.
//

import SwiftUI

@main
struct EscapeDiariesUIApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView(pastOnly: false, favoriteOnly: false, maxAverageRating: 5.0).environmentObject(EscapeRoomFactory())
                
                
        }
    }
}
