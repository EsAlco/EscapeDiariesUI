//
//  FiltersView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 22/3/22.
//

import SwiftUI

struct FiltersView: View {
    
    @Binding var theme: Color
    @Binding var showPastOnly: Bool
    @Binding var showFavoriteOnly: Bool
    @Binding var maxAverageRating: Double {
        didSet{
            if maxAverageRating > 5.0{
                maxAverageRating = 5.0
            }
            if maxAverageRating < 1.0{
                maxAverageRating = 1.0
            }
        }
    }
    
    @AppStorage ("appStoragePastOnly") var appStoragePastOnly: Bool = false
    @AppStorage ("appStorageFavoriteOnly") var appStorageFavoriteOnly: Bool = false
    @AppStorage ("appStorageMaxAverageRating") var appStorageMaxAverageRating: Double = 5.0
    
    
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
                        
                        appStoragePastOnly = self.showPastOnly
                        appStorageFavoriteOnly = self.showFavoriteOnly
                        appStorageMaxAverageRating = self.maxAverageRating
                    }label: {
                        Image(systemName: "checkmark.circle")
                            .font(.title)
                            .foregroundColor(theme)
                    }
                }
            }
        }
        .onAppear{
            self.showPastOnly = appStoragePastOnly
            self.showFavoriteOnly = appStorageFavoriteOnly
            self.maxAverageRating = appStorageMaxAverageRating
        }
        
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView(theme: .constant(.mint), showPastOnly: .constant(false), showFavoriteOnly: .constant(false), maxAverageRating: .constant(5.0))
    }
}
