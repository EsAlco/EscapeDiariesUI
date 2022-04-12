//
//  EscapeRoomFactory.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 13/1/22.
//

import Foundation


final class EscapeRoomFactory: ObservableObject {
    
    @Published var escapeRooms: [EscapeRoom] = //[]
    [
        EscapeRoom(id: 0, name: "La Nevera", image: "DaleAlCoco",averageRating: 3.5, past: true, featured: false, description: "", difficulty: 2, lineal: 4, recreation: 2, gameMaster: 4, color: .mint),
        EscapeRoom(id: 1, name: "El Bunker", image: "FoxInABox", averageRating: 4.7, past: true, featured: true, description: "", difficulty: 3, lineal: 1, recreation: 5, gameMaster: 3, color: .pink),
        EscapeRoom(id: 2, name: "Tras el espejo", image: "TheRomboCode", averageRating: 1.0, past: false, featured: false, description: "", difficulty: 4, lineal: 3, recreation: 5, gameMaster: 3, color: .yellow)
    ]
    
    }
