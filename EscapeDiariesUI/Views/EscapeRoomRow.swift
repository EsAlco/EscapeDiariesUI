//
//  EscapeRoomRow.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 29/3/22.
//

import SwiftUI

struct EscapeRoomRow: View {
    
    @Environment(\.managedObjectContext) private var managedObjectContext
    
    @ObservedObject var escapeRoom: EscapeRoom

    var body: some View {
        HStack{

            Image(escapeRoom.image ?? "AddImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(10)
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(30)

            HStack{
                Text(escapeRoom.name ?? "Desconocido")
                    .font(.system(.callout, design: .rounded))
                Text(String(format: "%.2f", escapeRoom.averageRating))
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer().layoutPriority(-10)
            
            //definimos los bool
            if escapeRoom.featured {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
            Spacer()
            
            if escapeRoom.past {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }
            
        }
    }
}

struct EscapeRoomRow_Previews: PreviewProvider {
    static var previews: some View {
        EscapeRoomRow(escapeRoom: getEscapeRoom())
    }
    
    static func getEscapeRoom() -> EscapeRoom {
        let escapeRoom = EscapeRoom(context: CoreDataManager(inMemory: true).persistenceContainer.viewContext)
        
        escapeRoom.name = "La Nevera"
        escapeRoom.image = "DaleAlCoco"
        escapeRoom.averageRating = 4.5
        escapeRoom.featured = true
        escapeRoom.past = true
        escapeRoom.red = 0.986
        escapeRoom.green = 0.102
        escapeRoom.blue = 0.302
        
        return escapeRoom
    }
}

        
