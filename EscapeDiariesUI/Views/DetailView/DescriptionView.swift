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
            }
            
            TextEditor(text: $descriptionText)
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .frame(minHeight: 100)
                .padding(7)
                .background(
                    Color(
                        red: red == 0.338 ? 0.720 : red == 0.986 ? 0.992 : 1.00,
                        green: green == 0.887 ? 1.000 : green == 0.102 ? 0.823 : 0.971,
                        blue: blue == 0.858 ? 0.993 : blue == 0.302 ? 0.884 : 0.707
                    ))
                .cornerRadius(8)
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(descriptionText: .constant("La sala..."), red: .constant(0.986), green: .constant(0.102), blue: .constant(0.302))
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
