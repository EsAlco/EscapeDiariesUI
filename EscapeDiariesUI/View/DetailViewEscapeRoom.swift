//
//  DetailViewEscapeRoom.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 21/12/21.
//

import SwiftUI

struct DetailViewEscapeRoom: View {
    
    var escapeRooms: EscapeRoom
    
    var body: some View {
        VStack{
            Text(escapeRooms.name)
                .padding()
                .font(.system(.title, design: .rounded))

            Image(escapeRooms.image)
            Spacer()
        }
    }
}

struct DetailViewEscapeRoom_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewEscapeRoom(escapeRooms: EscapeRoom(name:"La Nevera", image: "DaleAlCoco"))
    }
}
