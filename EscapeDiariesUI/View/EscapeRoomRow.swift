//
//  EscapeRoomRow.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 29/3/22.
//

import SwiftUI

struct EscapeRoomRow: View {
    
    @Binding var escapeRoom: EscapeRoom
    
    var body: some View {
        HStack{
            Image(escapeRoom.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(30)

            HStack{
                Text(escapeRoom.name)
                    .font(.system(.callout, design: .rounded))
                Text(String(format: "%.2f", escapeRoom.averageRating))
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer().layoutPriority(-10)
            
            //definimos los bool
            
            if escapeRoom.featured {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
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
        EscapeRoomRow(escapeRoom: .constant(EscapeRoom(id: 0, name: "La Nevera", image: "DaleAlCoco",averageRating: 3.5, past: true, featured: false, description: "", difficulty: 2, lineal: 4, recreation: 2, gameMaster: 4, color: .black)))
    }
}

        
