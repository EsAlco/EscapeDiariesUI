//
//  AdjustmentsView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 1/4/22.
//

import SwiftUI

struct AdjustmentsView: View {
    
    //@Binding var theme: String
    @State var red: Double = 0.000
    @State var green: Double = 0.991
    @State var blue: Double = 1.000
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            Form{
                Section(header: Text("Selección de tema")){
                    SelectorThemesView(red: $red, green: $green, blue: $blue)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        self.presentationMode.wrappedValue.dismiss()
                    }label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                            .foregroundColor(Color(red: red, green: green, blue: blue))
                    }
                }
            }
        }
    }
}

struct AdjustmentsView_Previews: PreviewProvider {
    static var previews: some View {
        AdjustmentsView(red: 0.000, green: 0.991, blue: 1.000)
    }
}
