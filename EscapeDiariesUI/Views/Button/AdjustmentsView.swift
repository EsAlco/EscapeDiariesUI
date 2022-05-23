//
//  AdjustmentsView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 1/4/22.
//

import SwiftUI

struct AdjustmentsView: View {
    
    //@Binding var theme: String
    @Binding var redTheme: Double
    @Binding var greenTheme: Double
    @Binding var blueTheme: Double
    
    
    @AppStorage ("appStorageRedTheme") var appStorageRedTheme: Double = 0.338
    @AppStorage ("appStorageGreenTheme") var appStorageGreenTheme: Double = 0.887
    @AppStorage ("appStorageBlueTheme") var appStorageBlueTheme: Double = 0.858
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            Form{
                Section(header: Text("Selección de tema")){
                    SelectorThemesView(red: $redTheme, green: $greenTheme, blue: $blueTheme)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        self.presentationMode.wrappedValue.dismiss()
                        
                        appStorageRedTheme = self.redTheme
                        appStorageGreenTheme = self.greenTheme
                        appStorageBlueTheme = self.blueTheme
                        
                    }label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                            .foregroundColor(Color(red: redTheme, green: greenTheme, blue: blueTheme))
                    }
                }
            }
        }
        .onAppear{
            self.redTheme = appStorageRedTheme
            self.greenTheme = appStorageGreenTheme
            self.blueTheme = appStorageBlueTheme
        }
    }
}

struct AdjustmentsView_Previews: PreviewProvider {
    static var previews: some View {
        AdjustmentsView(redTheme: .constant(0.338), greenTheme: .constant(0.887), blueTheme: .constant(0.858))
    }
}
