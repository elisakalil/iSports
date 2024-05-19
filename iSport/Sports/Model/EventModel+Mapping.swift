//
//  EventModel+Mapping.swift
//  iSport
//
//  Created by Elisa Kalil on 19/05/24.
//

import Foundation

struct EventModel {
    let image: String
    let timestamp: Int
    let description: String
    var isFavorited: Bool
}

extension Event {
    func toEvent() -> EventModel {
        .init(
            image: image,
            timestamp: timestamp,
            description: description,
            isFavorited: false
        )
    }
}
