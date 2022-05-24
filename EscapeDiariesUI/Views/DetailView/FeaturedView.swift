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
    @Binding var isPast: Bool
    
    var body: some View {
        VStack{
            HStack {
                Image(systemName: isFeatured ? "heart.fill" : "heart")
                    .foregroundColor(Color(red: red, green: green, blue: blue))
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                    .onTapGesture {
                        self.isFeatured.toggle()
                    }.padding(.bottom)
                Image(systemName: isPast ? "checkmark.seal.fill" : "checkmark.seal")
                    .foregroundColor(Color(red: red, green: green, blue: blue))
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                    .onTapGesture {
                        self.isPast.toggle()
                    }.padding(.bottom)
            }.padding(.horizontal)
            Spacer()
        }
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView(red: .constant(0.986), green: .constant(0.102), blue: .constant(0.302), isFeatured: .constant(true), isPast: .constant(true))
    }
}
