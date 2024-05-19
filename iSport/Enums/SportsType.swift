//
//  SportsDomain.swift
//  iSport
//
//  Created by Elisa Kalil on 18/05/24.
//

import Foundation

enum SportType: String {
    case FOOT
    case BASKT
    case VOLLY
    case TENIS
    case BASEB
    case SOCCR
    case SWIM
    case BDMNT
    case TRCKF
    
    func fullName() -> String {
        switch self {
        case .FOOT:
            return "Football"
        case .BASKT:
            return "Basketball"
        case .VOLLY:
            return "Volleyball"
        case .TENIS:
            return "Tennis"
        case .BASEB:
            return "Baseball"
        case .SOCCR:
            return "Soccer"
        case .SWIM:
            return "Swimming"
        case .BDMNT:
            return "Badminton"
        case .TRCKF:
            return "Track and Field"
        }
    }
}
