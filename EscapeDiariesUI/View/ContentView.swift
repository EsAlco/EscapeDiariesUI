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
                    ForEach(EscapeRoomFactory.escapeRooms){ escapeRoom in
                        ZStack{
                            EscapeRoomCell(escapeRoom: escapeRoom)
                            
                                .contextMenu{
                                    Button {
                                        self.setFeatured(item: escapeRoom)
                                    } label: {
                                        Label("Destacar", systemImage: "star")
                                    }

                                    Button {
                                        self.setPast(item: escapeRoom)
                                    } label: {
                                        Label(
                                        "Pasado",systemImage: "checkmark.circle")
                                    }

                                    Button {
                                        self.delete(item: escapeRoom)
                                    } label: {
                                        Label("Eliminar", systemImage: "trash")
                                    }
                                }
                                .onTapGesture {
                                    self.selectedEscape = escapeRoom
                                }
                           }
                    }
                    .onDelete{ (indexSet) in
                        EscapeRoomFactory.escapeRooms.remove(atOffsets: indexSet)
                    }
                }
                .navigationBarTitle("Salas de Escape")
                .foregroundColor(.mint)
                
                .sheet(item: self.$selectedEscape){ escapeRooms in
                    DetailViewEscapeRoom(settings: DetailFactory(), escapeRooms: escapeRooms)
                }
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing){
                        
                        NavigationLink(destination:FiltersView(filter: FilterFactory())){
                                Image(systemName: "slider.horizontal.3")
                                    .foregroundColor(.mint)
                        }
                        
                        Button{
                            //self.addRow()
                        }label: {
                            Image(systemName: "plus")
                                .foregroundColor(.mint)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading){
                        Button {
                            
                        }label: {
                            Image(systemName: "gear")
                                .foregroundColor(.mint)
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
        if let idx = EscapeRoomFactory.escapeRooms.firstIndex(where:  {
            $0.id == escapeRoom.id}){
            EscapeRoomFactory.escapeRooms.remove(at: idx)
        }
    }
    private func addRow(){
        EscapeRoomFactory.escapeRooms.append(EscapeRoom(name: "Nombre", image: "",calification: 0, past: false, featured: false))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct EscapeRoomCell: View{
    
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

