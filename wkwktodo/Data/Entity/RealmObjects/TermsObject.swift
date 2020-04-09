//
//  Terms.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/14.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RealmSwift

class TermsObject: Object {
    @objc dynamic var minimumRequiredWP: Int = 0
    @objc dynamic var continuousLoginDays: Int = 0
    @objc dynamic var totalLoginDays: Int = 0
    @objc dynamic var totalCompleteTasks: Int = 0
}
