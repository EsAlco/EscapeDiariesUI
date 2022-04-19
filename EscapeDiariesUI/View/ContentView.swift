//
//  ContentView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 16/12/21.
//

import SwiftUI
import CoreData


struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @EnvironmentObject var escapeRoomFactory: EscapeRoomFactory
    @State private var selectedEscapeRoom: EscapeRoom?
    
    @State private var searchText: String = ""
    
    @State private var showFiltersView: Bool = false
    @State private var showNewEscapeRoom: Bool = false
    @State private var showAdjustmentsView: Bool = false
    
    @State var pastOnly: Bool
    @State var favoriteOnly: Bool
    @State var maxAverageRating: Double
    
    @ObservedObject var theme = Themes()
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(escapeRoomFactory.escapeRooms.filter(shouldShowEscapeRoom)
                    .filter(searchResults),
                        id: \.id){ escapeRoom in
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
            .foregroundColor(theme.theme)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        self.showAdjustmentsView.toggle()
                    }label: {
                        Image(systemName: "gear")
                            .foregroundColor(theme.theme)
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing){
               
                    Button{
                        self.showFiltersView = true
                    }label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(theme.theme)
                    }
                    
                    Button{
                        addEscapeRoom()
                        self.showNewEscapeRoom.toggle()
                    }label: {
                        Image(systemName: "plus")
                            .foregroundColor(theme.theme)
                    }
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic), prompt: "Busdcar Escape Room")
            .sheet(isPresented: $showAdjustmentsView){
                AdjustmentsView(theme: $theme.theme)
            }
            .sheet(isPresented: $showFiltersView){
                FiltersView(theme: $theme.theme, showPastOnly: $pastOnly, showFavoriteOnly: $favoriteOnly, maxAverageRating: $maxAverageRating)
            }
            .sheet(isPresented: $showNewEscapeRoom){
                let idx = escapeRoomFactory.escapeRooms.count - 1
                EditorNameImageView(name: $escapeRoomFactory.escapeRooms[idx].name, color: $escapeRoomFactory.escapeRooms[idx].color, image: $escapeRoomFactory.escapeRooms[idx].image)
            }
            .sheet(item: $selectedEscapeRoom){ escapeRoom in
                DetailViewEscapeRoom(escapeRoom: escapeRoom,
                                     name: $escapeRoomFactory.escapeRooms[escapeRoom.id].name,
                                     image: $escapeRoomFactory.escapeRooms[escapeRoom.id].image,
                                     description: $escapeRoomFactory.escapeRooms[escapeRoom.id].description,
                                     averageRating: $escapeRoomFactory.escapeRooms[escapeRoom.id].averageRating,
                                     difficulty: $escapeRoomFactory.escapeRooms[escapeRoom.id].difficulty,
                                     lineal: $escapeRoomFactory.escapeRooms[escapeRoom.id].lineal,
                                     recreation: $escapeRoomFactory.escapeRooms[escapeRoom.id].recreation,
                                     gameMaster: $escapeRoomFactory.escapeRooms[escapeRoom.id].gameMaster,
                                     color: $escapeRoomFactory.escapeRooms[escapeRoom.id].color)
            }
            .onAppear{
                
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
    
    private func shouldShowEscapeRoom(escapeRoom: EscapeRoom) -> Bool {
        let checkPast = (pastOnly && escapeRoom.past) || !pastOnly
        let checkFavorite = (favoriteOnly && escapeRoom.featured) || !favoriteOnly
        let checkPrice = (escapeRoom.averageRating <= maxAverageRating)
        
        return checkPast && checkFavorite && checkPrice
    }
    
    private func searchResults(escapeRoom: EscapeRoom) -> Bool {
        
        if searchText.isEmpty {
            return true
        }
           return escapeRoom.name.lowercased().contains(searchText.lowercased())
    }
    
    private func addEscapeRoom(){
        withAnimation{
            let newEscapeRoom = EscapeRoom(id: (escapeRoomFactory.escapeRooms.count), name: "Nombre", image: "AddImage", averageRating: 0, description: "", difficulty: -1, lineal: -1, recreation: -1, gameMaster: -1, color: .mint)
            escapeRoomFactory.escapeRooms.append(newEscapeRoom)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(pastOnly: false, favoriteOnly: false, maxAverageRating: 5.0).environmentObject(EscapeRoomFactory())
    }
}



