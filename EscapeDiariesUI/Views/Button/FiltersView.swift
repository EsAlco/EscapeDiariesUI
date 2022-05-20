//
//  FiltersView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 22/3/22.
//

import SwiftUI


struct FiltersView: View {
    
    @Binding var redTheme: Double
    @Binding var greenTheme: Double
    @Binding var blueTheme: Double
    @Binding var showPastOnly: Bool
    @Binding var showFeaturedOnly: Bool
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
    @AppStorage ("appStorageFeaturedOnly") var appStorageFeatureOnly: Bool = false
    @AppStorage ("appStorageMaxAverageRating") var appStorageMaxAverageRating: Double = 5.0
    
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("")){
                    Toggle("Sólo realizados", isOn: $showPastOnly)
                        .toggleStyle(SwitchToggleStyle(tint: Color(red: redTheme, green: greenTheme, blue: blueTheme)))
                    
                    Toggle("Sólo favoritos", isOn: $showFeaturedOnly)
                        .toggleStyle(SwitchToggleStyle(tint: Color(red: redTheme, green: greenTheme, blue: blueTheme)))
                    
                    HStack {
                        Text("Mostrar \(String(maxAverageRating)) o menos puntuación")
                        Spacer()
                        Stepper("", onIncrement: {
                            self.maxAverageRating += 1.0
                        }, onDecrement: {
                            self.maxAverageRating -= 1.0
                        }).labelsHidden()
                            .background(Color(red: redTheme, green: greenTheme, blue: blueTheme))
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
                        appStorageFeatureOnly = self.showFeaturedOnly
                        appStorageMaxAverageRating = self.maxAverageRating
                    }label: {
                        Image(systemName: "checkmark.circle")
                            .font(.title)
                            .foregroundColor(Color(red: redTheme, green: greenTheme, blue: blueTheme))
                    }
                }
            }
        }
        .onAppear{
            self.showPastOnly = appStoragePastOnly
            self.showFeaturedOnly = appStorageFeatureOnly
            self.maxAverageRating = appStorageMaxAverageRating
        }
        
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView(redTheme: .constant(0.000), greenTheme: .constant(0.991), blueTheme: .constant(1.000), showPastOnly: .constant(false), showFeaturedOnly: .constant(false), maxAverageRating: .constant(5.0))
    }
}
