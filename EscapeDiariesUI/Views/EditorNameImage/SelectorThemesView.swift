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
                        red = 0.000
                        green = 0.991
                        blue = 1.000
                        
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
                        red = 1.000
                        green = 0.186
                        blue = 0.573
                       
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
                        red = 0.999
                        green = 0.986
                        blue = 0.000
                        
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
        SelectorThemesView(red: .constant(1.000), green: .constant(0.186), blue: .constant(0.573))
    }
}
