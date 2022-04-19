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
