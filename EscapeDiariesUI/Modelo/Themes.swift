//
//  Themes.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 30/3/22.
//

import Foundation
import SwiftUI

final class Themes: ObservableObject {
    
    @Published var theme: Color = .mint
    
    
    
    /*
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        
        defaults.register(defaults: [
            "app.view.themes.color" : Color.mint
        ])
        
    }
    
    var theme: Color{
        get{
            defaults.object(forKey: "app.view.themes.color") as! Color
        }
        set{
            defaults.set(newValue, forKey: "app.view.themes.color")
        }
    }*/
}
