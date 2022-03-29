//
//  NameView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 29/3/22.
//

import SwiftUI

struct NameView: View {
    
    @Binding var name: String
    
    var body: some View {
        Text(name)
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView(name: .constant(""))
    }
}
