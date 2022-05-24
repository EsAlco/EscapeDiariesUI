//
//  SelectorThemesView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 30/3/22.
//

import SwiftUI

struct SelectorThemesView: View {
    
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    
    @State var showAnimationMint = false
    @State var showAnimationPink = false
    @State var showAnimationYellow = false
    
    var body: some View {
        HStack{
            ZStack {
                Circle()
                    .foregroundColor(.mint)
                    .onTapGesture {
                        red = 0.338
                        green = 0.887
                        blue = 0.858
                        
                        withAnimation(Animation.linear){
                            showAnimationMint = true
                            showAnimationPink = false
                            showAnimationYellow = false
                        }
                    }
                    .padding(3)
                Circle()
                    .stroke(lineWidth: 4)
                    .foregroundColor(.gray)
                    .opacity(showAnimationMint ? 0.5 : 0)
            }
            
            ZStack {
                Circle()
                    .foregroundColor(.pink)
                    .onTapGesture {
                        red = 0.986
                        green = 0.102
                        blue = 0.302
                       
                        withAnimation(Animation.linear){
                            showAnimationMint = false
                            showAnimationPink = true
                            showAnimationYellow = false
                        }
                    }
                    .padding(3)
                Circle()
                    .stroke(lineWidth: 4)
                    .foregroundColor(.gray)
                    .opacity(showAnimationPink ? 0.5 : 0)
            }
            
            ZStack {
                Circle()
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        red = 0.996
                        green = 0.813
                        blue = 0.057
                        
                        withAnimation(Animation.linear){
                            showAnimationMint = false
                            showAnimationPink = false
                            showAnimationYellow = true
                        }
                    }
                    .padding(3)
                Circle()
                    .stroke(lineWidth: 4)
                    .foregroundColor(.gray)
                    .opacity(showAnimationYellow ? 0.5 : 0)
            }
        }
    }
}

struct SelectorThemesView_Previews: PreviewProvider {
    static var previews: some View {
        SelectorThemesView(red: .constant(0.986), green: .constant(0.102), blue: .constant(0.302))
    }
}
