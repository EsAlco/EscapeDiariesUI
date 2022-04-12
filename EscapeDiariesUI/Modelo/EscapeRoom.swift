//
//  EscapeRoom.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 13/1/22.
//

import Foundation
import SwiftUI

struct EscapeRoom: Identifiable {
    //var id = UUID()
    var id: Int
    var name: String
    var image: String
    var averageRating: Double
    var past = false
    var featured = false
    var description: String
    var difficulty: Int
    var lineal: Int
    var recreation: Int
    var gameMaster: Int
    var color: Color
}
