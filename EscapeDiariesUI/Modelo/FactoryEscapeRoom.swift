//
//  FactoryEscapeRoom.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 13/1/22.
//

import Foundation


struct EscapeRoomFactory{
    
    static var escapeRooms = [
        
        EscapeRoom(name: "La Nevera", image: "DaleAlCoco"),
        EscapeRoom(name: "El Bunker", image: "FoxInABox", past: true),
        EscapeRoom(name: "Tras el espejo", image: "TheRomboCode")
    ]
}
