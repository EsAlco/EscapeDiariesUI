//
//  ValuationView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 29/3/22.
//

import SwiftUI

struct ValuationView: View {
    
    @Binding var averageRating: Double
    @Binding var difficulty: Int
    @Binding var lineal: Int
    @Binding var recreation: Int
    @Binding var gameMaster: Int
    
    var body: some View {
        VStack{
            HStack{
                Text("Valoraciones:")
                    .font(.system(size: 17, weight: .black, design: .rounded))
                Spacer()
                Text("\(AverageRating()) / 5")
                    .foregroundColor(.mint)
                    .padding(.horizontal)
            }.padding(.horizontal)
                .padding(.vertical, 2)
            HStack{
                Text("Dificultdad:")
                Spacer()
                RatingView(selected: $difficulty)
            }.padding(.horizontal, 30)
            
            HStack{
                Text("Linealidad:")
                Spacer()
                RatingView(selected: $lineal)
            }.padding(.horizontal, 30)
            
            HStack{
                Text("Ambientación:")
                Spacer()
                RatingView(selected: $recreation)
            }.padding(.horizontal, 30)
            
            HStack{
                Text("Game Master:")
                Spacer()
                RatingView(selected: $gameMaster)
            }.padding(.horizontal, 30)
        }
    }
    
    // Puntuacion de la media de todas las valoraciones
    func AverageRating() -> String{
        let sumRating = difficulty + lineal + recreation + gameMaster
        averageRating =  (Double(sumRating) + 4.0) / 4.0
        return String(format: "%.2f", averageRating)
    }
}

struct ValuationView_Previews: PreviewProvider {
    static var previews: some View {
        ValuationView(averageRating: .constant(3.75),difficulty: .constant(1), lineal: .constant(2), recreation: .constant(3), gameMaster: .constant(3))
    }
}
