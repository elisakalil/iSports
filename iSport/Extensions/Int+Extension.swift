//
//  Int+Extension.swift
//  iSport
//
//  Created by Elisa Kalil on 18/05/24.
//

import Foundation

extension Int {
    func unixTimeToHHMMSS() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter.string(from: date)
    }
}
