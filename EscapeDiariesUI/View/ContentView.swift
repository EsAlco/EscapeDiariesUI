//
//  ContentView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 16/12/21.
//

import SwiftUI




struct ContentView: View {
    
    @State var selectedEscape: EscapeRoom?
    

    
    var body: some View {
        
        NavigationView{
            
            VStack {
                List(EscapeRoomFactory.escapeRooms){ EscapeRoom in
                   EscapeRoomPast(escapeRoom: EscapeRoom)
                       .onTapGesture {
                           self.selectedEscape = EscapeRoom
                       }
                        /*if self.escapeRooms[idx].past {
                            EscapeRoomPast(escapeRoom: self.escapeRooms[idx])
                        }else{
                            EscapeRoomNoPast(escapeRoom: self.escapeRooms[idx])
                        }*/
                    
                }.sheet(item: self.$selectedEscape){ escapeRooms in
                    DetailViewEscapeRoom(escapeRooms: escapeRooms)
                }
                .navigationBarTitle("Salas de Escape")
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
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
