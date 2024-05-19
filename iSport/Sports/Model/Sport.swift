//
//  Models.swift
//  iSport
//
//  Created by Elisa Kalil on 18/05/24.
//

import Foundation

public struct Sport: Decodable {
    public let id: String
    public let description: String
    public let events: [Event]
    
    public  init(id: String, description: String, events: [Event]) {
        self.id = id
        self.description = description
        self.events = events
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "i"
        case description = "d"
        case events = "e"
    }
}

