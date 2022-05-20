//
//  DescriptionView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 29/3/22.
//

import SwiftUI

struct DescriptionView: View {
    
    @Binding var descriptionText: String
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    
    var body: some View {
        VStack{
            HStack{
                Text("Descripción de la sala:")
                    .font(.system(size: 17, weight: .black, design: .rounded))
                Spacer()
            }.padding(.horizontal)
            
            TextEditor(text: $descriptionText)
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .frame(width: 350, height: 100, alignment:  .topLeading)
                .padding(7)
                .background(
                    Color(
                        red: red == 0.000 ? 0.720 : red == 1.000 ? 0.992 : 1.00,
                        green: green == 0.991 ? 1.000 : green == 0.186 ? 0.823 : 0.971,
                        blue: blue == 1.000 ? 0.993 : blue == 0.573 ? 0.884 : 0.707
                    ))
                .cornerRadius(8)
                .padding(.horizontal)
                
            
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(descriptionText: .constant("La sala..."), red: .constant(1.0), green: .constant(0.186), blue: .constant(0.573))
    }
}
