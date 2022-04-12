//
//  EditorNameImageView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 30/3/22.
//

import SwiftUI

struct EditorNameImageView: View {
    
    @Environment (\.presentationMode) var presentationMode
    
    @Binding var name: String
    @Binding var color: Color
    @Binding var image: String
    
    var body: some View {
        NavigationView{
            Form{
                Section(){
                    VStack{
                        ImageView(image: $image)

                        NameView(name: $name, color: $color)
                            .foregroundColor(color)
                    }
                    
                }.listRowSeparator(.hidden)
                
                Section(){
                    SelectorThemesView(color: $color)
                }
                
                Section(){
                    withAnimation {
                        SelectorImagesView(image: $image)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            self.presentationMode.wrappedValue.dismiss()
                        }label: {
                            Text("OK")
                                .foregroundColor(color)
                        }
                    }
                    //TODO: botón de cancelar y que no se guarden cambios
                }
            }
        }
    }
}

struct EditorNameImageView_Previews: PreviewProvider {
    static var previews: some View {
        EditorNameImageView(name: .constant("Nombre"), color: .constant(.mint), image: .constant("DaleAlCoco"))
    }
}
