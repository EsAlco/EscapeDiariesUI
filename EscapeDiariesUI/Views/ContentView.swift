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
                  sortDescriptors: [NSSortDescriptor(keyPath: \EscapeRoom.name, ascending: true)])
    var escapeRooms: FetchedResults<EscapeRoom>
    
    var searchQuery: Binding<String> {
        Binding {
            searchText
        } set: { newValue in
            searchText = newValue
            
            guard !newValue.isEmpty else {
                escapeRooms.nsPredicate = nil
                return
            }
            escapeRooms.nsPredicate = NSPredicate(format: "name CONTAINS[cd] %@", newValue)
        }
    }
    
    @State var selectedEscapeRoom: EscapeRoom?
    @State var editEscapeRoom: EscapeRoom?
    
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
    
    
    var body: some View {
        
        UITableView.appearance().backgroundColor = .clear
        
        return NavigationView{
            ZStack{
                Image(redTheme == 0.338 ? "EscapeDiariesUIMint" : redTheme == 0.986 ? "EscapeDiariesUIPink" : "EscapeDiariesUIYellow")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.2)
                List{
                ForEach(
                    escapeRooms.filter(shouldShowEscapeRoom),
                    id: \.id){ escapeRoom in
                        EscapeRoomRow(escapeRoom: escapeRoom)
                            .foregroundColor(Color(red: escapeRoom.red, green: escapeRoom.green, blue: escapeRoom.blue))
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
                            .swipeActions{
                                Button(role: .destructive) {
                                    self.removeEscapeRoom(escapeRoom)
                                } label: {
                                    Image(systemName: "trash")
                                }
                                Button {
                                    self.editInfoEscapeRoom(item: escapeRoom)
                                } label: {
                                    Image(systemName: "info.circle.fill")
                                }.tint(.yellow)
                            }
                            .swipeActions(edge: .leading, allowsFullSwipe: false) {
                                Button {
                                    self.setFeatured(item: escapeRoom)
                                } label: {
                                    Image(systemName: escapeRoom.featured ? "heart.slash.fill" : "heart")
                                }.tint(.red)

                                Button {
                                    self.setPast(item: escapeRoom)
                                } label: {
                                    Image(systemName: escapeRoom.past ? "xmark.circle" : "checkmark.circle")
                                }.tint(.green)
                            }
                }
            }
                .searchable(text: searchQuery, placement: .navigationBarDrawer(displayMode: .automatic), prompt: "Busdcar Escape Room")
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
                    NewEscapeRoomView()
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
                .sheet(item: $editEscapeRoom) { escapeRoom in
                    EditorNameImageView(
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
    
    private func editInfoEscapeRoom(item escapeRoom: EscapeRoom){
        if let idx = escapeRooms.firstIndex(where: {$0.id == escapeRoom.id}){
            editEscapeRoom = escapeRooms[idx]
        }
    }

    private func removeEscapeRoom(_ escapeRoom: EscapeRoom) {
        withAnimation {
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
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}



