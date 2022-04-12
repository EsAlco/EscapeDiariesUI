//
//  SelectorThemesView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 30/3/22.
//

import SwiftUI

struct SelectorThemesView: View {
    
    @Binding var color: Color
    
    @State var showAnimationMint = false
    @State var showAnimationPink = false
    @State var showAnimationYellow = false
    
    var body: some View {
        HStack{
            ZStack {
                Circle()
                    .foregroundColor(.mint)
                    .onTapGesture {
                        color = .mint
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
                        color = .pink
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
                        color = .yellow
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
        SelectorThemesView(color: .constant(.mint))
    }
}
/*
struct CircleButtonView: View {
    
    @Binding var animation: Bool
    @Binding var color: Color
    @State var colorButton: Color
    
    var body: some View {
        
        ZStack {
            Circle()
                .foregroundColor(colorButton)
                .frame(width: 70)
                .onTapGesture {
                    color = colorButton
                    withAnimation(Animation.linear){
                        animation.toggle()
                    }
            }
            Circle()
                .stroke(lineWidth: 9)
                .foregroundColor(.gray)
                .opacity(animation ? 0.5 : 0)
                .frame(width: 80)
        }.padding()
    }
}
CircleButtonView(animation: $showAnimationMint, color: $color, colorButton: .mint)
    
CircleButtonView(animation: $showAnimationPink, color: $color, colorButton: .pink)

CircleButtonView(animation: $showAnimationYellow, color: $color, colorButton: .yellow)
*/
