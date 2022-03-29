//
//  DescriptionView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 29/3/22.
//

import SwiftUI

struct DescriptionView: View {
    
    @Binding var description: String
    
    var body: some View {
        VStack{
            HStack{
                Text("Descripción de la sala:")
                    .font(.system(size: 17, weight: .black, design: .rounded))
                Spacer()
            }.padding(.horizontal)
            
            TextEditor(text: $description)
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .frame(width: 350, height: 100, alignment:  .topLeading)
                .padding(7)
                .background(Color(hue: 0.436, saturation: 0.101, brightness: 1.0))
                .cornerRadius(8)
                .padding(.horizontal)
            
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(description: .constant("Hola"))
    }
}
