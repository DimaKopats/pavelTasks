//
//  Date+.swift
//  NewsCoreData
//
//  Created by Kopats, Dzmitry(AWF) on 11/5/18.
//  Copyright © 2018 Kopats, Dzmitry(AWF). All rights reserved.
//

import Foundation

extension Date {
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let dateString = formatter.string(from: self)
        return dateString
    }
}
