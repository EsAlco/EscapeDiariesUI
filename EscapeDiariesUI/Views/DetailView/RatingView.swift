//
//  RatingView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 22/3/22.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var selected: Int16
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    
    var body: some View {
        HStack{
            ForEach(0..<5){ i in
                Image(systemName: self.selected >= i ? "star.fill" : "star")
                    .foregroundColor(Color(red: red, green: green, blue: blue))
                    .onTapGesture {
                        self.selected = Int16(i)
                    }
                
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(selected: .constant(1), red: .constant(0.186), green: .constant(0.573), blue: .constant(1.000))
    }
}
