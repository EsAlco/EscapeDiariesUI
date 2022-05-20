//
//  EscapeDiariesUIApp.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 16/12/21.
//

import SwiftUI

@main
struct EscapeDiariesUIApp: App {
    
    let persistenceController = CoreDataManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,persistenceController.persistenceContainer.viewContext)
        }
    }
}


