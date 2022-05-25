//
//  ImageView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 29/3/22.
//

import SwiftUI

struct ImageView: View {

    @Binding var image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .padding(40)
            .frame(width: 200, height: 200)
            .padding(25)
            .cornerRadius(100)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: .constant("TheRomboCode"))
            .preferredColorScheme(.light)
    }
}
