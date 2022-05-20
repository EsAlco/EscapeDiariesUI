//
//  FeaturedView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 19/5/22.
//

import SwiftUI

struct FeaturedView: View {
    
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    
    @Binding var isFeatured: Bool
    
    var body: some View {
        HStack{
            VStack {
                Text("Favorito:")
                    .font(.system(size: 17, weight: .black, design: .rounded))
                    .padding(2)
                Image(systemName: isFeatured ? "heart.fill" : "heart")
                    .foregroundColor(Color(red: red, green: green, blue: blue))
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                    .onTapGesture {
                        self.isFeatured.toggle()
                    }.padding(.bottom)
            }.padding(.horizontal)
            Spacer()
        }
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView(red: .constant(0.000), green: .constant(0.991), blue: .constant(1.000), isFeatured: .constant(true))
    }
}
