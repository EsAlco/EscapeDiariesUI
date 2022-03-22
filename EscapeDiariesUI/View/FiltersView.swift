//
//  FiltersView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 22/3/22.
//

import SwiftUI

struct FiltersView: View {
    
    @State private var showPurchasedOnly = false
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Hola")){
                    Toggle(isOn: $showPurchasedOnly){
                        Text("Realizado")
                    }
                }
            }
            .navigationTitle("Filtros")
        }
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView()
    }
}
