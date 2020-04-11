//
//  UserDataStore.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/04/11.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift
import RxRealm
import RealmSwift

class UserDataStore {
    static func get() -> Observable<UserObject> {
        do {
            let realm = try Realm()
            let userResults = realm.objects(UserObject.self)
            return Observable.from(object: userResults.first!)
        } catch {
            return .error(error)
        }
    }
}
