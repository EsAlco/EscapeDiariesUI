//
//  SelectorImagesView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 30/3/22.
//

import SwiftUI

struct SelectorImagesView: View {
    
    @Binding var image: String
    
    @State var showAnimationImage = false
    
    var body: some View {
        HStack{
            VStack{
                withAnimation {
                    Image("DaleAlCoco")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .onTapGesture {
                            self.image = "DaleAlCoco"
                        }
                }
                
            
                withAnimation {
                    Image("FoxInABox")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .onTapGesture {
                            self.image = "FoxInABox"
                        }
                }
                withAnimation {
                    Image("TheRomboCode")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .onTapGesture {
                            self.image = "TheRomboCode"
                        }
                }
            }
            
            VStack{
                withAnimation {
                    Image("Incognito")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .onTapGesture {
                            self.image = "Incognito"
                        }
                }
                withAnimation {
                    Image("FiveMonkeys")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .onTapGesture {
                            self.image = "FiveMonkeys"
                        }
                }
                withAnimation {
                    Image("ExitMadrid")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .onTapGesture {
                            self.image = "ExitMadrid"
                        }
                }
            }
            
            VStack{
                withAnimation {
                    Image("Cubick")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .onTapGesture {
                            self.image = "Cubick"
                        }
                }
                withAnimation {
                    Image("Enigma")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .onTapGesture {
                            self.image = "Enigma"
                        }
                }
                withAnimation {
                    Image("Xkapa")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .onTapGesture {
                            self.image = "Xkapa"
                        }
                }
            }
        }
    }
}

struct SelectorImagesView_Previews: PreviewProvider {
    static var previews: some View {
        SelectorImagesView(image: .constant(""))
    }
}
