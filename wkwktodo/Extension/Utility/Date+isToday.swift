//
//  Date+isToday.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/25.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation

public extension Date {
    var isToday: Bool {
        return self == Date()
    }
}
