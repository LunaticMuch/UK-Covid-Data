//
//  Helper.swift
//  UK Covid Data
//
//  Created by Stefano Cislaghi on 09/01/2022.
//

import Foundation

public func mostRecentCase(array: [DailySnapshot]) -> DailySnapshot {
    let mostRecentCase = array.max(by: {$0.date.timeIntervalSinceReferenceDate < $1.date.timeIntervalSinceReferenceDate})
    return mostRecentCase!
}

public func toJSON(array: [String: Any]) throws -> String {
    let data = try JSONSerialization.data(withJSONObject: array)
    return String(data: data, encoding: .utf8)!
}
