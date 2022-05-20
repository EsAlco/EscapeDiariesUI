//
//  NSColorTransformer.swift
//  EscapeDiariesUI
//
//  Created by Esther Alcoceba Gutiérrez de León on 10/5/22.
//

import Foundation
/*

class NSColorTransformer: ValueTransformer {
    
    override func transformedValue(_ value: Any?) -> Any? {
        
        guard let color = value as? NSColor else { return nil }
        
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
            return color
        }catch{
            return nil
        }
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }
        
        do{
            let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: NSColor.self, from: data)
            return color
        }catch{
            return nil
        }
    }
}
 */
