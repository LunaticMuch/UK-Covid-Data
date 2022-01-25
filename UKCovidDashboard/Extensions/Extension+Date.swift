//
//  Extension+String.swift
//  UK Covid Data
//
//  Created by Stefano Cislaghi on 16/01/2022.
//

import Foundation

extension Date {

    func toString(format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
