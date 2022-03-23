//
//  FiltersView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 22/3/22.
//

import SwiftUI

struct FiltersView: View {
    
    @State private var showPurchasedOnly = false
    @State private var showFavoriteOnly = false
    @State private var maxAverageRating = 5 {
        didSet{
            if maxAverageRating > 5{
                maxAverageRating = 5
            }
            if maxAverageRating < 1{
                maxAverageRating = 1
            }
        }
    }
    
    var filter: FilterFactory
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("")){
                    Toggle(isOn: $showPurchasedOnly){
                        Text("Sólo realizados")
                    }.toggleStyle(SwitchToggleStyle(tint: .mint))
                    
                    Toggle(isOn: $showFavoriteOnly){
                        Text("Sólo favoritos")
                    }.toggleStyle(SwitchToggleStyle(tint: .mint))
                    
                    HStack {
                        Text("Mostrar \(String(maxAverageRating)) o menos puntuación")
                        Spacer()
                        Stepper("", onIncrement: {
                            self.maxAverageRating += 1
                            
                        }, onDecrement: {
                            self.maxAverageRating -= 1
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
                        self.filter.purchased = self.showPurchasedOnly
                        self.filter.favorite = self.showFavoriteOnly
                        self.filter.averageRating = self.maxAverageRating
                    }label: {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.mint)
                    }
                }
            }
            .onAppear {
                self.showPurchasedOnly = self.filter.purchased
                self.showFavoriteOnly = self.filter.favorite
                self.maxAverageRating = self.filter.averageRating
            }
        }
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView(filter: FilterFactory())
    }
}
