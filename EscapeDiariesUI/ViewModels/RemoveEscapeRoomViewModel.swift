//
//  RemoveEscapeRoomViewModel.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 16/5/22.
//

import CoreData
import SwiftUI


struct RemoveEscapeRoomViewModel {
    func removeEscapeRoom(
        att offsets: IndexSet,
        item: FetchedResults<EscapeRoom>,
        viewContext: NSManagedObjectContext
    ) {
        for index in offsets {
            let escapeRoom = item[index]
            viewContext.delete(escapeRoom)
        }
        CoreDataManager.shared.save()
    }
}
