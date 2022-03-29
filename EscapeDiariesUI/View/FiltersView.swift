//
//  FiltersView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 22/3/22.
//

import SwiftUI

struct FiltersView: View {
    
    @ObservedObject var filters = FiltersFactory()
    
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
                        .toggleStyle(SwitchToggleStyle(tint: .mint))
                    
                    Toggle("Sólo favoritos", isOn: $showFavoriteOnly)
                        .toggleStyle(SwitchToggleStyle(tint: .mint))
                    
                    HStack {
                        Text("Mostrar \(String(maxAverageRating)) o menos puntuación")
                        Spacer()
                        Stepper("", onIncrement: {
                            self.maxAverageRating += 1.0
                        }, onDecrement: {
                            self.maxAverageRating -= 1.0
                        }).labelsHidden()
                            .background(.mint)
                            .cornerRadius(8)
                    }
                }
            }
            .navigationTitle("Filtros")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        self.filters.past = self.showPastOnly
                        self.filters.favorite = self.showFavoriteOnly
                        self.filters.maxAverageRating = self.maxAverageRating
                        
                        self.filters.objectWillChange.send()
                        
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
            self.showPastOnly = self.filters.past
            self.showFavoriteOnly = self.filters.favorite
            self.maxAverageRating = self.filters.maxAverageRating
        }
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView(filters: FiltersFactory())
    }
}
