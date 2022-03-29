//
//  ContentView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 16/12/21.
//

import SwiftUI




struct ContentView: View {
    
  /*  @State var escapeRooms = ]*/
    
    @EnvironmentObject var escapeRoomFactory: EscapeRoomFactory
    @State private var selectedEscapeRoom: EscapeRoom?
    
    @State private var showFiltersView: Bool = false
   
    
    @ObservedObject var filters = FiltersFactory()
    
    private var filteredEscapeRoom: [EscapeRoom]{
        return escapeRoomFactory.escapeRooms.filter { escapeRoom in
            let checkPast = (self.filters.past && escapeRoom.past) || !self.filters.past
            let checkFavorite = (self.filters.favorite && escapeRoom.featured) || !self.filters.favorite
            let checkPrice = (escapeRoom.averageRating <= self.filters.maxAverageRating)
            return checkPast && checkFavorite && checkPrice
        }
    }
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(filteredEscapeRoom, id: \.id){ escapeRoom in
                    ZStack{
                        EscapeRoomRow(escapeRoom: $escapeRoomFactory.escapeRooms[escapeRoom.id])
                            .contextMenu{
                                Button {
                                    self.setFeatured(item: escapeRoom)
                                } label: {
                                    Label("Favorito", systemImage: "star")
                                }

                                Button {
                                    self.setPast(item: escapeRoom)
                                } label: {
                                    Label("Pasado",systemImage: "checkmark.circle")
                                }

                                Button(role: .destructive) {
                                    self.delete(item: escapeRoom)
                                }label: {
                                    Label("Eliminar", systemImage: "trash")
                                }
                            }
                            .onTapGesture {
                                self.selectedEscapeRoom = escapeRoom
                            }
                       }
                }
                .onDelete{ (indexSet) in
                    self.escapeRoomFactory.escapeRooms.remove(atOffsets: indexSet)
                }
            }
            .navigationBarTitle("Salas de Escape")
            .foregroundColor(.mint)
            
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing){
               
                    Button{
                        self.showFiltersView = true
                    }label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.mint)
                    }
                    
                    Button{
                        addEscapeRoom()
                    }label: {
                        Image(systemName: "plus")
                            .foregroundColor(.mint)
                    }
                }
            }.sheet(isPresented: $showFiltersView){
                FiltersView()
            }
            
            .sheet(item: $selectedEscapeRoom){ escapeRoom in
                DetailViewEscapeRoom(escapeRoom: escapeRoom, name: $escapeRoomFactory.escapeRooms[escapeRoom.id].name, image: $escapeRoomFactory.escapeRooms[escapeRoom.id].image, description: $escapeRoomFactory.escapeRooms[escapeRoom.id].description, averageRating: $escapeRoomFactory.escapeRooms[escapeRoom.id].averageRating, difficulty: $escapeRoomFactory.escapeRooms[escapeRoom.id].difficulty, lineal: $escapeRoomFactory.escapeRooms[escapeRoom.id].lineal, recreation: $escapeRoomFactory.escapeRooms[escapeRoom.id].recreation, gameMaster: $escapeRoomFactory.escapeRooms[escapeRoom.id].gameMaster)
            }

        }
    
    }
    private func setPast(item escapeRoom: EscapeRoom){
        if let idx = escapeRoomFactory.escapeRooms.firstIndex(where: {$0.id == escapeRoom.id}){
            escapeRoomFactory.escapeRooms[idx].past.toggle()
        }
    }
    
    private func setFeatured(item escapeRoom: EscapeRoom){
        if let idx = escapeRoomFactory.escapeRooms.firstIndex(where: {$0.id == escapeRoom.id}){
            escapeRoomFactory.escapeRooms[idx].featured.toggle()
        }
    }

    private func delete(item escapeRoom: EscapeRoom){
        if let idx = escapeRoomFactory.escapeRooms.firstIndex(where:  {
            $0.id == escapeRoom.id}){
            escapeRoomFactory.escapeRooms.remove(at: idx)
        }
    }
    
    private func addEscapeRoom(){
        withAnimation{
            let newEscapeRoom = EscapeRoom(id: (escapeRoomFactory.escapeRooms.count), name: "Nombre", image: "AddImage", averageRating: 0, description: "", difficulty: -1, lineal: -1, recreation: -1, gameMaster: -1)
            escapeRoomFactory.escapeRooms.append(newEscapeRoom)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(EscapeRoomFactory())
    }
}



