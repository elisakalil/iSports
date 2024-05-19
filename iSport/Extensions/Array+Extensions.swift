//
//  Array+Extensions.swift
//  iSport
//
//  Created by Elisa Kalil on 19/05/24.
//

import Foundation

extension Array where Element == Event {
    func toEvents() -> [EventModel] {
        return self.map { $0.toEvent() }
    }
}
