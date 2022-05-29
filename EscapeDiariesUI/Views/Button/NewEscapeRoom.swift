//
//  NewEscapeRoom.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 29/5/22.
//

import SwiftUI
import CoreData

struct NewEscapeRoomView: View {
    
    @Environment(\.managedObjectContext) private var managedObjectContext
    @Environment (\.presentationMode) var presentationMode
    
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

struct NewEscapeRoomView_Previews: PreviewProvider {
    static var previews: some View {
        NewEscapeRoomView(red: 0.986, green: 0.102, blue: 0.302)
        .preferredColorScheme(.dark)
    }
}
