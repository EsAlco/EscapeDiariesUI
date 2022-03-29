//
//  DetailViewEscapeRoom.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 21/12/21.
//

import SwiftUI

struct DetailViewEscapeRoom: View {
    
    @Environment (\.presentationMode) var presentationMode
    
    var escapeRoom: EscapeRoom
    
    @Binding var name: String
    @Binding var image: String
    @Binding var description: String
    @Binding var averageRating: Double
    @Binding var difficulty: Int
    @Binding var lineal: Int
    @Binding var recreation: Int
    @Binding var gameMaster: Int
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{

                    ImageView(image: $image)
                    
                    DescriptionView(description: $description)
                    
                    ValuationView(averageRating: $averageRating, difficulty: $difficulty, lineal: $lineal, recreation: $recreation, gameMaster: $gameMaster)
                        .padding(.top)
                    
                    Spacer()
                }
                .padding(.top)
                

            }
            .navigationTitle(escapeRoom.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button (action: {
                        
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                            .foregroundColor(.mint)
                    })
                }
            }
            .onAppear{
                
            }
        }

    }
}

struct DetailViewEscapeRoom_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewEscapeRoom(escapeRoom: EscapeRoom(id: 0, name: "La Nevera", image: "DaleAlCoco",averageRating: 3.5, past: true, featured: false, description: "", difficulty: 2, lineal: 4, recreation: 2, gameMaster: 4), name: .constant(""), image: .constant(""), description: .constant(""), averageRating: .constant(3.75), difficulty: .constant(1), lineal: .constant(1), recreation: .constant(2), gameMaster: .constant(2))
    }
}
