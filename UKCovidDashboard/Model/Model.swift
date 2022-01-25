//
//  Model.swift
//  UK Covid Data
//
//  Created by Stefano Cislaghi on 09/01/2022.
//

import Foundation

public struct DailyData: Codable {
    var totalRecords: Int
    var data: [DailySnapshot]
}

public struct DailySnapshot: Codable {
    var date: Date
    var cases: Int
    var deaths: Int
    var firstDoses: Double
    var secondDoses: Double
    var thirdDoses: Double

    private enum CodingKeys: String, CodingKey { case date, cases, deaths, firstDoses, secondDoses, thirdDoses }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        date = try container.decode(Date.self, forKey: .date)
        cases = try container.decode(Int.self, forKey: .cases)
        deaths =  (try? container.decode(Int.self, forKey: .deaths)) ?? 0
        firstDoses =  (try? container.decode(Double.self, forKey: .firstDoses)) ?? 0.0
        secondDoses =  (try? container.decode(Double.self, forKey: .secondDoses)) ?? 0.0
        thirdDoses =  (try? container.decode(Double.self, forKey: .thirdDoses)) ?? 0.0
    }
}
