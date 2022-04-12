//
//  NameView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 29/3/22.
//

import SwiftUI

struct NameView: View {
    
    @Binding var name: String
    @Binding var color: Color
    
    var body: some View {
        HStack{
            TextField("Nombre", text: $name)
                .font(.system(size: 40, weight: .semibold, design: .rounded))
                .multilineTextAlignment(.center)

            if !name.isEmpty{
                Button{
                    self.name = ""
                }label: {
                    Image(systemName: "xmark")
                        .frame(width: 15, height: 15)
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .black, design: .rounded))
                        .padding(4)
                        .background(color)
                        .cornerRadius(15)
                        .padding()
                }
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(color, lineWidth: 2))
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView(name: .constant("Escape Room"), color: .constant(.mint))
    }
}
