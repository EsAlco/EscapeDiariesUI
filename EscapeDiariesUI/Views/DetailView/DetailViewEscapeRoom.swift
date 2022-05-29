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
     
        GeometryReader{ geometry in
            ZStack {
                NavigationView{
                    ScrollView{
                        ZStack{
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .opacity(0.2)
                            VStack{
                                HStack{
                                    TextField("", text: $name)
                                        .font(.system(size: 40, weight: .bold, design: .rounded))
                                        .foregroundColor(Color(red: red, green: green, blue: blue))
                                        .multilineTextAlignment(.leading)
                                        .minimumScaleFactor(0.5)
                                    Spacer()
                                }
                                ImageView(
                                    image: $image)
                                .onTapGesture {
                                    self.showEditorImage = true
                                }
                                .overlay{
                                    FeaturedView(
                                        red: $red,
                                        green: $green,
                                        blue: $blue,
                                        isFeatured: $featured,
                                        isPast: $past)
                                    .offset(x: geometry.size.width * 0.3, y: geometry.size.height * 0.23)
                                }
                                
                                DescriptionView(
                                    descriptionText: $descriptionText,
                                    red: $red,
                                    green: $green,
                                    blue: $blue)
                                
                                ValuationView(
                                    averageRating: $averageRating,
                                    difficulty: $difficulty,
                                    lineal: $lineal,
                                    recreation: $recreation,
                                    gameMaster: $gameMaster,
                                    red: $red,
                                    green: $green,
                                    blue: $blue)
                                
                                PastView(
                                    red: $red,
                                    green: $green,
                                    blue: $blue,
                                    datePast: $datePast,
                                    isPast: $past)
                            }
                        }
                        
                    }
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9)
                    .toolbar {
                        
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Cancelar"){
                                self.presentationMode.wrappedValue.dismiss()
                            }
                            .font(.headline)
                            .foregroundColor(Color(red: red, green: green, blue: blue))
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Guardar"){
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
                            
                            }
                            .font(.headline)
                            .foregroundColor(Color(red: red, green: green, blue: blue))
                        }
                        
                        ToolbarItem(placement: .bottomBar) {
                            SelectorThemesView(red: $red, green: $green, blue: $blue)
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
                }
                
                if showEditorImage{
                    BlanketView(color: .gray)
                        .opacity(0.5)
                        .onTapGesture {
                            self.showEditorImage = false
                        }
                    ModalSelectorImagesView(image: $image)
                        .transition(.move(edge: .bottom))
                }
            
                
            }
        }
    }
}

struct DetailViewEscapeRoom_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewEscapeRoom(name: "La Nevera", image: "DaleAlCoco", descriptionText: "", averageRating: 2.0, difficulty: 1, lineal: 1, recreation: 0, gameMaster: 0, featured: false, past: true, datePast: Date.now, red: 0.986, green: 0.102, blue: 0.302)
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
    }
}
