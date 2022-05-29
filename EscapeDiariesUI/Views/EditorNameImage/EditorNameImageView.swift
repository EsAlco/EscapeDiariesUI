//
//  EditorNameImageView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 30/3/22.
//

import SwiftUI
import CoreData

struct EditorNameImageView: View {
    
    @Environment(\.managedObjectContext) private var managedObjectContext
    @Environment (\.presentationMode) var presentationMode
    
    @State var name: String
    @State var image: String
    @State var descriptionText: String
    @State var averageRating: Double
    @State var difficulty: Int16
    @State var lineal: Int16
    @State var recreation: Int16
    @State var gameMaster: Int16
    @State var featured: Bool
    @State var past: Bool
    @State var datePast: Date
    @State var red: Double
    @State var green: Double
    @State var blue: Double
    @State var nameError = false
    
    var escapeRoomId: NSManagedObjectID?
    let viewModel = AddEscapeRoomViewModel()
    
    var body: some View {
        GeometryReader{ geometry in
            NavigationView{
                Form{
                    Section(){
                        VStack{
                            ImageView(image: $image)

                            NameView(name: $name, red: $red, green: $green, blue: $blue)
                                .foregroundColor(Color(red: red, green: green, blue: blue))
                        }
                        
                    }.listRowSeparator(.hidden)
                    
                    Section(){
                        SelectorThemesView(red: $red, green: $green, blue: $blue)
                    }
                    
                    Section(){
                        SelectorImagesView(image: $image)
                    }
                    .frame(height: geometry.size.width * 0.8, alignment: .center)
                    
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            let values = EscapeRoomValues(
                                name: name,
                                image: image,
                                averageRating: averageRating,
                                descriptionText: descriptionText,
                                difficulty: difficulty,
                                lineal: lineal,
                                recreation: recreation,
                                gameMaster: gameMaster,
                                featured: featured,
                                past: past,
                                datePast: datePast,
                                red: red,
                                green: green,
                                blue: blue)
                                
                                viewModel.saveEscapeRoom(
                                    escapeRoomId: escapeRoomId,
                                    with: values,
                                    in: managedObjectContext)
                            
                            self.presentationMode.wrappedValue.dismiss()
                            
                        }label: {
                            Text("OK")
                                .foregroundColor(Color(red: red, green: green, blue: blue))
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button{
                            self.presentationMode.wrappedValue.dismiss()
                        }label: {
                            Text("Cancel")
                                .foregroundColor(Color(red: red, green: green, blue: blue))
                        }
                    }
                    
                }
                .onAppear {
                    guard
                        let objectId = escapeRoomId,
                        let escapeRoom = viewModel.fetchEscapeRoom(
                            for: objectId,
                            context: managedObjectContext)
                    else {
                        return
                    }
                    name = escapeRoom.name ?? "Desconocido"
                    image = escapeRoom.image ?? "AddImage"
                    descriptionText = escapeRoom.descriptionText ?? ""
                    averageRating = escapeRoom.averageRating
                    difficulty = escapeRoom.difficulty
                    lineal = escapeRoom.lineal
                    recreation = escapeRoom.recreation
                    gameMaster = escapeRoom.gameMaster
                    featured = escapeRoom.featured
                    past = escapeRoom.past
                    red = escapeRoom.red
                    green = escapeRoom.green
                    blue = escapeRoom.blue
                  
                }
                .frame(height: geometry.size.height)
            }
        }
    }
}

struct EditorNameImageView_Previews: PreviewProvider {
    static var previews: some View {
        EditorNameImageView(name: "La Nevera", image: "DaleAlCoco", descriptionText: "", averageRating: 0.0, difficulty: 0, lineal: 0, recreation: 0, gameMaster: 0, featured: true, past: false, datePast: .now, red: 0.986, green: 0.102, blue: 0.302)
        .preferredColorScheme(.dark)
    }
}
