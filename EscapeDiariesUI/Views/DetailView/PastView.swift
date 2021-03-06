//
//  PastView.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 19/5/22.
//

import SwiftUI

struct PastView: View {
    
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    @Binding var datePast: Date
    
    @Binding var isPast: Bool
    
    var body: some View {
        VStack{
            HStack{
                Text("Hecho:")
                    .font(.system(size: 17, weight: .black, design: .rounded))
                    .padding(2)
                Spacer()
            }
            HStack{
                Text(isPast ? "🥳" : "")
                Image(systemName: isPast ? "checkmark.circle" : "xmark.circle")
                    .foregroundColor(Color(red: red, green: green, blue: blue))
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                    .padding(.leading)
                    .onTapGesture {
                        self.isPast.toggle()
                    }
                Spacer()
                
                
                if isPast{
                    DatePicker("", selection: $datePast, displayedComponents: .date)
                }
            }
        }
    }
}

struct PastView_Previews: PreviewProvider {
    static var previews: some View {
        PastView(red: .constant(0.986), green: .constant(0.102), blue: .constant(0.302), datePast: .constant(Date.now), isPast: .constant(true))
    }
}
