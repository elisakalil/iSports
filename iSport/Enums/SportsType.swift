//
//  SportsDomain.swift
//  iSport
//
//  Created by Elisa Kalil on 18/05/24.
//

import Foundation

enum SportType: String {
    case BASKETBALL
    case VOLLEY
    case TENNIS
    case BASEBALL
    case SOCCER
    case SWIMMING
    case BADMINTON
    case TRACK
    
    func fullName() -> String {
        switch self {
        case .BASKETBALL:
            return "Basketball"
        case .VOLLEY:
            return "Volleyball"
        case .TENNIS:
            return "Tennis"
        case .BASEBALL:
            return "Baseball"
        case .SOCCER:
            return "Soccer"
        case .SWIMMING:
            return "Swimming"
        case .BADMINTON:
            return "Badminton"
        case .TRACK:
            return "Track and Field"
        }
    }
}
