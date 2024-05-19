//
//  Event.swift
//  iSport
//
//  Created by Elisa Kalil on 19/05/24.
//

import Foundation

public struct Event: Decodable {
    public let eventId: String
    public let sportId: String
    public let image: String
    public let description: String
    public let timestamp: Int
    
    public init(eventId: String, sportId: String, image: String, description: String, timestamp: Int) {
        self.eventId = eventId
        self.sportId = sportId
        self.image = image
        self.description = description
        self.timestamp = timestamp
    }
    
    enum CodingKeys: String, CodingKey {
        case eventId = "i"
        case sportId = "si"
        case image = "im"
        case description = "d"
        case timestamp = "tt"
    }
}
