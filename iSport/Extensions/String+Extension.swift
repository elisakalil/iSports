//
//  String+Extension.swift
//  iSport
//
//  Created by Elisa Kalil on 18/05/24.
//

import Foundation

extension String {
    func separatedByDash() -> (String, String)? {
        let components = self.components(separatedBy: "-")
        guard components.count == 2 else { return nil }
        let firstLabel = components[0].trimmingCharacters(in: .whitespaces)
        let secondLabel = components[1].trimmingCharacters(in: .whitespaces)
        return (firstLabel, secondLabel)
    }
    
    func timeStringToSeconds() -> Int? {
        let components = self.components(separatedBy: ":")
        guard components.count == 3,
              let hours = Int(components[0]),
              let minutes = Int(components[1]),
              let seconds = Int(components[2]) else {
            return nil
        }
        
        return (hours * 3600) + (minutes * 60) + seconds
    }
}
