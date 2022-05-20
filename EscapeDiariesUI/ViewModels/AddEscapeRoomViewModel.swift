//
//  AddEscapeRoomViewModel.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 16/5/22.
//

import CoreData

struct AddEscapeRoomViewModel {
    func fetchEscapeRoom(
        for objectId: NSManagedObjectID,
        context: NSManagedObjectContext) -> EscapeRoom?
    {
        guard let escapeRoom = context.object(with: objectId) as? EscapeRoom else {
            return nil
        }
        return escapeRoom
    }
    
    func saveEscapeRoom(
        escapeRoomId: NSManagedObjectID?,
        with escapeRoomValues: EscapeRoomValues,
        in context: NSManagedObjectContext
    ){
        let escapeRoom: EscapeRoom
        if let objectId = escapeRoomId,
           let fetchedEscapeRoom = fetchEscapeRoom(for: objectId, context: context) {
            escapeRoom = fetchedEscapeRoom
        } else {
            escapeRoom = EscapeRoom(context: context)
        }
        
        escapeRoom.name = escapeRoomValues.name
        escapeRoom.image = escapeRoomValues.image
        escapeRoom.averageRating = escapeRoomValues.averageRating
        escapeRoom.descriptionText = escapeRoomValues.descriptionText
        escapeRoom.difficulty = escapeRoomValues.difficulty
        escapeRoom.lineal = escapeRoomValues.lineal
        escapeRoom.recreation = escapeRoomValues.recreation
        escapeRoom.gameMaster = escapeRoomValues.gameMaster
        escapeRoom.featured = escapeRoomValues.featured
        escapeRoom.past = escapeRoomValues.past
        escapeRoom.datePast = escapeRoomValues.datePast
        escapeRoom.red = escapeRoomValues.red
        escapeRoom.green = escapeRoomValues.green
        escapeRoom.blue = escapeRoomValues.blue
        
        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
