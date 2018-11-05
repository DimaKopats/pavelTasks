//
//  String+.swift
//  NewsCoreData
//
//  Created by Kopats, Dzmitry(AWF) on 11/5/18.
//  Copyright © 2018 Kopats, Dzmitry(AWF). All rights reserved.
//

import Foundation

extension String {
    func toDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let date = formatter.date(from: self) ?? Date()
        return date
    }
}
