//
//  AdjustmentsView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 1/4/22.
//

import SwiftUI

struct AdjustmentsView: View {
    
    @Binding var theme: Color
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            Form{
                Section(header: Text("Selección de tema")){
                    SelectorThemesView(color: $theme)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        self.presentationMode.wrappedValue.dismiss()
                    }label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                            .foregroundColor(theme)
                    }
                }
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
