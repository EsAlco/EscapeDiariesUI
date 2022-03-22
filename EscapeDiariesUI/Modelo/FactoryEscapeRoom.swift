//
//  FactoryEscapeRoom.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 13/1/22.
//

import Foundation


struct EscapeRoomFactory{
    
    static var escapeRooms = [
        
        EscapeRoom(name: "La Nevera", image: "DaleAlCoco",calification: 6.5, past: true, featured: false),
        EscapeRoom(name: "El Bunker", image: "FoxInABox", calification: 8.7, past: true, featured: true),
        EscapeRoom(name: "Tras el espejo", image: "TheRomboCode", calification: 0.0, past: false, featured: false)
    ]
}
