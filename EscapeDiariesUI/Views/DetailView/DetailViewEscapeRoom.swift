//
//  DetailViewEscapeRoom.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 21/12/21.
//

import SwiftUI
import CoreData

struct DetailViewEscapeRoom: View {
    
    @Environment (\.managedObjectContext) private var managedObjectContext
    
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
    
    @State var showEditorImage: Bool = false
    @State var isPast: Bool = false
    
    var escapeRoomId: NSManagedObjectID?
    let viewModel = AddEscapeRoomViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{

                    ImageView(
                        image: $image
                    )
                    .onTapGesture {
                        self.showEditorImage.toggle()
                    }
                    
                    FeaturedView(
                        red: $red,
                        green: $green,
                        blue: $blue,
                        isFeatured: $featured)
                    
                    DescriptionView(
                        descriptionText: $descriptionText,
                        red: $red,
                        green: $green,
                        blue: $blue
                    )
                    
                    ValuationView(
                        averageRating: $averageRating,
                        difficulty: $difficulty,
                        lineal: $lineal,
                        recreation: $recreation,
                        gameMaster: $gameMaster,
                        red: $red,
                        green: $green,
                        blue: $blue
                    )
                    
                    PastView(
                        red: $red,
                        green: $green,
                        blue: $blue,
                        datePast: $datePast,
                        isPast: $past)
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    TextField("", text: $name)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
 
                    Button (action: {
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
                    
                    }, label: {
                        Text("Guardar")
                            .font(.headline)
                            .foregroundColor(Color(red: red, green: green, blue: blue))
                    })
                    
                    Button (action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Cancel")
                            .font(.headline)
                            .foregroundColor(Color(red: red, green: green, blue: blue))
                    })
                }
            }
            .sheet(isPresented: $showEditorImage) {
                SelectorImagesView(image: $image)
                    
                    
                    
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
        }

    }
}

struct DetailViewEscapeRoom_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewEscapeRoom(name: "La Nevera", image: "AddImage", descriptionText: "", averageRating: 2.0, difficulty: 1, lineal: 1, recreation: 0, gameMaster: 0, featured: false, past: true, datePast: Date.now, red: 1.0, green: 0.186, blue: 0.573)
    }
}
