//
//  CrossItemView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 22/3/22.
//

import SwiftUI

struct CrossItemView: View {
    
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            HStack{
                Button (action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .font(.headline)
                        .foregroundColor(.black)
                })
            }
        }
    }
}

struct CrossItemView_Previews: PreviewProvider {
    static var previews: some View {
        CrossItemView()
    }
}
