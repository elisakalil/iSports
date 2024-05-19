//
//  SportModel+Mapping.swift
//  iSport
//
//  Created by Elisa Kalil on 19/05/24.
//

import Foundation

struct SportModel {
    let id: String
    let description: String
    var events: [EventModel]
}

extension Sport {
    func toSport() -> SportModel {
        .init(
            id: id,
            description: description,
            events: events.toEvents()
        )
    }
}
