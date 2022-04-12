//
//  FiltersView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 22/3/22.
//

import SwiftUI

struct FiltersView: View {
    
    @ObservedObject var filtersFactory = FiltersFactory()
    
    @Binding var theme: Color
    
    @State private var showPastOnly = false
    @State private var showFavoriteOnly = false
    @State private var maxAverageRating = 5.0 {
        
        didSet{
            if maxAverageRating > 5.0{
                maxAverageRating = 5.0
            }
            if maxAverageRating < 1.0{
                maxAverageRating = 1.0
            }
        }
    }
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("")){
                    Toggle("Sólo realizados", isOn: $showPastOnly)
                        .toggleStyle(SwitchToggleStyle(tint: theme))
                    
                    Toggle("Sólo favoritos", isOn: $showFavoriteOnly)
                        .toggleStyle(SwitchToggleStyle(tint: theme))
                    
                    HStack {
                        Text("Mostrar \(String(maxAverageRating)) o menos puntuación")
                        Spacer()
                        Stepper("", onIncrement: {
                            self.maxAverageRating += 1.0
                        }, onDecrement: {
                            self.maxAverageRating -= 1.0
                        }).labelsHidden()
                            .background(theme)
                            .cornerRadius(8)
                    }
                }
            }
            .navigationTitle("Filtros")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        self.presentationMode.wrappedValue.dismiss()
                    }label: {
                        Image(systemName: "checkmark.circle")
                            .font(.title)
                            .foregroundColor(.mint)
                    }
                }
            }
        }
        .onAppear {
            self.showPastOnly = self.filtersFactory.past
            self.showFavoriteOnly = self.filtersFactory.favorite
            self.maxAverageRating = self.filtersFactory.maxAverageRating
        }
        .onDisappear{
            self.filtersFactory.past = self.showPastOnly
            self.filtersFactory.favorite = self.showFavoriteOnly
            self.filtersFactory.maxAverageRating = self.maxAverageRating
        }
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView(filtersFactory: FiltersFactory(), theme: .constant(.mint))
    }
}
