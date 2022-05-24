//
//  SelectorImagesView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 30/3/22.
//

import SwiftUI

struct SelectorImagesView: View {
    
    @Binding var image: String
    
    @State var showAnimationImageDaleAlCoco = false
    @State var showAnimationImageFoxInABox = false
    @State var showAnimationImageTheRomboCode = false
    @State var showAnimationImageIncognito = false
    @State var showAnimationImageFiveMonkeys = false
    @State var showAnimationImageExitMadrid = false
    @State var showAnimationImageCubick = false
    @State var showAnimationImageEnigma = false
    @State var showAnimationImageXkapa = false
    
    var body: some View {
        GeometryReader{ geometry in
            HStack{
                VStack{
                    ZStack{
                        Image("DaleAlCoco")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.25)
                            .cornerRadius(20)
                            .onTapGesture {
                                withAnimation {
                                    self.image = "DaleAlCoco"
                                    
                                    self.showAnimationImageDaleAlCoco = true
                                    self.showAnimationImageTheRomboCode = false
                                    self.showAnimationImageFoxInABox = false
                                    self.showAnimationImageIncognito = false
                                    self.showAnimationImageFiveMonkeys = false
                                    self.showAnimationImageExitMadrid = false
                                    self.showAnimationImageXkapa = false
                                    self.showAnimationImageEnigma = false
                                    self.showAnimationImageCubick = false
                                }
                            }
                        RoundedRectangle(cornerRadius: 20)
                             .stroke(lineWidth: 4)
                             .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.25)
                             .foregroundColor(.gray)
                            .opacity(showAnimationImageDaleAlCoco ? 0.5 : 0)
                    }
                    ZStack{
                        Image("TheRomboCode")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.25)
                            .cornerRadius(20)
                            .onTapGesture {
                                withAnimation {
                                    self.image = "TheRomboCode"
                                    
                                    self.showAnimationImageDaleAlCoco = false
                                    self.showAnimationImageTheRomboCode = true
                                    self.showAnimationImageFoxInABox = false
                                    self.showAnimationImageIncognito = false
                                    self.showAnimationImageFiveMonkeys = false
                                    self.showAnimationImageExitMadrid = false
                                    self.showAnimationImageXkapa = false
                                    self.showAnimationImageEnigma = false
                                    self.showAnimationImageCubick = false
                                }
                            }
                        RoundedRectangle(cornerRadius: 20)
                             .stroke(lineWidth: 4)
                             .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.25)
                             .foregroundColor(.gray)
                            .opacity(showAnimationImageTheRomboCode ? 0.5 : 0)
                    }
                    ZStack{
                        Image("FoxInABox")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.25)
                            .cornerRadius(20)
                            .onTapGesture {
                                withAnimation {
                                    self.image = "FoxInABox"
                                    
                                    self.showAnimationImageDaleAlCoco = false
                                    self.showAnimationImageTheRomboCode = false
                                    self.showAnimationImageFoxInABox = true
                                    self.showAnimationImageIncognito = false
                                    self.showAnimationImageFiveMonkeys = false
                                    self.showAnimationImageExitMadrid = false
                                    self.showAnimationImageXkapa = false
                                    self.showAnimationImageEnigma = false
                                    self.showAnimationImageCubick = false
                                }
                            }
                        RoundedRectangle(cornerRadius: 20)
                             .stroke(lineWidth: 4)
                             .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.25)
                             .foregroundColor(.gray)
                            .opacity(showAnimationImageFoxInABox ? 0.5 : 0)
                    }
                }
                
                VStack{
                    ZStack{
                        Image("Incognito")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.25)
                            .cornerRadius(20)
                            .onTapGesture {
                                withAnimation {
                                    self.image = "Incognito"
                                   
                                    self.showAnimationImageDaleAlCoco = false
                                    self.showAnimationImageTheRomboCode = false
                                    self.showAnimationImageFoxInABox = false
                                    self.showAnimationImageIncognito = true
                                    self.showAnimationImageFiveMonkeys = false
                                    self.showAnimationImageExitMadrid = false
                                    self.showAnimationImageXkapa = false
                                    self.showAnimationImageEnigma = false
                                    self.showAnimationImageCubick = false
                                }
                            }
                        RoundedRectangle(cornerRadius: 20)
                             .stroke(lineWidth: 4)
                             .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.25)
                             .foregroundColor(.gray)
                            .opacity(showAnimationImageIncognito ? 0.5 : 0)
                    }
                    ZStack{
                        Image("FiveMonkeys")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(5)
                            .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.25)
                            .cornerRadius(20)
                            .onTapGesture {
                                withAnimation {
                                    self.image = "FiveMonkeys"
                                    
                                    self.showAnimationImageDaleAlCoco = false
                                    self.showAnimationImageTheRomboCode = false
                                    self.showAnimationImageFoxInABox = false
                                    self.showAnimationImageIncognito = false
                                    self.showAnimationImageFiveMonkeys = true
                                    self.showAnimationImageExitMadrid = false
                                    self.showAnimationImageXkapa = false
                                    self.showAnimationImageEnigma = false
                                    self.showAnimationImageCubick = false
                                }
                            }
                        RoundedRectangle(cornerRadius: 20)
                             .stroke(lineWidth: 4)
                             .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.25)
                             .foregroundColor(.gray)
                            .opacity(showAnimationImageFiveMonkeys ? 0.5 : 0)
                    }
                    ZStack{
                        Image("ExitMadrid")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.25)
                            .cornerRadius(20)
                            .onTapGesture {
                                withAnimation {
                                    self.image = "ExitMadrid"
                                    
                                    self.showAnimationImageDaleAlCoco = false
                                    self.showAnimationImageTheRomboCode = false
                                    self.showAnimationImageFoxInABox = false
                                    self.showAnimationImageIncognito = false
                                    self.showAnimationImageFiveMonkeys = false
                                    self.showAnimationImageExitMadrid = true
                                    self.showAnimationImageXkapa = false
                                    self.showAnimationImageEnigma = false
                                    self.showAnimationImageCubick = false
                                }
                            }
                        RoundedRectangle(cornerRadius: 20)
                             .stroke(lineWidth: 4)
                             .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.25)
                             .foregroundColor(.gray)
                            .opacity(showAnimationImageExitMadrid ? 0.5 : 0)
                    }
                }
                
                VStack{
                    ZStack{
                        Image("Xkapa")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.25)
                            .cornerRadius(20)
                            .onTapGesture {
                                withAnimation {
                                    self.image = "Xkapa"
                                    
                                    self.showAnimationImageDaleAlCoco = false
                                    self.showAnimationImageTheRomboCode = false
                                    self.showAnimationImageFoxInABox = false
                                    self.showAnimationImageIncognito = false
                                    self.showAnimationImageFiveMonkeys = false
                                    self.showAnimationImageExitMadrid = false
                                    self.showAnimationImageXkapa = true
                                    self.showAnimationImageEnigma = false
                                    self.showAnimationImageCubick = false
                                }
                            }
                        RoundedRectangle(cornerRadius: 20)
                             .stroke(lineWidth: 4)
                             .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.25)
                             .foregroundColor(.gray)
                            .opacity(showAnimationImageXkapa ? 0.5 : 0)
                    }
                    ZStack{
                        Image("Enigma")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.25)
                            .cornerRadius(20)
                            .onTapGesture {
                                withAnimation {
                                    self.image = "Enigma"
                                    
                                    self.showAnimationImageDaleAlCoco = false
                                    self.showAnimationImageTheRomboCode = false
                                    self.showAnimationImageFoxInABox = false
                                    self.showAnimationImageIncognito = false
                                    self.showAnimationImageFiveMonkeys = false
                                    self.showAnimationImageExitMadrid = false
                                    self.showAnimationImageXkapa = false
                                    self.showAnimationImageEnigma = true
                                    self.showAnimationImageCubick = false
                                }
                            }
                        RoundedRectangle(cornerRadius: 20)
                             .stroke(lineWidth: 4)
                             .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.25)
                             .foregroundColor(.gray)
                            .opacity(showAnimationImageEnigma ? 0.5 : 0)
                    }
                    ZStack{
                        Image("Cubick")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.25)
                            .cornerRadius(20)
                            .onTapGesture {
                                withAnimation {
                                    self.image = "Cubick"
                                    
                                    self.showAnimationImageDaleAlCoco = false
                                    self.showAnimationImageTheRomboCode = false
                                    self.showAnimationImageFoxInABox = false
                                    self.showAnimationImageIncognito = false
                                    self.showAnimationImageFiveMonkeys = false
                                    self.showAnimationImageExitMadrid = false
                                    self.showAnimationImageXkapa = false
                                    self.showAnimationImageEnigma = false
                                    self.showAnimationImageCubick = true
                                }
                            }
                        RoundedRectangle(cornerRadius: 20)
                             .stroke(lineWidth: 4)
                             .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.25)
                             .foregroundColor(.gray)
                            .opacity(showAnimationImageCubick ? 0.5 : 0)
                    }
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
    }
}

struct SelectorImagesView_Previews: PreviewProvider {
    static var previews: some View {
        SelectorImagesView(image: .constant(""))
    }
}
