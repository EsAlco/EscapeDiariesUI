//
//  Themes.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 30/3/22.
//

import Foundation
import SwiftUI

final class Themes: ObservableObject {
    
    @Published var redTheme: Double = UserDefaults.standard.double(forKey: "redTheme"){
        didSet {
            UserDefaults.standard.set(self.redTheme, forKey: "redTheme")
        }
    }

    @Published var greenTheme: Double = UserDefaults.standard.double(forKey: "greenTheme"){
        didSet {
            UserDefaults.standard.set(self.redTheme, forKey: "greenTheme")
        }
    }
    @Published var blueTheme: Double = UserDefaults.standard.double(forKey: "blueTheme"){
        didSet {
            UserDefaults.standard.set(self.redTheme, forKey: "blueTheme")
        }
    }
}

    
    
    
    
