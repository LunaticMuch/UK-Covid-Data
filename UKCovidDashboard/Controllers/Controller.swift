//
//  Controller.swift
//  UK Covid Data
//
//  Created by Stefano Cislaghi on 09/01/2022.
//

import Foundation
import SwiftUI

class CovidData: ObservableObject {

    @Published var lastSnapshot: DailySnapshot?
    @Published var allSnapshots: [DailySnapshot] = []
    @Published var last60Snapshots: [DailySnapshot] = []

    let dataStructure: [String: Any] = [
        "date": "date",
        "cases": "newCasesByPublishDate",
        "deaths": "newDeaths28DaysByPublishDate",
        "firstDoses": "cumVaccinationFirstDoseUptakeByPublishDatePercentage",
        "secondDoses": "cumVaccinationSecondDoseUptakeByPublishDatePercentage",
        "thirdDoses": "cumVaccinationThirdInjectionUptakeByPublishDatePercentage"]

    init() {
        self.loadData()
    }

    func loadData() {

        var structure: String { get { return try! toJSON(array: dataStructure) }}

        let queryItems = [
            URLQueryItem(name: "filters", value: "areaType=overview"),
            URLQueryItem(name: "structure", value: structure)
        ]

        var url: URL? {
            var components = URLComponents()
            components.scheme = "https"
            components.host = "api.coronavirus.data.gov.uk"
            components.path = "/v1/data"
            components.queryItems = queryItems
            return components.url
        }

        guard let url = url  else {
                        fatalError("INVALID URL")
                      }

            URLSession.shared.dataTask(with: url) {(data, _, error) in
                guard let resData = data, error == nil else {
                    return
                }
                do {
                    let formatter = DateFormatter()
                    formatter.dateFormat = "yyyy-MM-dd"

                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(formatter)

                    let json = try decoder.decode(DailyData.self, from: resData)
                    DispatchQueue.main.async {
                        let allCases = json.data
                        self.allSnapshots = allCases
                        self.lastSnapshot = mostRecentCase(array: allCases)
                        // MARK: - Extract last 30 days
                        let first60Snapshots = allCases[0..<60]
                        self.last60Snapshots = first60Snapshots.reversed()
                    }
                } catch {
                    print(error)
                }
            }.resume()
        }

    }

