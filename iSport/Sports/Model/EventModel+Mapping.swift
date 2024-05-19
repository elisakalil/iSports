//
//  EventModel+Mapping.swift
//  iSport
//
//  Created by Elisa Kalil on 19/05/24.
//

import Foundation

struct EventModel {
    let id: String
    let image: String
    let timestamp: Int
    let description: String
    var isFavorited: Bool
}

extension Event {
    func toEvent() -> EventModel {
        .init(
            id: sportId,
            image: image,
            timestamp: timestamp,
            description: description,
            isFavorited: false
        )
    }
}
