//
//  RatingView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 22/3/22.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var selected: Int
    @Binding var color: Color
    
    var body: some View {
        HStack{
            ForEach(0..<5){ i in
                Image(systemName: self.selected >= i ? "star.fill" : "star")
                    .foregroundColor(color)
                    .onTapGesture {
                        self.selected = i
                    }
                
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(selected: .constant(1), color: .constant(.mint))
    }
}
