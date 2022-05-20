//
//  EscapeRoom.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 13/1/22.
//
/*
import Foundation
import CoreData

@objc(EscapeRoom)

public class EscapeRoom: NSManagedObject {
    
    @nonobjc
    public class func fetchRequest() -> NSFetchRequest<EscapeRoom> {
        return NSFetchRequest<EscapeRoom>(entityName: "EscapeRoom")
    }

   // @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var image: String
    @NSManaged public var averageRating: Double
    @NSManaged public var descriptionText: String
    @NSManaged public var difficulty: Int
    @NSManaged public var lineal: Int
    @NSManaged public var recreation: Int
    @NSManaged public var gameMaster: Int
    @NSManaged public var featured: Bool
    @NSManaged public var past: Bool
    @NSManaged public var red: Double
    @NSManaged public var green: Double
    @NSManaged public var blue: Double
}

extension EscapeRoom: Identifiable {}

extension EscapeRoom {
    static func generateTestEscapeRoom(in context: NSManagedObjectContext) throws {
        let names = [
        "Vacaiones",
        "La nevera",
        "Tras el espejo",
        "La entrevista",
        "El bunker",
        "Pena de muerte"
        ]
        let images = [
        "DaleAlCoco",
        "FoxInABox",
        "Incognito",
        "Cubik"]
        
        for name in names {
            let escapeRoom = EscapeRoom(context: context)
            escapeRoom.name = name
            escapeRoom.image = images.randomElement()!
            
        }
        try context.save()
    }
}

*/
