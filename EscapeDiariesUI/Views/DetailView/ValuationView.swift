//
//  ValuationView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 29/3/22.
//

import SwiftUI

struct ValuationView: View {
    
    @Binding var averageRating: Double
    @Binding var difficulty: Int16
    @Binding var lineal: Int16
    @Binding var recreation: Int16
    @Binding var gameMaster: Int16
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    
    var body: some View {
        VStack{
            HStack{
                Text("Valoraciones:")
                    .font(.system(size: 17, weight: .black, design: .rounded))
                Spacer()
                Text("\(String(format: "%.2f", AverageRating())) / 5")
                    .foregroundColor(Color(red: red, green: green, blue: blue))
                    .padding(.horizontal)
            }.padding(.horizontal)
                .padding(.vertical, 2)
            HStack{
                Text("Dificultdad:")
                Spacer()
                RatingView(selected: $difficulty, red: $red, green: $green, blue: $blue)
            }.padding(.horizontal, 30)
            
            HStack{
                Text("Linealidad:")
                Spacer()
                RatingView(selected: $lineal, red: $red, green: $green, blue: $blue)
            }.padding(.horizontal, 30)
            
            HStack{
                Text("Ambientación:")
                Spacer()
                RatingView(selected: $recreation, red: $red, green: $green, blue: $blue)
            }.padding(.horizontal, 30)
            
            HStack{
                Text("Game Master:")
                Spacer()
                RatingView(selected: $gameMaster, red: $red, green: $green, blue: $blue)
            }.padding(.horizontal, 30)
        }
        .padding(.top)
    }
    
    // Puntuacion de la media de todas las valoraciones
    func AverageRating() -> Double {
        let sumRating = difficulty + lineal + recreation + gameMaster
        averageRating =  (Double(sumRating) + 4.0) / 4.0
        return averageRating
    }
}

struct ValuationView_Previews: PreviewProvider {
    static var previews: some View {
        ValuationView(
            averageRating: .constant(3.75), difficulty: .constant(1), lineal: .constant(2), recreation: .constant(3), gameMaster: .constant(3), red: .constant(1.000), green: .constant(0.186), blue: .constant(0.573))
    }
}
