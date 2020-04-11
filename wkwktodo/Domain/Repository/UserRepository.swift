//
//  UserRepository.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/04/11.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift

class UserRepository {
    static func get() -> Observable<UserObject> {
        return UserDataStore.get()
    }
}
