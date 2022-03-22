//
//  ContentView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 16/12/21.
//

import SwiftUI




struct ContentView: View {
    
    @State private var selectedEscape: EscapeRoom?
    
    
    var body: some View {
        
        NavigationView{
            
            VStack {
                List{
                    ForEach(EscapeRoomFactory.escapeRooms){ EscapeRoom in
                        ZStack{
                            EscapeRoomPast(escapeRoom: EscapeRoom)
                            
                                .contextMenu{
                                    Button {
                                        self.setFeatured(item: EscapeRoom)
                                    } label: {
                                        HStack{
                                            Text("Destacar")
                                            Image(systemName: "star")
                                        }
                                    }

                                    Button {
                                        self.setPast(item: EscapeRoom)
                                    } label: {
                                        HStack{
                                            Text("Pasado")
                                            Image(systemName: "checkmark.circle")
                                        }
                                    }

                                    Button {
                                        self.delete(item: EscapeRoom)
                                    } label: {
                                        HStack{
                                            Text("Eliminar")
                                            Image(systemName: "trsh")
                                        }
                                    }
                                }
                                .onTapGesture {
                                    self.selectedEscape = EscapeRoom
                                }
                           }
                    }
                    .onDelete{ (indexSet) in
                        EscapeRoomFactory.escapeRooms.remove(atOffsets: indexSet)
                    }
                }
                .navigationBarTitle("Salas de Escape")
                
                .sheet(item: self.$selectedEscape){ escapeRooms in
                    DetailViewEscapeRoom(escapeRooms: escapeRooms)
                }
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing){
                        
                        NavigationLink(destination:FiltersView()){
                                Image(systemName: "slider.horizontal.3")
                                    .foregroundColor(.pink)
                        }
                        
                        Button{
                            //Añadir celdas
                        }label: {
                            Image(systemName: "plus")
                                .foregroundColor(.pink)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading){
                        Button {
                            self.showFilterView.toggle()
                        } label: {
                            Image(systemName: "gear")
                                .foregroundColor(.pink)
                        }

                    }
                    
                }

            }
        }
    }
    
    private func setFeatured(item escapeRoom: EscapeRoom){
        if let idx = EscapeRoomFactory.escapeRooms.firstIndex(where: {$0.id == escapeRoom.id}){
            EscapeRoomFactory.escapeRooms[idx].featured.toggle()
        }
    }

    private func setPast(item escapeRoom: EscapeRoom){
        if let idx = EscapeRoomFactory.escapeRooms.firstIndex(where: {$0.id == escapeRoom.id}){
            EscapeRoomFactory.escapeRooms[idx].past.toggle()
        }
    }

    private func delete(item escapeRoom: EscapeRoom){
        if let idx = EscapeRoomFactory.escapeRooms.firstIndex(where: {
            $0.id == escapeRoom.id}){
            EscapeRoomFactory.escapeRooms.remove(at: idx)
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

            HStack{
                Text(escapeRoom.name)
                    .font(.system(.callout, design: .rounded))
                Text(String(escapeRoom.calification))
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer().layoutPriority(-10)
            
            //definimos los bool
            
            if escapeRoom.featured{
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            Spacer()
            
            if escapeRoom.past{
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }
        }
    }
}

