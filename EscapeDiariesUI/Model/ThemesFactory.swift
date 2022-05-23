//
//  ThemesFactory.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 23/5/22.
//

import Foundation


final class ThemesFactory: ObservableObject {
    
    @Published var pastOnly: Bool = UserDefaults.standard.bool(forKey: "pastOnly"){
        didSet {
            UserDefaults.standard.set(self.pastOnly, forKey: "pastOnly")
        }
    }
    
    @Published var featuredOnly: Bool = UserDefaults.standard.bool(forKey: "featuredOnly"){
        didSet {
            UserDefaults.standard.set(self.featuredOnly, forKey: "featuredOnly")
        }
    }
    
    @Published var maxAverageRating: Bool = UserDefaults.standard.bool(forKey: "maxAverageRating"){
        didSet {
            UserDefaults.standard.set(self.maxAverageRating, forKey: "maxAverageRating")
        }
    }
}
