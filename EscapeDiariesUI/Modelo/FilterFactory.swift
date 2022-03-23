//
//  FilterFactory.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 23/3/22.
//

import Foundation

final class FilterFactory{
    var defaults: UserDefaults
    
    init(defaults: UserDefaults = .standard){
        self.defaults = defaults
        
        defaults.register(defaults: [
            "app.view.filters.purchased" : false,
            "app.view.filters.favorite" : false,
            "app.view.filters.averageRating" : 0
        ])
    }
    
    var purchased: Bool{
        get{
            defaults.bool(forKey: "app.view.filters.purchased")
        }
        set{
            defaults.set(newValue, forKey: "app.view.filters.purchased")
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
    var averageRating: Int{
        get{
            defaults.integer(forKey: "app.view.filters.averageRating")
        }
        set{
            defaults.set(newValue, forKey: "app.view.filters.averageRating")
        }
    }
    

}

