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
    
    //@ObservedObject var escapeRoom: EscapeRoom
    
    @State var name: String = "Nombre"
    @State var image: String = "AddImage"
    @State var red: Double = 0.338
    @State var green: Double = 0.887
    @State var blue: Double = 0.858
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
                            // if escapeRoomId == nil {
                                let values = EscapeRoomValues(
                                    name: name,
                                    image: image,
                                    averageRating: 0.00,
                                    descriptionText: "",
                                    difficulty: -1,
                                    lineal: -1,
                                    recreation: -1,
                                    gameMaster: -1,
                                    featured: false,
                                    past: false,
                                    datePast: Date.now,
                                    red: red,
                                    green: green,
                                    blue: blue)
                                
                                viewModel.saveEscapeRoom(
                                    escapeRoomId: escapeRoomId,
                                    with: values,
                                    in: managedObjectContext)
                                /*
                            } else {
                            let values = EscapeRoomValues(
                                name: name,
                                image: image,
                                averageRating: escapeRoomId.averageRating,
                                descriptionText: escapeRoomId.descriptionText ?? "",
                                difficulty: escapeRoomId.difficulty,
                                lineal: escapeRoomId.lineal,
                                recreation: escapeRoomId.recreation,
                                gameMaster: escapeRoomId.gameMaster,
                                featured: escapeRoomId.featured,
                                past: escapeRoomId.past,
                                datePast: escapeRoomId.datePast ?? . now,
                                red: red,
                                green: green,
                                blue: blue)
                                
                                viewModel.saveEscapeRoom(
                                    escapeRoomId: escapeRoomId,
                                    with: values,
                                    in: managedObjectContext)
                            }*/
                            
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
                .frame(height: geometry.size.height)
            }
        }
    }
}

struct EditorNameImageView_Previews: PreviewProvider {
    static var previews: some View {
        EditorNameImageView(//escapeRoom: getEscapeRoom(),
            red: 0.986, green: 0.102, blue: 0.302)
        .preferredColorScheme(.dark)
    }
    static func getEscapeRoom() -> EscapeRoom {
        let escapeRoom = EscapeRoom(context: CoreDataManager(inMemory: true).persistenceContainer.viewContext)
        
        escapeRoom.name = "La Nevera"
        escapeRoom.image = "DaleAlCoco"
        escapeRoom.averageRating = 4.5
        escapeRoom.featured = true
        escapeRoom.past = true
        escapeRoom.red = 0.000
        escapeRoom.green = 0.991
        escapeRoom.blue = 1.000
        
        return escapeRoom
    }
}
