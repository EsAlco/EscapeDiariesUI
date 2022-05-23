//
//  ContentView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 16/12/21.
//

import SwiftUI
import CoreData


struct ContentView: View {
     
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: EscapeRoom.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \EscapeRoom.name, ascending: true)],
        animation: .default)
    var escapeRooms: FetchedResults<EscapeRoom>
    
    @State var selectedEscapeRoom: EscapeRoom?
    
    @State var searchText: String = ""
    
    @State var showFiltersView: Bool = false
    @State var showNewEscapeRoom: Bool = false
    @State var showAdjustmentsView: Bool = false
    
    @State var pastOnly: Bool = false
    @State var featureOnly: Bool = false
    @State var maxAverageRating: Double = 5.0
    
    @State var redTheme: Double = 0.338
    @State var greenTheme: Double = 0.887
    @State var blueTheme: Double = 0.858
    
  //  @ObservedObject var theme = Themes()
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(
                    escapeRooms.filter(shouldShowEscapeRoom).filter(searchResults),
                    id: \.id){ escapeRoom in
                        EscapeRoomRow(escapeRoom: escapeRoom)
                            .onTapGesture{
                                self.selectedEscapeRoom = escapeRoom
                            }
                            .contextMenu{
                                Button {
                                    self.setFeatured(item: escapeRoom)
                                } label: {
                                    Label("Favorito", systemImage: "heart")
                                }

                                Button {
                                    self.setPast(item: escapeRoom)
                                } label: {
                                    Label("Pasado", systemImage: "checkmark.circle")
                                }

                                Button(role: .destructive) {
                                    self.removeEscapeRoom(escapeRoom)
                                }label: {
                                    Label("Eliminar", systemImage: "trash")
                                }
                            }
                        
                }
                .onDelete(perform: deleteEscapeRooms)
            }
            .foregroundColor(Color(red: redTheme, green: greenTheme, blue: blueTheme))
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic), prompt: "Busdcar Escape Room")
            .navigationBarTitle("Salas de Escape")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        showAdjustmentsView.toggle()
                    } label: {
                        Image(systemName: "gear")
                            .foregroundColor(Color(red: redTheme, green: greenTheme, blue: blueTheme))
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing){
               
                    Button{
                        showFiltersView = true
                    }label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(Color(red: redTheme, green: greenTheme, blue: blueTheme))
                    }
                    
                    Button{
                        self.showNewEscapeRoom.toggle()
                    }label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color(red: redTheme, green: greenTheme, blue: blueTheme))
                    }
                }
            }
            .sheet(item: $selectedEscapeRoom){ escapeRoom in
                DetailViewEscapeRoom(
                    name: escapeRoom.name ?? "",
                    image: escapeRoom.image ?? "AddImage",
                    descriptionText: escapeRoom.descriptionText ?? "",
                    averageRating: escapeRoom.averageRating,
                    difficulty: escapeRoom.difficulty,
                    lineal: escapeRoom.lineal,
                    recreation: escapeRoom.recreation,
                    gameMaster: escapeRoom.gameMaster,
                    featured: escapeRoom.featured,
                    past: escapeRoom.past,
                    datePast: escapeRoom.datePast ?? .now,
                    red: escapeRoom.red,
                    green: escapeRoom.green,
                    blue: escapeRoom.blue,
                    escapeRoomId: escapeRoom.objectID)
            }
            .sheet(isPresented: $showNewEscapeRoom){
                EditorNameImageView()
            }
            .sheet(isPresented: $showAdjustmentsView){
                AdjustmentsView(redTheme: $redTheme, greenTheme: $greenTheme, blueTheme: $blueTheme)
            }
            .sheet(isPresented: $showFiltersView){
                FiltersView(
                    redTheme: $redTheme,
                    greenTheme: $greenTheme,
                    blueTheme: $blueTheme,
                    showPastOnly: $pastOnly,
                    showFeaturedOnly: $featureOnly,
                    maxAverageRating: $maxAverageRating)
            }

        }
    
    }

    private func setPast(item escapeRoom: EscapeRoom){
        if let idx = escapeRooms.firstIndex(where: {$0.id == escapeRoom.id}){
            escapeRooms[idx].past.toggle()
        }
    }

    private func setFeatured(item escapeRoom: EscapeRoom){
        if let idx = escapeRooms.firstIndex(where: {$0.id == escapeRoom.id}){
            escapeRooms[idx].featured.toggle()
        
        }
    }

    private func removeEscapeRoom(_ escapeRoom: EscapeRoom) {
        withAnimation {
            managedObjectContext.delete(escapeRoom)
        }
        CoreDataManager.shared.save()
    }
    
    private func deleteEscapeRooms(att offsets: IndexSet){
        for index in offsets {
            let escapeRoom = escapeRooms[index]
            managedObjectContext.delete(escapeRoom)
        }
        CoreDataManager.shared.save()
    }
    
    private func shouldShowEscapeRoom(escapeRoom: EscapeRoom) -> Bool {
        let checkPast = (pastOnly && escapeRoom.past) || !pastOnly
        let checkFavorite = (featureOnly && escapeRoom.featured) || !featureOnly
        let checkPrice = (escapeRoom.averageRating <= maxAverageRating)
        
        return checkPast && checkFavorite && checkPrice
    }
    
    private func searchResults(escapeRoom: EscapeRoom) -> Bool {
        
        if searchText.isEmpty {
            return true
        }
        return (((escapeRoom.name?.lowercased().contains(searchText.lowercased()))) != nil)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



