//
//  DetailViewEscapeRoom.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 21/12/21.
//

import SwiftUI

struct DetailViewEscapeRoom: View {
    
    @Environment (\.presentationMode) var presentationMode
    
    @State private var descriptionScapeRoom = ""
    
    @State var selectedDifficulty: Int = -1
    @State var selectedLineal: Int = -1
    @State var selectedRecreation: Int = -1
    @State var selectedGameMaster: Int = -1
    
    var settings: DetailFactory
    
    var escapeRooms: EscapeRoom
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{

                    Image(escapeRooms.image)
                    
                    DescriptionEscapeRoomView(descriptionScapeRoom: $descriptionScapeRoom)
                    
                    ValuationEscapeRoomView(selectedDifficulty: $selectedDifficulty, selectedLineal: $selectedLineal, selectedRecreation: $selectedRecreation, selectedGameMaster: $selectedGameMaster)
                        .padding(.top)
                    
                    Spacer()
                }
                .padding(.top)
                

            }
            .navigationTitle(escapeRooms.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button (action: {
                        self.settings.description = self.descriptionScapeRoom
                        
                        self.settings.dificulty = self.selectedDifficulty
                        self.settings.lineal = self.selectedLineal
                        self.settings.recreation = self.selectedRecreation
                        self.settings.gameMaster = self.selectedGameMaster
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                            .foregroundColor(.black)
                    })
                }
            }
            .onAppear{
                self.descriptionScapeRoom = self.settings.description
                
                self.selectedDifficulty = self.settings.dificulty
                self.selectedLineal = self.settings.lineal
                self.selectedRecreation = self.settings.recreation
                self.selectedGameMaster = self.settings.gameMaster
            }
        }

    }
}

struct DetailViewEscapeRoom_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewEscapeRoom(settings: DetailFactory(), escapeRooms: EscapeRoom(name:"La Nevera", image: "DaleAlCoco", calification: 5.5, past: true, featured: false))
    }
}

struct DescriptionEscapeRoomView: View {
    
    @Binding var descriptionScapeRoom: String
    
    var body: some View {
        VStack{
            HStack{
                Text("Descripción de la sala:")
                    .font(.system(size: 17, weight: .black, design: .rounded))
                Spacer()
            }.padding(.horizontal)
            
            TextEditor(text: $descriptionScapeRoom)
                .font(.system(size: 14, weight: .bold, design: .rounded))
            //    .multilineTextAlignment(.leading)
                .frame(width: 350, height: 100, alignment:  .topLeading)
                .padding(7)
                .background(Color(hue: 0.436, saturation: 0.101, brightness: 1.0))
                .cornerRadius(8)
                .padding(.horizontal)
            
        }
    }
}

struct ValuationEscapeRoomView: View {
    
    @Binding var selectedDifficulty: Int
    @Binding var selectedLineal: Int
    @Binding var selectedRecreation: Int
    @Binding var selectedGameMaster: Int
    
    var body: some View {
        VStack{
            HStack{
                Text("Valoraciones:")
                    .font(.system(size: 17, weight: .black, design: .rounded))
                Spacer()
                Text("\(AverageRating()) / 5")
                    .foregroundColor(.pink)
            }.padding(.horizontal)
            HStack{
                Text("Dificultdad:")
                Spacer()
                RatingView(selected: $selectedDifficulty)
            }.padding(.horizontal, 30)
            
            HStack{
                Text("Linealidad:")
                Spacer()
                RatingView(selected: $selectedLineal)
            }.padding(.horizontal, 30)
            
            HStack{
                Text("Ambientación:")
                Spacer()
                RatingView(selected: $selectedRecreation)
            }.padding(.horizontal, 30)
            
            HStack{
                Text("Game Master:")
                Spacer()
                RatingView(selected: $selectedGameMaster)
            }.padding(.horizontal, 30)
        }
    }
    
    func AverageRating() -> String{
        let sumRating = selectedDifficulty + selectedLineal + selectedRecreation + selectedGameMaster
        let averageRating =  (Double(sumRating) + 4.0) / 4.0
        return String(format: "%.2f", averageRating)
    }
}
