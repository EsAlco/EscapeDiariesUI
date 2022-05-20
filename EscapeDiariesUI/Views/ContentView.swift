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
    
    @ObservedObject var theme = Themes()
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(
                    escapeRooms.filter(shouldShowEscapeRoom).filter(searchResults),
                    id: \.id){ escapeRoom in
                        NavigationLink{
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
                        } label: {
                            EscapeRoomRow(escapeRoom: escapeRoom)
                        }
                    
                            /*.contextMenu{
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
                                    self.removeEscapeRooms(att: escapeRooms.id)
                                }label: {
                                    Label("Eliminar", systemImage: "trash")
                                }
                            }*/
                }
                    .onDelete(perform: removeEscapeRooms)
            }
            .navigationBarTitle("Salas de Escape")
            .foregroundColor(Color(red: theme.redTheme, green: theme.greenTheme, blue: theme.blueTheme))
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic), prompt: "Busdcar Escape Room")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        showAdjustmentsView.toggle()
                    } label: {
                        Image(systemName: "gear")
                            .foregroundColor(Color(red: theme.redTheme, green: theme.greenTheme, blue: theme.blueTheme))
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing){
               
                    Button{
                        showFiltersView = true
                    }label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(Color(red: theme.redTheme, green: theme.greenTheme, blue: theme.blueTheme))
                    }
                    
                    Button{
                        self.showNewEscapeRoom.toggle()
                    }label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color(red: theme.redTheme, green: theme.greenTheme, blue: theme.blueTheme))
                    }
                }
            }
            .sheet(isPresented: $showAdjustmentsView){
                AdjustmentsView()
            }
            .sheet(isPresented: $showFiltersView){
                FiltersView(
                    redTheme: $theme.redTheme,
                    greenTheme: $theme.greenTheme,
                    blueTheme: $theme.blueTheme,
                    showPastOnly: $pastOnly,
                    showFeaturedOnly: $featureOnly,
                    maxAverageRating: $maxAverageRating)
            }
            .sheet(isPresented: $showNewEscapeRoom){
                EditorNameImageView()
            }
        }
    
    }

    func setPast(item escapeRoom: EscapeRoom){
        if let idx = escapeRooms.firstIndex(where: {$0.id == escapeRoom.id}){
            escapeRooms[idx].past.toggle()
        }
    }

    func setFeatured(item escapeRoom: EscapeRoom){
        if let idx = escapeRooms.firstIndex(where: {$0.id == escapeRoom.id}){
            escapeRooms[idx].featured.toggle()
        }
    }

    func removeEscapeRooms(att offsets: IndexSet){
        for index in offsets {
            let escapeRoom = escapeRooms[index]
            managedObjectContext.delete(escapeRoom)
        }
        CoreDataManager.shared.save()
    }
    
    func shouldShowEscapeRoom(escapeRoom: EscapeRoom) -> Bool {
        let checkPast = (pastOnly && escapeRoom.past) || !pastOnly
        let checkFavorite = (featureOnly && escapeRoom.featured) || !featureOnly
        let checkPrice = (escapeRoom.averageRating <= maxAverageRating)
        
        return checkPast && checkFavorite && checkPrice
    }
    
    func searchResults(escapeRoom: EscapeRoom) -> Bool {
        
        if searchText.isEmpty {
            return true
        }
        return (((escapeRoom.name?.lowercased().contains(searchText.lowercased()))) != nil)
    }
    
    func addEscapeRoom(){
        withAnimation{
            let newEscapeRoom = EscapeRoom(context: managedObjectContext)
           
            newEscapeRoom.name = "Nombre"
            newEscapeRoom.image = "AddImage"
            newEscapeRoom.averageRating = 0
            newEscapeRoom.descriptionText = ""
            newEscapeRoom.difficulty = -1
            newEscapeRoom.lineal = -1
            newEscapeRoom.recreation = -1
            newEscapeRoom.gameMaster = -1
            newEscapeRoom.red = 0.000
            newEscapeRoom.green = 0.991
            newEscapeRoom.blue = 1.00
            
            CoreDataManager.shared.save()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



