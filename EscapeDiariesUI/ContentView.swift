//
//  ContentView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 16/12/21.
//

import SwiftUI




struct ContentView: View {
    
    var escapeRooms = [
        EscapeRoom(name: "La Nevera", image: "DaleAlCoco"),
        EscapeRoom(name: "El Bunker", image: "FoxInABox"),
        EscapeRoom(name: "Tras el espejo", image: "TheRomboCode")
    ]
    
    var body: some View {
        NavigationView{
            List(escapeRooms.indices){ idx in
                NavigationLink(destination: DetailViewEscapeRoom(escapeRooms: self.escapeRooms[idx])){
                    if idx < 2 {
                        EscapeRoomPast(escapeRoom: self.escapeRooms[idx])
                    }else{
                        EscapeRoomNoPast(escapeRoom: self.escapeRooms[idx])
                    }
                }
            }
            
            .navigationBarTitle("Salas de Escape")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct EscapeRoom: Identifiable{
    var id = UUID()
    var name: String
    var image: String
}

struct EscapeRoomPast: View{
    var escapeRoom: EscapeRoom
    var body: some View{
        HStack{
            Image(escapeRoom.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(30)
            Text(escapeRoom.name)
                .font(.system(.callout, design: .rounded))
        }
    }
}

struct EscapeRoomNoPast: View{
    var escapeRoom: EscapeRoom
    var body: some View{
        HStack{
            Image(escapeRoom.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(30)
            Text(escapeRoom.name)
                .font(.system(.callout, design: .rounded))
                .foregroundColor(Color.red)
        }
    }
}
