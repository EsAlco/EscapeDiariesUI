//
//  FilterFactory.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 23/3/22.
//

import Foundation
import Combine

final class FiltersFactory: ObservableObject {
    
    @Published var defaults: UserDefaults
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        
        defaults.register(defaults: [
            "app.view.filters.past" : false,
            "app.view.filters.favorite" : false,
            "app.view.filters.maxAverageRating" : 5.0
        ])
        
    }
    
    var past: Bool{
        get{
            defaults.bool(forKey: "app.view.filters.past")
        }
        set{
            defaults.set(newValue, forKey: "app.view.filters.past")
        }
    }
    var favorite: Bool{
        get{
            defaults.bool(forKey: "app.view.filters.favorite")
        }
        set{
            defaults.set(newValue, forKey: "app.view.filters.favorite")
        }
    }
    var maxAverageRating: Double{
        get{
            defaults.double(forKey: "app.view.filters.maxAverageRating")
        }
        set{
            defaults.set(newValue, forKey: "app.view.filters.maxAverageRating")
        }
    }
}

