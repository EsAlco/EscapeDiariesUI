//
//  BlanketView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 23/5/22.
//

import SwiftUI

struct BlanketView: View {
    
    var color: Color
    
    var body: some View {
        VStack{
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
        .background(color)
        .edgesIgnoringSafeArea(.all)
    }
}

struct BlanketView_Previews: PreviewProvider {
    static var previews: some View {
        BlanketView(color: .gray)
    }
}
