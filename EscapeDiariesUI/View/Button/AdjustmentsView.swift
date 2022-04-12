//
//  AdjustmentsView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 1/4/22.
//

import SwiftUI

struct AdjustmentsView: View {
    
    @Binding var theme: Color
    
    var body: some View {
        
        Form{
            Section(header: Text("Selección de tema")){
                SelectorThemesView(color: $theme)
            }
        }
        
    }
}

struct AdjustmentsView_Previews: PreviewProvider {
    static var previews: some View {
        AdjustmentsView(theme: .constant(.mint))
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
