//
//  DetailViewEscapeRoom.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 21/12/21.
//

import SwiftUI

struct DetailViewEscapeRoom: View {
    
    @Environment (\.presentationMode) var presentationMode
    
    
    
    var escapeRooms: EscapeRoom
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{

                    Image(escapeRooms.image)
                    
                    DescriptionEscapeRoomView()
                    
                    ValuationEscapeRoomView()
                        .padding(.top)
                    

                    Spacer()
                }
                .padding(.top)
                

            }
            .navigationTitle(escapeRooms.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button (action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                            .foregroundColor(.black)
                    })
                }
            }
            
            
        }

    }
}

struct DetailViewEscapeRoom_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewEscapeRoom(escapeRooms: EscapeRoom(name:"La Nevera", image: "DaleAlCoco", calification: 5.5, past: true, featured: false))
    }
}

struct DescriptionEscapeRoomView: View {
    
    @State private var descriptionScapeRoom = ""
    
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
    @State var selectedDifficulty = -1
    @State var selectedLineal = -1
    @State var selectedRecreation = -1
    @State var selectedGameMaster = -1
    
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
