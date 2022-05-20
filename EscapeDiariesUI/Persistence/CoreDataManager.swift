//
//  CoreDataManager.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 9/5/22.
//

import Foundation
import CoreData


struct CoreDataManager {
    
    // MARK: Persistent Controller
    static let shared = CoreDataManager()
    
    // MARK: Persistant Containes
    let persistenceContainer: NSPersistentContainer
    
    // MARK: Preview
    static var preview: CoreDataManager = {
        let result = CoreDataManager(inMemory: true)
        let viewContest = result.persistenceContainer.viewContext
        
        for _ in 0..<3 {
            let newEscapeRoom = EscapeRoom(context: viewContest)

            newEscapeRoom.name = String()
            newEscapeRoom.image = String()
            newEscapeRoom.averageRating = Double()
            newEscapeRoom.descriptionText = String()
            newEscapeRoom.difficulty = Int16()
            newEscapeRoom.lineal = Int16()
            newEscapeRoom.recreation = Int16()
            newEscapeRoom.gameMaster = Int16()
            newEscapeRoom.featured = Bool()
            newEscapeRoom.past = Bool()
            newEscapeRoom.red = Double()
            newEscapeRoom.green = Double()
            newEscapeRoom.blue = Double()
        }
        do {
            try viewContest.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
    
    // MARK: Initalization
    init(inMemory: Bool = false){
        
        persistenceContainer = NSPersistentContainer(name: "EscapeDiariesUI")
        
        if inMemory {
            persistenceContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        persistenceContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
        persistenceContainer.viewContext.automaticallyMergesChangesFromParent = true
    }
    //MARK: Save Function
    func save(){
        let context = persistenceContainer.viewContext
        
        if context.hasChanges{
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
